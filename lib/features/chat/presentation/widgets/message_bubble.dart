import 'package:flutter/material.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../data/models/message_model.dart';

/// Message bubble widget that displays different styles based on sender type
class MessageBubble extends StatelessWidget {
  final MessageModel message;
  final bool isMe;
  final bool showSenderInfo;
  final VoidCallback? onLocationTap;
  final VoidCallback? onImageTap;

  const MessageBubble({
    super.key,
    required this.message,
    required this.isMe,
    this.showSenderInfo = true,
    this.onLocationTap,
    this.onImageTap,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: EdgeInsets.only(
        left: isMe ? 64 : AppTheme.spacingMd,
        right: isMe ? AppTheme.spacingMd : 64,
        top: AppTheme.spacingXs,
        bottom: AppTheme.spacingXs,
      ),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          if (showSenderInfo && !isMe) _buildSenderInfo(context),
          Row(
            mainAxisAlignment:
                isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              if (!isMe) ...[
                _buildAvatar(context),
                const SizedBox(width: AppTheme.spacingSm),
              ],
              Flexible(
                child: _buildBubble(context, isDark),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingXs),
          _buildTimestamp(context),
        ],
      ),
    );
  }

  Widget _buildSenderInfo(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 48,
        bottom: AppTheme.spacingXs,
      ),
      child: Row(
        children: [
          Text(
            message.senderName,
            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                  fontWeight: FontWeight.w600,
                  color: Theme.of(context).brightness == Brightness.dark
                      ? AppColors.textSecondaryDark
                      : AppColors.textSecondaryLight,
                ),
          ),
          if (message.isOrganizer) ...[
            const SizedBox(width: AppTheme.spacingSm),
            _buildOrganizerBadge(context),
          ],
        ],
      ),
    );
  }

  Widget _buildOrganizerBadge(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingSm,
        vertical: 2,
      ),
      decoration: BoxDecoration(
        color: AppColors.primary.withValues(alpha: 0.15),
        borderRadius: BorderRadius.circular(AppTheme.radiusXs),
      ),
      child: Text(
        'GUIDE',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
              color: AppColors.primary,
              fontWeight: FontWeight.bold,
              letterSpacing: 0.5,
            ),
      ),
    );
  }

  Widget _buildAvatar(BuildContext context) {
    return CircleAvatar(
      radius: 16,
      backgroundColor: message.isOrganizer
          ? AppColors.primary.withValues(alpha: 0.2)
          : AppColors.divider,
      backgroundImage: message.senderPhotoUrl != null
          ? CachedNetworkImageProvider(message.senderPhotoUrl!)
          : null,
      child: message.senderPhotoUrl == null
          ? Text(
              message.senderName.isNotEmpty
                  ? message.senderName[0].toUpperCase()
                  : '?',
              style: TextStyle(
                color: message.isOrganizer
                    ? AppColors.primary
                    : AppColors.textSecondaryLight,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
            )
          : null,
    );
  }

  Widget _buildBubble(BuildContext context, bool isDark) {
    Color backgroundColor;
    Color textColor;
    BorderRadius borderRadius;

    if (isMe) {
      // User's own messages - dark teal
      backgroundColor = AppColors.primary;
      textColor = Colors.white;
      borderRadius = const BorderRadius.only(
        topLeft: Radius.circular(AppTheme.radiusLg),
        topRight: Radius.circular(AppTheme.radiusLg),
        bottomLeft: Radius.circular(AppTheme.radiusLg),
        bottomRight: Radius.circular(AppTheme.radiusXs),
      );
    } else if (message.isOrganizer) {
      // Organizer messages - teal/cyan background
      backgroundColor = const Color(0xFFE0F7FA);
      textColor = AppColors.textPrimaryLight;
      borderRadius = const BorderRadius.only(
        topLeft: Radius.circular(AppTheme.radiusXs),
        topRight: Radius.circular(AppTheme.radiusLg),
        bottomLeft: Radius.circular(AppTheme.radiusLg),
        bottomRight: Radius.circular(AppTheme.radiusLg),
      );
    } else {
      // Other participants - white/light gray
      backgroundColor =
          isDark ? AppColors.surfaceDark : AppColors.surfaceLight;
      textColor = isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight;
      borderRadius = const BorderRadius.only(
        topLeft: Radius.circular(AppTheme.radiusXs),
        topRight: Radius.circular(AppTheme.radiusLg),
        bottomLeft: Radius.circular(AppTheme.radiusLg),
        bottomRight: Radius.circular(AppTheme.radiusLg),
      );
    }

    return Container(
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: borderRadius,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 1),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: borderRadius,
        child: _buildMessageContent(context, textColor),
      ),
    );
  }

  Widget _buildMessageContent(BuildContext context, Color textColor) {
    switch (message.type) {
      case MessageType.image:
        return _buildImageMessage(context, textColor);
      case MessageType.location:
        return _buildLocationMessage(context, textColor);
      case MessageType.announcement:
        return _buildAnnouncementMessage(context, textColor);
      case MessageType.text:
      case MessageType.systemMessage:
      default:
        return _buildTextMessage(context, textColor);
    }
  }

  Widget _buildTextMessage(BuildContext context, Color textColor) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: AppTheme.spacingMd,
        vertical: AppTheme.spacingSm + 2,
      ),
      child: Text(
        message.content,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: textColor,
              height: 1.4,
            ),
      ),
    );
  }

  Widget _buildImageMessage(BuildContext context, Color textColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (message.imageUrl != null)
          GestureDetector(
            onTap: onImageTap,
            child: ClipRRect(
              borderRadius: BorderRadius.circular(AppTheme.radiusSm),
              child: CachedNetworkImage(
                imageUrl: message.imageUrl!,
                width: 200,
                height: 150,
                fit: BoxFit.cover,
                placeholder: (context, url) => Container(
                  width: 200,
                  height: 150,
                  color: AppColors.shimmerBase,
                  child: const Center(
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor:
                          AlwaysStoppedAnimation<Color>(AppColors.primary),
                    ),
                  ),
                ),
                errorWidget: (context, url, error) => Container(
                  width: 200,
                  height: 150,
                  color: AppColors.shimmerBase,
                  child: const Icon(Icons.broken_image, color: AppColors.error),
                ),
              ),
            ),
          ),
        if (message.content.isNotEmpty)
          Padding(
            padding: const EdgeInsets.all(AppTheme.spacingSm),
            child: Text(
              message.content,
              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    color: textColor,
                  ),
            ),
          ),
      ],
    );
  }

  Widget _buildLocationMessage(BuildContext context, Color textColor) {
    return GestureDetector(
      onTap: onLocationTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Map preview placeholder
          Container(
            width: 220,
            height: 120,
            decoration: BoxDecoration(
              color: AppColors.shimmerBase,
              image: const DecorationImage(
                image: AssetImage('assets/images/map_placeholder.png'),
                fit: BoxFit.cover,
              ),
            ),
            child: Stack(
              children: [
                // Gradient overlay
                Container(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.3),
                      ],
                    ),
                  ),
                ),
                // Center pin icon
                const Center(
                  child: Icon(
                    Icons.location_on,
                    color: AppColors.error,
                    size: 36,
                  ),
                ),
              ],
            ),
          ),
          // Location info bar
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: AppTheme.spacingMd,
              vertical: AppTheme.spacingSm,
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.location_on,
                  size: 16,
                  color: textColor.withValues(alpha: 0.7),
                ),
                const SizedBox(width: AppTheme.spacingXs),
                Flexible(
                  child: Text(
                    message.locationName ?? 'Shared Location',
                    style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: textColor,
                          fontWeight: FontWeight.w500,
                        ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
                const SizedBox(width: AppTheme.spacingSm),
                Icon(
                  Icons.chevron_right,
                  size: 18,
                  color: textColor.withValues(alpha: 0.7),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAnnouncementMessage(BuildContext context, Color textColor) {
    return Container(
      padding: const EdgeInsets.all(AppTheme.spacingMd),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                message.isUrgent ? Icons.warning_amber : Icons.campaign,
                size: 18,
                color: message.isUrgent ? AppColors.warning : AppColors.primary,
              ),
              const SizedBox(width: AppTheme.spacingSm),
              Text(
                message.isUrgent ? 'URGENT' : 'ANNOUNCEMENT',
                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                      color:
                          message.isUrgent ? AppColors.warning : AppColors.primary,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 0.5,
                    ),
              ),
            ],
          ),
          const SizedBox(height: AppTheme.spacingSm),
          Text(
            message.content,
            style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.w500,
                  height: 1.4,
                ),
          ),
        ],
      ),
    );
  }

  Widget _buildTimestamp(BuildContext context) {
    final timeString = _formatTime(message.createdAt);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Row(
      mainAxisAlignment:
          isMe ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (!isMe) const SizedBox(width: 48),
        Text(
          timeString,
          style: Theme.of(context).textTheme.labelSmall?.copyWith(
                color: isDark
                    ? AppColors.textMutedDark
                    : AppColors.textMutedLight,
              ),
        ),
        if (isMe) ...[
          const SizedBox(width: AppTheme.spacingXs),
          _buildReadReceipt(context),
        ],
      ],
    );
  }

  Widget _buildReadReceipt(BuildContext context) {
    // Double check marks for read status
    final isRead = message.readBy.length > 1;
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(
          isRead ? Icons.done_all : Icons.done,
          size: 14,
          color: isRead ? AppColors.primary : AppColors.textMutedLight,
        ),
      ],
    );
  }

  String _formatTime(DateTime dateTime) {
    final hour = dateTime.hour;
    final minute = dateTime.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final hour12 = hour == 0 ? 12 : (hour > 12 ? hour - 12 : hour);
    return '$hour12:$minute $period';
  }
}

