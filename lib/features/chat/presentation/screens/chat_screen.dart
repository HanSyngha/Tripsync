import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:geolocator/geolocator.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:go_router/go_router.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'dart:io';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/models/message_model.dart';
import '../../../../data/models/participant_model.dart';
import '../../../../data/models/report_model.dart';
import '../../../../data/models/trip_model.dart';
import '../../../../data/services/report_service.dart';
import '../../../auth/providers/auth_provider.dart';
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
  final ReportService _reportService = ReportService();

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
    AsyncValue<TripModel?> tripAsync,
    AsyncValue<List<ParticipantModel>> participantsAsync,
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
                            ? AppColors.textSecondaryDark
                            : AppColors.textSecondaryLight,
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
          onLongPress: isMe ? null : () => _showMessageOptions(context, message),
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
    final isDark = Theme.of(context).brightness == Brightness.dark;

    // Common emojis for travel
    final emojis = [
      '😀', '😊', '😍', '🥳', '😎', '🤩', '😇', '🥰',
      '👍', '👏', '🙌', '❤️', '🔥', '✨', '💯', '🎉',
      '✈️', '🚗', '🚆', '🚢', '🏨', '🏖️', '🏔️', '🗺️',
      '📸', '🎒', '🧳', '☀️', '🌙', '⭐', '🌈', '🌴',
      '🍽️', '☕', '🍺', '🍷', '🍕', '🍜', '🍣', '🍦',
      '👋', '🙏', '💪', '🎵', '📍', '⏰', '💰', '🎁',
    ];

    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppTheme.radiusXl)),
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
            Padding(
              padding: const EdgeInsets.all(AppTheme.spacingMd),
              child: GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 8,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                ),
                itemCount: emojis.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                      _messageController.text += emojis[index];
                      _messageController.selection = TextSelection.fromPosition(
                        TextPosition(offset: _messageController.text.length),
                      );
                    },
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Center(
                        child: Text(
                          emojis[index],
                          style: const TextStyle(fontSize: 24),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            const SizedBox(height: AppTheme.spacingMd),
          ],
        ),
      ),
    );
  }

  void _showParticipants(BuildContext context) {
    context.push('/trip/${widget.tripId}/participants');
  }

  void _showPinnedMessages(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final pinnedAsync = ref.read(pinnedMessagesProvider(widget.tripId));
    final l10n = AppLocalizations.of(context)!;

    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(AppTheme.radiusXl)),
      ),
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.6,
        minChildSize: 0.3,
        maxChildSize: 0.9,
        expand: false,
        builder: (context, scrollController) => Column(
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
              child: Row(
                children: [
                  const Icon(Icons.push_pin, color: AppColors.primary),
                  const SizedBox(width: 8),
                  Text(
                    l10n.pinnedMessages,
                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppTheme.spacingMd),
            Expanded(
              child: pinnedAsync.when(
                data: (messages) {
                  if (messages.isEmpty) {
                    return Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.push_pin_outlined,
                            size: 48,
                            color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                          ),
                          const SizedBox(height: AppTheme.spacingMd),
                          Text(
                            l10n.noPinnedMessages,
                            style: TextStyle(
                              color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return ListView.builder(
                    controller: scrollController,
                    itemCount: messages.length,
                    padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
                    itemBuilder: (context, index) {
                      final message = messages[index];
                      return Card(
                        margin: const EdgeInsets.only(bottom: AppTheme.spacingSm),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: AppColors.primary.withOpacity(0.2),
                            child: Text(
                              message.senderName.isNotEmpty ? message.senderName[0].toUpperCase() : '?',
                              style: const TextStyle(color: AppColors.primary),
                            ),
                          ),
                          title: Text(message.senderName),
                          subtitle: Text(
                            message.content,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                      );
                    },
                  );
                },
                loading: () => const Center(child: CircularProgressIndicator()),
                error: (_, __) => Center(child: Text(l10n.error)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _navigateToAnnouncement(BuildContext context) {
    context.push('/trip/${widget.tripId}/announcement');
  }

  Future<void> _pickImage() async {
    final l10n = AppLocalizations.of(context)!;

    try {
      final ImagePicker picker = ImagePicker();
      final XFile? image = await picker.pickImage(
        source: ImageSource.gallery,
        imageQuality: 70,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (image != null) {
        await _uploadAndSendImage(File(image.path));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${l10n.error}: $e')),
        );
      }
    }
  }

  Future<void> _takePhoto() async {
    final l10n = AppLocalizations.of(context)!;

    try {
      final ImagePicker picker = ImagePicker();
      final XFile? photo = await picker.pickImage(
        source: ImageSource.camera,
        imageQuality: 70,
        maxWidth: 1024,
        maxHeight: 1024,
      );

      if (photo != null) {
        await _uploadAndSendImage(File(photo.path));
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${l10n.error}: $e')),
        );
      }
    }
  }

  Future<void> _uploadAndSendImage(File imageFile) async {
    final l10n = AppLocalizations.of(context)!;

    // Show loading indicator
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: CircularProgressIndicator(),
      ),
    );

    try {
      // Upload to Firebase Storage
      final fileName = 'chat_${widget.tripId}_${DateTime.now().millisecondsSinceEpoch}.jpg';
      final storageRef = FirebaseStorage.instance
          .ref()
          .child('chat_images')
          .child(widget.tripId)
          .child(fileName);

      await storageRef.putFile(imageFile);
      final imageUrl = await storageRef.getDownloadURL();

      // Send image message
      await ref.read(chatNotifierProvider(widget.tripId).notifier).sendImage(
        imageUrl: imageUrl,
      );

      if (mounted) {
        Navigator.pop(context); // Close loading dialog
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context); // Close loading dialog
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${l10n.uploadFailed}: $e')),
        );
      }
    }
  }

  Future<void> _shareLocation() async {
    final l10n = AppLocalizations.of(context)!;

    try {
      // Check location permission
      LocationPermission permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        permission = await Geolocator.requestPermission();
        if (permission == LocationPermission.denied) {
          if (mounted) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.locationPermissionDenied)),
            );
          }
          return;
        }
      }

      if (permission == LocationPermission.deniedForever) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.locationPermissionDeniedForever)),
          );
        }
        return;
      }

      // Check if location services are enabled
      bool serviceEnabled = await Geolocator.isLocationServiceEnabled();
      if (!serviceEnabled) {
        if (mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text(l10n.locationServicesDisabled)),
          );
        }
        return;
      }

      // Show loading
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => Center(
          child: Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const CircularProgressIndicator(),
                const SizedBox(height: 16),
                Text(l10n.gettingLocation),
              ],
            ),
          ),
        ),
      );

      // Get current position
      final position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high,
      );

      if (mounted) {
        Navigator.pop(context); // Close loading dialog
      }

      // Show confirmation dialog
      if (mounted) {
        final confirmed = await showDialog<bool>(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(l10n.shareLocation),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(l10n.shareLocationConfirmation),
                const SizedBox(height: 12),
                Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.location_on, color: AppColors.primary),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          '${position.latitude.toStringAsFixed(6)}, ${position.longitude.toStringAsFixed(6)}',
                          style: const TextStyle(fontFamily: 'monospace'),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context, false),
                child: Text(l10n.cancel),
              ),
              ElevatedButton(
                onPressed: () => Navigator.pop(context, true),
                style: ElevatedButton.styleFrom(backgroundColor: AppColors.primary),
                child: Text(l10n.share),
              ),
            ],
          ),
        );

        if (confirmed == true) {
          await ref.read(chatNotifierProvider(widget.tripId).notifier).sendLocation(
            latitude: position.latitude,
            longitude: position.longitude,
            locationName: l10n.currentLocation,
          );
        }
      }
    } catch (e) {
      if (mounted) {
        Navigator.pop(context); // Close loading dialog if open
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('${l10n.error}: $e')),
        );
      }
    }
  }

  void _openLocation(MessageModel message) {
    if (message.locationCoordinates != null) {
      final lat = message.locationCoordinates!.latitude;
      final lng = message.locationCoordinates!.longitude;
      final locationName = message.locationName ?? 'Location';

      showModalBottomSheet(
        context: context,
        builder: (context) => SafeArea(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                margin: const EdgeInsets.symmetric(vertical: AppTheme.spacingMd),
                decoration: BoxDecoration(
                  color: AppColors.divider,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: AppColors.primary.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.location_on, color: AppColors.primary),
                ),
                title: Text(locationName),
                subtitle: Text('$lat, $lng'),
              ),
              const Divider(),
              ListTile(
                leading: const Icon(Icons.map_outlined),
                title: Text(AppLocalizations.of(context)!.openInGoogleMaps),
                onTap: () async {
                  Navigator.pop(context);
                  final url = Uri.parse(
                    'https://www.google.com/maps/search/?api=1&query=$lat,$lng',
                  );
                  // Use url_launcher to open
                  try {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } catch (e) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Could not open maps: $e')),
                      );
                    }
                  }
                },
              ),
              ListTile(
                leading: const Icon(Icons.directions),
                title: Text(AppLocalizations.of(context)!.getDirections),
                onTap: () async {
                  Navigator.pop(context);
                  final url = Uri.parse(
                    'https://www.google.com/maps/dir/?api=1&destination=$lat,$lng',
                  );
                  try {
                    await launchUrl(url, mode: LaunchMode.externalApplication);
                  } catch (e) {
                    if (mounted) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text('Could not open maps: $e')),
                      );
                    }
                  }
                },
              ),
              const SizedBox(height: AppTheme.spacingMd),
            ],
          ),
        ),
      );
    }
  }

  void _viewImage(MessageModel message) {
    if (message.imageUrl != null) {
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => _FullScreenImageViewer(
            imageUrl: message.imageUrl!,
            senderName: message.senderName,
          ),
        ),
      );
    }
  }

  void _showMessageOptions(BuildContext context, MessageModel message) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

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
            // Message info header
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
              child: Row(
                children: [
                  CircleAvatar(
                    radius: 20,
                    backgroundColor: AppColors.primary.withValues(alpha: 0.2),
                    child: Text(
                      message.senderName.isNotEmpty
                          ? message.senderName[0].toUpperCase()
                          : '?',
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  const SizedBox(width: AppTheme.spacingMd),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          message.senderName,
                          style: Theme.of(context).textTheme.titleMedium?.copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                        ),
                        Text(
                          message.content.length > 50
                              ? '${message.content.substring(0, 50)}...'
                              : message.content,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                                color: isDark
                                    ? AppColors.textMutedDark
                                    : AppColors.textMutedLight,
                              ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppTheme.spacingMd),
            const Divider(height: 1),
            // Report message
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(AppTheme.spacingSm),
                decoration: BoxDecoration(
                  color: AppColors.warning.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                child: const Icon(Icons.flag_outlined, color: AppColors.warning),
              ),
              title: Text(l10n.reportMessage),
              subtitle: Text(l10n.reportMessageDescription),
              onTap: () {
                Navigator.pop(context);
                _showReportDialog(context, message);
              },
            ),
            // Block user
            ListTile(
              leading: Container(
                padding: const EdgeInsets.all(AppTheme.spacingSm),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                ),
                child: const Icon(Icons.block, color: AppColors.error),
              ),
              title: Text(l10n.blockUser),
              subtitle: Text(l10n.blockUserDescription),
              onTap: () {
                Navigator.pop(context);
                _showBlockConfirmation(context, message);
              },
            ),
            const SizedBox(height: AppTheme.spacingMd),
          ],
        ),
      ),
    );
  }

  void _showReportDialog(BuildContext context, MessageModel message) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;
    ReportType? selectedType;
    final descriptionController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
          title: Text(l10n.reportMessage),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.selectReportReason,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontWeight: FontWeight.w500,
                      ),
                ),
                const SizedBox(height: AppTheme.spacingMd),
                ...ReportType.values.map((type) => RadioListTile<ReportType>(
                      title: Text(_getReportTypeLabel(type, l10n)),
                      value: type,
                      groupValue: selectedType,
                      onChanged: (value) => setState(() => selectedType = value),
                      contentPadding: EdgeInsets.zero,
                      dense: true,
                    )),
                const SizedBox(height: AppTheme.spacingMd),
                TextField(
                  controller: descriptionController,
                  decoration: InputDecoration(
                    labelText: l10n.additionalDetails,
                    hintText: l10n.optionalDescription,
                    border: const OutlineInputBorder(),
                  ),
                  maxLines: 3,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(l10n.cancel),
            ),
            ElevatedButton(
              onPressed: selectedType == null
                  ? null
                  : () => _submitReport(
                        context,
                        message,
                        selectedType!,
                        descriptionController.text,
                      ),
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.warning,
              ),
              child: Text(l10n.report),
            ),
          ],
        ),
      ),
    );
  }

  String _getReportTypeLabel(ReportType type, AppLocalizations l10n) {
    switch (type) {
      case ReportType.spam:
        return l10n.reportTypeSpam;
      case ReportType.harassment:
        return l10n.reportTypeHarassment;
      case ReportType.inappropriateContent:
        return l10n.reportTypeInappropriate;
      case ReportType.hateSpeech:
        return l10n.reportTypeHateSpeech;
      case ReportType.violence:
        return l10n.reportTypeViolence;
      case ReportType.other:
        return l10n.reportTypeOther;
    }
  }

  Future<void> _submitReport(
    BuildContext context,
    MessageModel message,
    ReportType type,
    String description,
  ) async {
    final l10n = AppLocalizations.of(context)!;
    final currentUser = ref.read(currentUserProvider).valueOrNull;

    if (currentUser == null) return;

    Navigator.pop(context);

    try {
      await _reportService.submitReport(
        tripId: widget.tripId,
        reporterId: currentUser.id,
        reporterName: currentUser.displayName,
        targetId: message.id,
        targetType: ReportTargetType.message,
        targetUserId: message.senderId,
        targetUserName: message.senderName,
        reportType: type,
        description: description.isNotEmpty ? description : null,
        messageContent: message.content,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.reportSubmitted),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.reportFailed),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }

  void _showBlockConfirmation(BuildContext context, MessageModel message) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
        title: Text(l10n.blockUser),
        content: Text(
          l10n.blockUserConfirmation(message.senderName),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () => _blockUser(context, message),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
            ),
            child: Text(l10n.block),
          ),
        ],
      ),
    );
  }

  Future<void> _blockUser(BuildContext context, MessageModel message) async {
    final l10n = AppLocalizations.of(context)!;
    final currentUser = ref.read(currentUserProvider).valueOrNull;

    if (currentUser == null) return;

    Navigator.pop(context);

    try {
      await _reportService.blockUser(
        currentUserId: currentUser.id,
        blockedUserId: message.senderId,
        blockedUserName: message.senderName,
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.userBlocked(message.senderName)),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.blockFailed),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }
}

/// Full screen image viewer widget
class _FullScreenImageViewer extends StatelessWidget {
  final String imageUrl;
  final String senderName;

  const _FullScreenImageViewer({
    required this.imageUrl,
    required this.senderName,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white),
        title: Text(
          senderName,
          style: const TextStyle(color: Colors.white),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.download),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Download feature coming soon')),
              );
            },
          ),
          IconButton(
            icon: const Icon(Icons.share),
            onPressed: () async {
              try {
                await launchUrl(Uri.parse(imageUrl), mode: LaunchMode.externalApplication);
              } catch (e) {
                if (context.mounted) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text('Could not share: $e')),
                  );
                }
              }
            },
          ),
        ],
      ),
      body: Center(
        child: InteractiveViewer(
          panEnabled: true,
          minScale: 0.5,
          maxScale: 4.0,
          child: CachedNetworkImage(
            imageUrl: imageUrl,
            fit: BoxFit.contain,
            placeholder: (context, url) => const Center(
              child: CircularProgressIndicator(color: Colors.white),
            ),
            errorWidget: (context, url, error) => const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.error, color: Colors.white, size: 48),
                SizedBox(height: 16),
                Text(
                  'Failed to load image',
                  style: TextStyle(color: Colors.white),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
