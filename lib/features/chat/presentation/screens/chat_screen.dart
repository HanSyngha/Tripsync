import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/models/message_model.dart';
import '../../../trip/providers/trip_provider.dart';
import '../../providers/chat_provider.dart';
import '../widgets/message_bubble.dart';

/// Main chat screen for trip group chat
class ChatScreen extends ConsumerStatefulWidget {
  final String tripId;

  const ChatScreen({
    super.key,
    required this.tripId,
  });

  @override
  ConsumerState<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends ConsumerState<ChatScreen> {
  final TextEditingController _messageController = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final FocusNode _focusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    // Mark all messages as read when entering chat
    WidgetsBinding.instance.addPostFrameCallback((_) {
      ref.read(chatNotifierProvider(widget.tripId).notifier).markAllAsRead();
    });
  }

  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  void _sendMessage() {
    final content = _messageController.text.trim();
    if (content.isEmpty) return;

    ref.read(chatNotifierProvider(widget.tripId).notifier).sendMessage(content);
    _messageController.clear();

    // Scroll to bottom after sending
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.animateTo(
          _scrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final tripAsync = ref.watch(tripProvider(widget.tripId));
    final participantsAsync = ref.watch(tripParticipantsProvider(widget.tripId));
    final messagesAsync = ref.watch(messagesProvider(widget.tripId));
    final isOrganizerAsync = ref.watch(isOrganizerProvider(widget.tripId));
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: _buildAppBar(context, tripAsync, participantsAsync),
      body: Column(
        children: [
          // Pinned announcement banner
          _buildPinnedAnnouncement(context),
          // Messages list
          Expanded(
            child: messagesAsync.when(
              data: (messages) => _buildMessagesList(context, messages),
              loading: () => const Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
                ),
              ),
              error: (error, stack) => Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.error_outline,
                      size: 48,
                      color: isDark
                          ? AppColors.textMutedDark
                          : AppColors.textMutedLight,
                    ),
                    const SizedBox(height: AppTheme.spacingMd),
                    Text(
                      'Failed to load messages',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isDark
                                ? AppColors.textMutedDark
                                : AppColors.textMutedLight,
                          ),
                    ),
                    const SizedBox(height: AppTheme.spacingSm),
                    TextButton(
                      onPressed: () => ref.refresh(messagesProvider(widget.tripId)),
                      child: Text(AppLocalizations.of(context)!.retry),
                    ),
                  ],
                ),
              ),
            ),
          ),
          // Message input bar
          _buildInputBar(context, isOrganizerAsync.valueOrNull ?? false),
        ],
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(
    BuildContext context,
    AsyncValue tripAsync,
    AsyncValue participantsAsync,
  ) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return AppBar(
      backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios,
          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: tripAsync.when(
        data: (trip) => Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '\u{1F334} ',  // Palm tree emoji
                  style: TextStyle(fontSize: 18),
                ),
                Flexible(
                  child: Text(
                    trip?.name ?? 'Trip Chat',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 2),
            participantsAsync.when(
              data: (participants) {
                final guides = participants.where((p) => p.canManage).length;
                final members = participants.length;
                return Text(
                  '$guides Guide${guides > 1 ? 's' : ''} \u00B7 $members Member${members > 1 ? 's' : ''}',
                  style: Theme.of(context).textTheme.labelSmall?.copyWith(
                        color: isDark
                            ? AppColors.textMutedDark
                            : AppColors.textMutedLight,
                      ),
                );
              },
              loading: () => const SizedBox.shrink(),
              error: (_, __) => const SizedBox.shrink(),
            ),
          ],
        ),
        loading: () => Text(AppLocalizations.of(context)!.loading),
        error: (_, __) => Text(AppLocalizations.of(context)!.chat),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.menu,
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
          onPressed: () => _showChatMenu(context),
        ),
      ],
    );
  }

  Widget _buildPinnedAnnouncement(BuildContext context) {
    final pinnedAsync = ref.watch(pinnedMessagesProvider(widget.tripId));
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return pinnedAsync.when(
      data: (pinned) {
        if (pinned.isEmpty) return const SizedBox.shrink();

        final latestPinned = pinned.first;
        return Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingMd,
            vertical: AppTheme.spacingSm,
          ),
          decoration: BoxDecoration(
            color: AppColors.primary.withValues(alpha: 0.1),
            border: Border(
              bottom: BorderSide(
                color: isDark ? AppColors.dividerDark : AppColors.divider,
              ),
            ),
          ),
          child: Row(
            children: [
              const Icon(
                Icons.push_pin,
                size: 16,
                color: AppColors.primary,
              ),
              const SizedBox(width: AppTheme.spacingSm),
              Expanded(
                child: Text(
                  latestPinned.content,
                  style: Theme.of(context).textTheme.bodySmall?.copyWith(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w500,
                      ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              IconButton(
                icon: const Icon(
                  Icons.close,
                  size: 16,
                  color: AppColors.primary,
                ),
                onPressed: () {
                  // Dismiss pinned announcement locally
                },
                padding: EdgeInsets.zero,
                constraints: const BoxConstraints(),
              ),
            ],
          ),
        );
      },
      loading: () => const SizedBox.shrink(),
      error: (_, __) => const SizedBox.shrink(),
    );
  }

  Widget _buildMessagesList(BuildContext context, List<MessageModel> messages) {
    if (messages.isEmpty) {
      return _buildEmptyState(context);
    }

    final currentUserId = ref.read(chatNotifierProvider(widget.tripId).notifier).userId;

    // Group messages by date
    final groupedMessages = <DateTime, List<MessageModel>>{};
    for (final message in messages) {
      final dateKey = DateTime(
        message.createdAt.year,
        message.createdAt.month,
        message.createdAt.day,
      );
      if (!groupedMessages.containsKey(dateKey)) {
        groupedMessages[dateKey] = [];
      }
      groupedMessages[dateKey]!.add(message);
    }

    // Flatten with date separators
    final items = <dynamic>[];
    final sortedDates = groupedMessages.keys.toList()..sort();

    for (final date in sortedDates) {
      items.add(date);
      items.addAll(groupedMessages[date]!);
    }

    return ListView.builder(
      controller: _scrollController,
      padding: const EdgeInsets.only(bottom: AppTheme.spacingMd),
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];

        if (item is DateTime) {
          return DateSeparator(date: item);
        }

        final message = item as MessageModel;
        final isMe = message.senderId == currentUserId;

        // Determine if we should show sender info
        bool showSenderInfo = true;
        if (index > 0) {
          final prevItem = items[index - 1];
          if (prevItem is MessageModel && prevItem.senderId == message.senderId) {
            // Check if messages are within 5 minutes
            final diff = message.createdAt.difference(prevItem.createdAt);
            if (diff.inMinutes < 5) {
              showSenderInfo = false;
            }
          }
        }

        return MessageBubble(
          message: message,
          isMe: isMe,
          showSenderInfo: showSenderInfo,
          onLocationTap: () => _openLocation(message),
          onImageTap: () => _viewImage(message),
        );
      },
    );
  }

  Widget _buildEmptyState(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Center(
      child: Padding(
        padding: const EdgeInsets.all(AppTheme.spacingXl),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.chat_bubble_outline,
              size: 64,
              color: isDark
                  ? AppColors.textMutedDark.withValues(alpha: 0.5)
                  : AppColors.textMutedLight.withValues(alpha: 0.5),
            ),
            const SizedBox(height: AppTheme.spacingMd),
            Text(
              'No messages yet',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: isDark
                        ? AppColors.textMutedDark
                        : AppColors.textMutedLight,
                  ),
            ),
            const SizedBox(height: AppTheme.spacingSm),
            Text(
              'Start the conversation with your travel group!',
              style: Theme.of(context).textTheme.bodySmall?.copyWith(
                    color: isDark
                        ? AppColors.textMutedDark
                        : AppColors.textMutedLight,
                  ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInputBar(BuildContext context, bool isOrganizer) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      padding: EdgeInsets.only(
        left: AppTheme.spacingMd,
        right: AppTheme.spacingMd,
        top: AppTheme.spacingSm,
        bottom: MediaQuery.of(context).padding.bottom + AppTheme.spacingSm,
      ),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        border: Border(
          top: BorderSide(
            color: isDark ? AppColors.dividerDark : AppColors.divider,
          ),
        ),
      ),
      child: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            // Attachment button
            IconButton(
              icon: Icon(
                Icons.add,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
              onPressed: () => _showAttachmentOptions(context),
            ),
            // Message input field
            Expanded(
              child: Container(
                constraints: const BoxConstraints(maxHeight: 120),
                decoration: BoxDecoration(
                  color: isDark
                      ? AppColors.backgroundDark
                      : AppColors.backgroundLight,
                  borderRadius: BorderRadius.circular(AppTheme.radiusXl),
                ),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: TextField(
                        controller: _messageController,
                        focusNode: _focusNode,
                        maxLines: null,
                        textInputAction: TextInputAction.newline,
                        decoration: InputDecoration(
                          hintText: 'Message...',
                          hintStyle: TextStyle(
                            color: isDark
                                ? AppColors.textMutedDark
                                : AppColors.textMutedLight,
                          ),
                          border: InputBorder.none,
                          contentPadding: const EdgeInsets.symmetric(
                            horizontal: AppTheme.spacingMd,
                            vertical: AppTheme.spacingSm + 2,
                          ),
                        ),
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: isDark
                                  ? AppColors.textPrimaryDark
                                  : AppColors.textPrimaryLight,
                            ),
                        onChanged: (value) {
                          ref.read(messageInputProvider(widget.tripId).notifier).state =
                              value;
                        },
                      ),
                    ),
                    // Emoji button
                    IconButton(
                      icon: Icon(
                        Icons.emoji_emotions_outlined,
                        color: isDark
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
                      ),
                      onPressed: () => _showEmojiPicker(context),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(width: AppTheme.spacingSm),
            // Send button
            GestureDetector(
              onTap: _sendMessage,
              child: Container(
                width: 44,
                height: 44,
                decoration: const BoxDecoration(
                  color: AppColors.primary,
                  shape: BoxShape.circle,
                ),
                child: const Icon(
                  Icons.arrow_upward,
                  color: Colors.white,
                  size: 22,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showChatMenu(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isOrganizer =
        ref.read(isOrganizerProvider(widget.tripId)).valueOrNull ?? false;

    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppTheme.radiusXl),
        ),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: AppTheme.spacingMd),
              decoration: BoxDecoration(
                color: isDark ? AppColors.dividerDark : AppColors.divider,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.people),
              title: Text(AppLocalizations.of(context)!.viewParticipants),
              onTap: () {
                Navigator.pop(context);
                _showParticipants(context);
              },
            ),
            ListTile(
              leading: const Icon(Icons.push_pin),
              title: Text(AppLocalizations.of(context)!.pinnedMessages),
              onTap: () {
                Navigator.pop(context);
                _showPinnedMessages(context);
              },
            ),
            if (isOrganizer)
              ListTile(
                leading: const Icon(Icons.campaign),
                title: Text(AppLocalizations.of(context)!.sendAnnouncement),
                onTap: () {
                  Navigator.pop(context);
                  _navigateToAnnouncement(context);
                },
              ),
            ListTile(
              leading: const Icon(Icons.search),
              title: Text(AppLocalizations.of(context)!.searchMessages),
              onTap: () {
                Navigator.pop(context);
                // Implement search
              },
            ),
            const SizedBox(height: AppTheme.spacingMd),
          ],
        ),
      ),
    );
  }

  void _showAttachmentOptions(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppTheme.radiusXl),
        ),
      ),
      builder: (context) => SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              width: 40,
              height: 4,
              margin: const EdgeInsets.symmetric(vertical: AppTheme.spacingMd),
              decoration: BoxDecoration(
                color: isDark ? AppColors.dividerDark : AppColors.divider,
                borderRadius: BorderRadius.circular(2),
              ),
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(AppTheme.spacingSm),
                decoration: BoxDecoration(
                  color: AppColors.info.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                child: const Icon(Icons.photo, color: AppColors.info),
              ),
              title: Text(AppLocalizations.of(context)!.photo),
              subtitle: Text(AppLocalizations.of(context)!.sharePhotosFromGallery),
              onTap: () {
                Navigator.pop(context);
                _pickImage();
              },
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(AppTheme.spacingSm),
                decoration: BoxDecoration(
                  color: AppColors.success.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                child: const Icon(Icons.camera_alt, color: AppColors.success),
              ),
              title: Text(AppLocalizations.of(context)!.camera),
              subtitle: Text(AppLocalizations.of(context)!.takeNewPhoto),
              onTap: () {
                Navigator.pop(context);
                _takePhoto();
              },
            ),
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(AppTheme.spacingSm),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                child: const Icon(Icons.location_on, color: AppColors.error),
              ),
              title: Text(AppLocalizations.of(context)!.location),
              subtitle: Text(AppLocalizations.of(context)!.shareCurrentLocation),
              onTap: () {
                Navigator.pop(context);
                _shareLocation();
              },
            ),
            const SizedBox(height: AppTheme.spacingMd),
          ],
        ),
      ),
    );
  }

  void _showEmojiPicker(BuildContext context) {
    // TODO: Implement emoji picker
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.featureComingSoon)),
    );
  }

  void _showParticipants(BuildContext context) {
    // TODO: Navigate to participants screen
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.featureComingSoon)),
    );
  }

  void _showPinnedMessages(BuildContext context) {
    // TODO: Show pinned messages sheet
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.featureComingSoon)),
    );
  }

  void _navigateToAnnouncement(BuildContext context) {
    Navigator.of(context).pushNamed(
      '/send-announcement',
      arguments: widget.tripId,
    );
  }

  void _pickImage() {
    // TODO: Implement image picker
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.featureComingSoon)),
    );
  }

  void _takePhoto() {
    // TODO: Implement camera
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.featureComingSoon)),
    );
  }

  void _shareLocation() {
    // TODO: Implement location sharing
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.featureComingSoon)),
    );
  }

  void _openLocation(MessageModel message) {
    // TODO: Open location in maps
    if (message.locationCoordinates != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            '${AppLocalizations.of(context)!.openMap}: ${message.locationName ?? AppLocalizations.of(context)!.location}',
          ),
        ),
      );
    }
  }

  void _viewImage(MessageModel message) {
    // TODO: Show full-screen image viewer
    if (message.imageUrl != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(AppLocalizations.of(context)!.featureComingSoon)),
      );
    }
  }
}
