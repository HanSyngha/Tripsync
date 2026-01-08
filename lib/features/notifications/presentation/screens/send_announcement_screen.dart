import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/models/participant_model.dart';
import '../../../trip/providers/trip_provider.dart';
import '../../../chat/providers/chat_provider.dart';

/// Announcement type enum
enum AnnouncementType {
  nextSchedule,
  urgent,
  generalInfo,
}

/// Recipient selection mode
enum RecipientMode {
  allParticipants,
  selectSpecific,
}

/// Send announcement screen for organizers
class SendAnnouncementScreen extends ConsumerStatefulWidget {
  final String tripId;

  const SendAnnouncementScreen({
    super.key,
    required this.tripId,
  });

  @override
  ConsumerState<SendAnnouncementScreen> createState() =>
      _SendAnnouncementScreenState();
}

class _SendAnnouncementScreenState
    extends ConsumerState<SendAnnouncementScreen> {
  final TextEditingController _subjectController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  RecipientMode _recipientMode = RecipientMode.allParticipants;
  AnnouncementType _announcementType = AnnouncementType.nextSchedule;
  final Set<String> _selectedParticipants = {};
  bool _pinToTop = false;
  bool _sendAsUrgent = false;
  String? _attachedPhotoUrl;
  String? _attachedLocationName;

  final List<String> _quickTemplates = [
    'Bus leaving in 10 min',
    'Meeting point changed',
    'Dinner reservation at 7 PM',
    'Free time until 3 PM',
    'Departure delayed by 30 min',
  ];

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  void _sendAnnouncement() {
    final content = _messageController.text.trim();
    if (content.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a message')),
      );
      return;
    }

    // Build full message with subject
    String fullMessage = content;
    if (_subjectController.text.trim().isNotEmpty) {
      fullMessage = '${_subjectController.text.trim()}\n\n$content';
    }

    // Send announcement via chat provider
    ref.read(chatNotifierProvider(widget.tripId).notifier).sendAnnouncement(
          fullMessage,
        );

    // Show success and navigate back
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Announcement sent successfully!'),
        backgroundColor: AppColors.success,
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final participantsAsync =
        ref.watch(tripParticipantsProvider(widget.tripId));

    return Scaffold(
      backgroundColor:
          isDark ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: _buildAppBar(context, isDark),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(AppTheme.spacingMd),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // To whom section
            _buildRecipientSection(context, isDark, participantsAsync),
            const SizedBox(height: AppTheme.spacingLg),

            // Message Details section
            _buildMessageDetailsSection(context, isDark),
            const SizedBox(height: AppTheme.spacingLg),

            // Quick templates
            _buildQuickTemplatesSection(context, isDark),
            const SizedBox(height: AppTheme.spacingLg),

            // Subject input
            _buildSubjectInput(context, isDark),
            const SizedBox(height: AppTheme.spacingMd),

            // Message input
            _buildMessageInput(context, isDark),
            const SizedBox(height: AppTheme.spacingLg),

            // Attachment buttons
            _buildAttachmentButtons(context, isDark),
            const SizedBox(height: AppTheme.spacingLg),

            // Toggle options
            _buildToggleOptions(context, isDark),
            const SizedBox(height: AppTheme.spacingXl),

            // Send button
            _buildSendButton(context),
            const SizedBox(height: AppTheme.spacingMd),
          ],
        ),
      ),
    );
  }

  PreferredSizeWidget _buildAppBar(BuildContext context, bool isDark) {
    return AppBar(
      backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      elevation: 0,
      leading: IconButton(
        icon: Icon(
          Icons.close,
          color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
        ),
        onPressed: () => Navigator.of(context).pop(),
      ),
      title: Text(
        'New Announcement',
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
              fontWeight: FontWeight.bold,
              color:
                  isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
      ),
      centerTitle: true,
      actions: [
        IconButton(
          icon: Icon(
            Icons.visibility_outlined,
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
          onPressed: () => _previewAnnouncement(context),
          tooltip: 'Preview',
        ),
      ],
    );
  }

  Widget _buildRecipientSection(
    BuildContext context,
    bool isDark,
    AsyncValue<List<ParticipantModel>> participantsAsync,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'To whom?',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
        ),
        const SizedBox(height: AppTheme.spacingMd),

        // Toggle buttons
        Container(
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            border: Border.all(
              color: isDark ? AppColors.dividerDark : AppColors.divider,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: _buildRecipientToggle(
                  context,
                  isDark,
                  'All Participants',
                  RecipientMode.allParticipants,
                ),
              ),
              Expanded(
                child: _buildRecipientToggle(
                  context,
                  isDark,
                  'Select Specific',
                  RecipientMode.selectSpecific,
                ),
              ),
            ],
          ),
        ),

        // Selected recipients preview
        if (_recipientMode == RecipientMode.selectSpecific) ...[
          const SizedBox(height: AppTheme.spacingMd),
          participantsAsync.when(
            data: (participants) =>
                _buildParticipantSelector(context, isDark, participants),
            loading: () => const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(AppColors.primary),
              ),
            ),
            error: (_, __) => const Text('Failed to load participants'),
          ),
        ],
      ],
    );
  }

  Widget _buildRecipientToggle(
    BuildContext context,
    bool isDark,
    String label,
    RecipientMode mode,
  ) {
    final isSelected = _recipientMode == mode;

    return GestureDetector(
      onTap: () => setState(() => _recipientMode = mode),
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: AppTheme.spacingSm + 4,
        ),
        decoration: BoxDecoration(
          color: isSelected ? AppColors.primary : Colors.transparent,
          borderRadius: BorderRadius.circular(AppTheme.radiusMd - 2),
        ),
        child: Text(
          label,
          textAlign: TextAlign.center,
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: isSelected
                    ? Colors.white
                    : (isDark
                        ? AppColors.textSecondaryDark
                        : AppColors.textSecondaryLight),
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
        ),
      ),
    );
  }

  Widget _buildParticipantSelector(
    BuildContext context,
    bool isDark,
    List<ParticipantModel> participants,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Selected avatars row
        if (_selectedParticipants.isNotEmpty) ...[
          SizedBox(
            height: 48,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: _selectedParticipants.length,
              itemBuilder: (context, index) {
                final participantId = _selectedParticipants.elementAt(index);
                final participant = participants.firstWhere(
                  (p) => p.oderId == participantId,
                  orElse: () => participants.first,
                );

                return Padding(
                  padding: const EdgeInsets.only(right: AppTheme.spacingSm),
                  child: Stack(
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundColor: AppColors.primary.withValues(alpha: 0.2),
                        backgroundImage: participant.photoUrl != null
                            ? CachedNetworkImageProvider(participant.photoUrl!)
                            : null,
                        child: participant.photoUrl == null
                            ? Text(
                                participant.displayName.isNotEmpty
                                    ? participant.displayName[0].toUpperCase()
                                    : '?',
                                style: const TextStyle(
                                  color: AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            : null,
                      ),
                      Positioned(
                        right: 0,
                        top: 0,
                        child: GestureDetector(
                          onTap: () => setState(() {
                            _selectedParticipants.remove(participantId);
                          }),
                          child: Container(
                            padding: const EdgeInsets.all(2),
                            decoration: const BoxDecoration(
                              color: AppColors.error,
                              shape: BoxShape.circle,
                            ),
                            child: const Icon(
                              Icons.close,
                              size: 12,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
          const SizedBox(height: AppTheme.spacingSm),
        ],

        // Participant selection list
        Container(
          constraints: const BoxConstraints(maxHeight: 200),
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            border: Border.all(
              color: isDark ? AppColors.dividerDark : AppColors.divider,
            ),
          ),
          child: ListView.builder(
            shrinkWrap: true,
            padding: const EdgeInsets.symmetric(vertical: AppTheme.spacingSm),
            itemCount: participants.length,
            itemBuilder: (context, index) {
              final participant = participants[index];
              final isSelected =
                  _selectedParticipants.contains(participant.oderId);

              return ListTile(
                dense: true,
                leading: CircleAvatar(
                  radius: 16,
                  backgroundColor: AppColors.primary.withValues(alpha: 0.2),
                  backgroundImage: participant.photoUrl != null
                      ? CachedNetworkImageProvider(participant.photoUrl!)
                      : null,
                  child: participant.photoUrl == null
                      ? Text(
                          participant.displayName.isNotEmpty
                              ? participant.displayName[0].toUpperCase()
                              : '?',
                          style: const TextStyle(
                            color: AppColors.primary,
                            fontWeight: FontWeight.bold,
                            fontSize: 12,
                          ),
                        )
                      : null,
                ),
                title: Text(
                  participant.displayName,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                ),
                trailing: Checkbox(
                  value: isSelected,
                  onChanged: (value) {
                    setState(() {
                      if (value == true) {
                        _selectedParticipants.add(participant.oderId);
                      } else {
                        _selectedParticipants.remove(participant.oderId);
                      }
                    });
                  },
                  activeColor: AppColors.primary,
                ),
                onTap: () {
                  setState(() {
                    if (isSelected) {
                      _selectedParticipants.remove(participant.oderId);
                    } else {
                      _selectedParticipants.add(participant.oderId);
                    }
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildMessageDetailsSection(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Message Details',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                fontWeight: FontWeight.bold,
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
        ),
        const SizedBox(height: AppTheme.spacingMd),

        // Type chips
        Text(
          'Type',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
        ),
        const SizedBox(height: AppTheme.spacingSm),
        Wrap(
          spacing: AppTheme.spacingSm,
          children: [
            _buildTypeChip(
              context,
              isDark,
              'Next Schedule',
              AnnouncementType.nextSchedule,
              AppColors.primary,
            ),
            _buildTypeChip(
              context,
              isDark,
              'Urgent',
              AnnouncementType.urgent,
              AppColors.error,
            ),
            _buildTypeChip(
              context,
              isDark,
              'General Info',
              AnnouncementType.generalInfo,
              AppColors.info,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTypeChip(
    BuildContext context,
    bool isDark,
    String label,
    AnnouncementType type,
    Color color,
  ) {
    final isSelected = _announcementType == type;

    return FilterChip(
      selected: isSelected,
      label: Text(label),
      labelStyle: TextStyle(
        color: isSelected ? Colors.white : color,
        fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
        fontSize: 12,
      ),
      backgroundColor: color.withValues(alpha: 0.1),
      selectedColor: color,
      checkmarkColor: Colors.white,
      padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingSm),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(AppTheme.radiusFull),
        side: BorderSide(
          color: isSelected ? color : color.withValues(alpha: 0.3),
        ),
      ),
      onSelected: (selected) {
        setState(() => _announcementType = type);
      },
    );
  }

  Widget _buildQuickTemplatesSection(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Quick Templates',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
        ),
        const SizedBox(height: AppTheme.spacingSm),
        Wrap(
          spacing: AppTheme.spacingSm,
          runSpacing: AppTheme.spacingSm,
          children: _quickTemplates.map((template) {
            return ActionChip(
              label: Text(
                template,
                style: Theme.of(context).textTheme.bodySmall?.copyWith(
                      color: isDark
                          ? AppColors.textPrimaryDark
                          : AppColors.textPrimaryLight,
                    ),
              ),
              backgroundColor:
                  isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusFull),
                side: BorderSide(
                  color: isDark ? AppColors.dividerDark : AppColors.divider,
                ),
              ),
              onPressed: () {
                _messageController.text = template;
              },
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildSubjectInput(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Subject (Optional)',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
        ),
        const SizedBox(height: AppTheme.spacingSm),
        TextField(
          controller: _subjectController,
          decoration: InputDecoration(
            hintText: 'Enter subject...',
            filled: true,
            fillColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              borderSide: BorderSide(
                color: isDark ? AppColors.dividerDark : AppColors.divider,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              borderSide: BorderSide(
                color: isDark ? AppColors.dividerDark : AppColors.divider,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
        ),
      ],
    );
  }

  Widget _buildMessageInput(BuildContext context, bool isDark) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Message',
          style: Theme.of(context).textTheme.labelMedium?.copyWith(
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
        ),
        const SizedBox(height: AppTheme.spacingSm),
        TextField(
          controller: _messageController,
          maxLines: 5,
          minLines: 3,
          decoration: InputDecoration(
            hintText: 'Type your message here...',
            filled: true,
            fillColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              borderSide: BorderSide(
                color: isDark ? AppColors.dividerDark : AppColors.divider,
              ),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              borderSide: BorderSide(
                color: isDark ? AppColors.dividerDark : AppColors.divider,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: isDark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
        ),
      ],
    );
  }

  Widget _buildAttachmentButtons(BuildContext context, bool isDark) {
    return Row(
      children: [
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _addPhoto(),
            icon: Icon(
              _attachedPhotoUrl != null ? Icons.check_circle : Icons.photo,
              color: _attachedPhotoUrl != null
                  ? AppColors.success
                  : AppColors.primary,
            ),
            label: Text(
              _attachedPhotoUrl != null ? 'Photo Added' : 'Add Photo',
              style: TextStyle(
                color: _attachedPhotoUrl != null
                    ? AppColors.success
                    : AppColors.primary,
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: AppTheme.spacingMd,
              ),
              side: BorderSide(
                color: _attachedPhotoUrl != null
                    ? AppColors.success
                    : AppColors.primary,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              ),
            ),
          ),
        ),
        const SizedBox(width: AppTheme.spacingMd),
        Expanded(
          child: OutlinedButton.icon(
            onPressed: () => _addLocation(),
            icon: Icon(
              _attachedLocationName != null
                  ? Icons.check_circle
                  : Icons.location_on,
              color: _attachedLocationName != null
                  ? AppColors.success
                  : AppColors.primary,
            ),
            label: Text(
              _attachedLocationName != null ? 'Location Added' : 'Add Location',
              style: TextStyle(
                color: _attachedLocationName != null
                    ? AppColors.success
                    : AppColors.primary,
              ),
            ),
            style: OutlinedButton.styleFrom(
              padding: const EdgeInsets.symmetric(
                vertical: AppTheme.spacingMd,
              ),
              side: BorderSide(
                color: _attachedLocationName != null
                    ? AppColors.success
                    : AppColors.primary,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildToggleOptions(BuildContext context, bool isDark) {
    return Column(
      children: [
        // Pin to top toggle
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingMd,
            vertical: AppTheme.spacingSm,
          ),
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            border: Border.all(
              color: isDark ? AppColors.dividerDark : AppColors.divider,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.push_pin,
                size: 20,
                color: isDark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
              const SizedBox(width: AppTheme.spacingMd),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Pin to top of chat',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      'Message will stay visible at the top',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: isDark
                                ? AppColors.textMutedDark
                                : AppColors.textMutedLight,
                          ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: _pinToTop,
                onChanged: (value) => setState(() => _pinToTop = value),
                activeColor: AppColors.primary,
              ),
            ],
          ),
        ),
        const SizedBox(height: AppTheme.spacingSm),

        // Send as urgent toggle
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: AppTheme.spacingMd,
            vertical: AppTheme.spacingSm,
          ),
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            border: Border.all(
              color: isDark ? AppColors.dividerDark : AppColors.divider,
            ),
          ),
          child: Row(
            children: [
              Icon(
                Icons.warning_amber,
                size: 20,
                color: AppColors.warning,
              ),
              const SizedBox(width: AppTheme.spacingMd),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Send as Urgent Alert',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight,
                            fontWeight: FontWeight.w500,
                          ),
                    ),
                    Text(
                      'Send push notification to all recipients',
                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                            color: isDark
                                ? AppColors.textMutedDark
                                : AppColors.textMutedLight,
                          ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: _sendAsUrgent,
                onChanged: (value) => setState(() => _sendAsUrgent = value),
                activeColor: AppColors.warning,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildSendButton(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: _sendAnnouncement,
        style: ElevatedButton.styleFrom(
          backgroundColor: AppColors.primary,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(
            vertical: AppTheme.spacingMd,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          ),
        ),
        child: Text(
          'Send Notification',
          style: Theme.of(context).textTheme.titleSmall?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }

  void _previewAnnouncement(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: isDark ? AppColors.surfaceDark : AppColors.surfaceLight,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(AppTheme.radiusXl),
        ),
      ),
      builder: (context) => Padding(
        padding: const EdgeInsets.all(AppTheme.spacingLg),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: isDark ? AppColors.dividerDark : AppColors.divider,
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
            ),
            const SizedBox(height: AppTheme.spacingMd),
            Text(
              'Preview',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(height: AppTheme.spacingMd),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(AppTheme.spacingMd),
              decoration: BoxDecoration(
                color: const Color(0xFFE0F7FA),
                borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        _sendAsUrgent ? Icons.warning_amber : Icons.campaign,
                        size: 16,
                        color: _sendAsUrgent
                            ? AppColors.warning
                            : AppColors.primary,
                      ),
                      const SizedBox(width: AppTheme.spacingSm),
                      Text(
                        _sendAsUrgent ? 'URGENT' : 'ANNOUNCEMENT',
                        style:
                            Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: _sendAsUrgent
                                      ? AppColors.warning
                                      : AppColors.primary,
                                  fontWeight: FontWeight.bold,
                                ),
                      ),
                    ],
                  ),
                  if (_subjectController.text.isNotEmpty) ...[
                    const SizedBox(height: AppTheme.spacingSm),
                    Text(
                      _subjectController.text,
                      style: Theme.of(context).textTheme.titleSmall?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimaryLight,
                          ),
                    ),
                  ],
                  const SizedBox(height: AppTheme.spacingSm),
                  Text(
                    _messageController.text.isEmpty
                        ? 'Your message will appear here...'
                        : _messageController.text,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: AppColors.textPrimaryLight,
                        ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: AppTheme.spacingLg),
          ],
        ),
      ),
    );
  }

  void _addPhoto() {
    // TODO: Implement image picker
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Photo picker coming soon!')),
    );
  }

  void _addLocation() {
    // TODO: Implement location picker
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Location picker coming soon!')),
    );
  }
}