/// Date separator widget for chat
class DateSeparator extends StatelessWidget {
  final DateTime date;

  const DateSeparator({
    super.key,
    required this.date,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppTheme.spacingMd,
        horizontal: AppTheme.spacingMd,
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              height: 1,
              color: isDark ? AppColors.dividerDark : AppColors.divider,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppTheme.spacingMd),
            child: Text(
              _formatDate(date),
              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                    color: isDark
                        ? AppColors.textMutedDark
                        : AppColors.textMutedLight,
                    fontWeight: FontWeight.w500,
                  ),
            ),
          ),
          Expanded(
            child: Container(
              height: 1,
              color: isDark ? AppColors.dividerDark : AppColors.divider,
            ),
          ),
        ],
      ),
    );
  }

  String _formatDate(DateTime date) {
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));
    final dateOnly = DateTime(date.year, date.month, date.day);

    if (dateOnly == today) {
      return 'Today, ${_monthName(date.month)} ${date.day}';
    } else if (dateOnly == yesterday) {
      return 'Yesterday, ${_monthName(date.month)} ${date.day}';
    } else {
      return '${_dayName(date.weekday)}, ${_monthName(date.month)} ${date.day}';
    }
  }

  String _monthName(int month) {
    const months = [
      'Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'
    ];
    return months[month - 1];
  }

  String _dayName(int weekday) {
    const days = ['Mon', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat', 'Sun'];
    return days[weekday - 1];
  }
}
