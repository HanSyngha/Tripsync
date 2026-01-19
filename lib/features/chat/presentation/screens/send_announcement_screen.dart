import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../trip/providers/trip_provider.dart';
import '../../providers/chat_provider.dart';

class SendAnnouncementScreen extends ConsumerStatefulWidget {
  final String tripId;

  const SendAnnouncementScreen({
    super.key,
    required this.tripId,
  });

  @override
  ConsumerState<SendAnnouncementScreen> createState() => _SendAnnouncementScreenState();
}

class _SendAnnouncementScreenState extends ConsumerState<SendAnnouncementScreen> {
  final _subjectController = TextEditingController();
  final _messageController = TextEditingController();
  bool _isPinned = false;
  bool _isUrgent = false;
  bool _isSending = false;
  AnnouncementType _selectedType = AnnouncementType.general;

  @override
  void dispose() {
    _subjectController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final tripAsync = ref.watch(tripProvider(widget.tripId));

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.close, color: AppColors.textPrimaryLight),
          onPressed: () => context.pop(),
        ),
        title: Text(
          l10n.newAnnouncement,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimaryLight,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _isSending ? null : _sendAnnouncement,
            child: _isSending
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(
                    l10n.sendNotification,
                    style: const TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ],
      ),
      body: tripAsync.when(
        data: (trip) {
          if (trip == null) {
            return Center(child: Text(l10n.tripNotFound));
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Recipients section
                _buildSectionTitle(l10n.toWhom),
                const SizedBox(height: 12),
                _buildRecipientsCard(l10n),

                const SizedBox(height: 24),

                // Message type section
                _buildSectionTitle(l10n.messageDetails),
                const SizedBox(height: 12),
                _buildTypeSelector(l10n),

                const SizedBox(height: 24),

                // Quick templates
                _buildSectionTitle(l10n.quickTemplates),
                const SizedBox(height: 12),
                _buildQuickTemplates(l10n),

                const SizedBox(height: 24),

                // Subject field
                _buildTextField(
                  label: l10n.subject,
                  hint: l10n.subjectHint,
                  controller: _subjectController,
                  maxLength: 50,
                ),

                const SizedBox(height: 16),

                // Message field
                _buildTextField(
                  label: l10n.message,
                  hint: l10n.messageHint,
                  controller: _messageController,
                  maxLines: 5,
                  maxLength: 500,
                ),

                const SizedBox(height: 24),

                // Options
                _buildOptionsSection(l10n),

                const SizedBox(height: 40),
              ],
            ),
          );
        },
        loading: () => const Center(child: CircularProgressIndicator()),
        error: (error, _) => Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimaryLight,
      ),
    );
  }

  Widget _buildRecipientsCard(AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.primary.withOpacity(0.1),
              borderRadius: BorderRadius.circular(8),
            ),
            child: const Icon(
              Icons.group,
              color: AppColors.primary,
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  l10n.allParticipants,
                  style: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimaryLight,
                  ),
                ),
                Text(
                  'Send to all trip members',
                  style: TextStyle(
                    fontSize: 13,
                    color: AppColors.textMutedLight,
                  ),
                ),
              ],
            ),
          ),
          const Icon(
            Icons.check_circle,
            color: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildTypeSelector(AppLocalizations l10n) {
    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: AnnouncementType.values.map((type) {
        final isSelected = _selectedType == type;
        return GestureDetector(
          onTap: () => setState(() => _selectedType = type),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
            decoration: BoxDecoration(
              color: isSelected ? _getTypeColor(type).withOpacity(0.1) : Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(
                color: isSelected ? _getTypeColor(type) : AppColors.divider,
                width: isSelected ? 2 : 1,
              ),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  _getTypeIcon(type),
                  size: 18,
                  color: isSelected ? _getTypeColor(type) : AppColors.textSecondaryLight,
                ),
                const SizedBox(width: 6),
                Text(
                  _getTypeLabel(type, l10n),
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: isSelected ? FontWeight.w600 : FontWeight.normal,
                    color: isSelected ? _getTypeColor(type) : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildQuickTemplates(AppLocalizations l10n) {
    final templates = [
      (l10n.templateBusLeaving, Icons.directions_bus),
      (l10n.templateMeetingPoint, Icons.location_on),
      (l10n.templateWeather, Icons.wb_cloudy),
      (l10n.templateDinner, Icons.restaurant),
    ];

    return Wrap(
      spacing: 8,
      runSpacing: 8,
      children: templates.map((template) {
        return GestureDetector(
          onTap: () {
            _subjectController.text = template.$1;
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            decoration: BoxDecoration(
              color: AppColors.backgroundLight,
              borderRadius: BorderRadius.circular(16),
              border: Border.all(color: AppColors.divider),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(template.$2, size: 16, color: AppColors.textSecondaryLight),
                const SizedBox(width: 6),
                Text(
                  template.$1,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
        );
      }).toList(),
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    required TextEditingController controller,
    int maxLines = 1,
    int? maxLength,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: controller,
          maxLines: maxLines,
          maxLength: maxLength,
          style: const TextStyle(color: AppColors.textPrimaryLight),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(color: AppColors.textMutedLight),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              borderSide: const BorderSide(color: AppColors.divider),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              borderSide: const BorderSide(color: AppColors.divider),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildOptionsSection(AppLocalizations l10n) {
    return Column(
      children: [
        // Pin to top toggle
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            border: Border.all(color: AppColors.divider),
          ),
          child: Row(
            children: [
              const Icon(Icons.push_pin, color: AppColors.primary),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.pinToTopOfChat,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimaryLight,
                      ),
                    ),
                    Text(
                      l10n.keepVisibleForAll,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textMutedLight,
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: _isPinned,
                onChanged: (value) => setState(() => _isPinned = value),
                activeColor: AppColors.primary,
              ),
            ],
          ),
        ),

        const SizedBox(height: 12),

        // Urgent alert toggle
        Container(
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            border: Border.all(color: _isUrgent ? AppColors.error : AppColors.divider),
          ),
          child: Row(
            children: [
              const Icon(Icons.notifications_active, color: AppColors.error),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.sendAsUrgentAlert,
                      style: const TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600,
                        color: AppColors.textPrimaryLight,
                      ),
                    ),
                    Text(
                      l10n.notifiesEvenIfMuted,
                      style: TextStyle(
                        fontSize: 13,
                        color: AppColors.textMutedLight,
                      ),
                    ),
                  ],
                ),
              ),
              Switch(
                value: _isUrgent,
                onChanged: (value) => setState(() => _isUrgent = value),
                activeColor: AppColors.error,
              ),
            ],
          ),
        ),
      ],
    );
  }

  Color _getTypeColor(AnnouncementType type) {
    switch (type) {
      case AnnouncementType.schedule:
        return AppColors.primary;
      case AnnouncementType.urgent:
        return AppColors.error;
      case AnnouncementType.general:
        return AppColors.success;
      case AnnouncementType.poll:
        return AppColors.warning;
    }
  }

  IconData _getTypeIcon(AnnouncementType type) {
    switch (type) {
      case AnnouncementType.schedule:
        return Icons.schedule;
      case AnnouncementType.urgent:
        return Icons.warning;
      case AnnouncementType.general:
        return Icons.info;
      case AnnouncementType.poll:
        return Icons.poll;
    }
  }

  String _getTypeLabel(AnnouncementType type, AppLocalizations l10n) {
    switch (type) {
      case AnnouncementType.schedule:
        return l10n.nextSchedule;
      case AnnouncementType.urgent:
        return l10n.urgent;
      case AnnouncementType.general:
        return l10n.generalInfo;
      case AnnouncementType.poll:
        return l10n.poll;
    }
  }

  Future<void> _sendAnnouncement() async {
    final l10n = AppLocalizations.of(context)!;

    if (_messageController.text.trim().isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(l10n.pleaseEnterMessage)),
      );
      return;
    }

    setState(() => _isSending = true);

    try {
      final content = _subjectController.text.isNotEmpty
          ? '[${_subjectController.text}] ${_messageController.text}'
          : _messageController.text;

      await ref.read(chatNotifierProvider(widget.tripId).notifier).sendAnnouncement(
        content.trim(),
      );

      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.announcementSentSuccess),
            backgroundColor: AppColors.success,
          ),
        );
        context.pop();
      }
    } catch (e) {
      if (mounted) {
        setState(() => _isSending = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${l10n.error}: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }
}

enum AnnouncementType { schedule, urgent, general, poll }
