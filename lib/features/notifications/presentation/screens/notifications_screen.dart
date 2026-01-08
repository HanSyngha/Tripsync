import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../data/models/notification_model.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../providers/notification_provider.dart';

class NotificationsScreen extends ConsumerStatefulWidget {
  const NotificationsScreen({super.key});

  @override
  ConsumerState<NotificationsScreen> createState() => _NotificationsScreenState();
}

class _NotificationsScreenState extends ConsumerState<NotificationsScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
    _tabController.addListener(_onTabChanged);
  }

  @override
  void dispose() {
    _tabController.removeListener(_onTabChanged);
    _tabController.dispose();
    super.dispose();
  }

  void _onTabChanged() {
    if (!_tabController.indexIsChanging) {
      final filter = _tabController.index == 0
          ? NotificationFilterType.all
          : NotificationFilterType.announcements;
      ref.read(notificationFilterProvider.notifier).state = filter;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final groupedNotifications = ref.watch(groupedNotificationsProvider);
    final currentUser = ref.watch(currentUserProvider);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Check if user is a host (for showing compose button)
    final isHost = currentUser.valueOrNull != null;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: isDarkMode ? AppColors.backgroundDark : AppColors.backgroundLight,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          l10n.notifications,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: () {
              ref.read(notificationNotifierProvider.notifier).markAllAsRead();
            },
            child: Text(
              l10n.markAllAsRead,
              style: TextStyle(
                color: AppColors.primary,
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(48),
          child: Container(
            margin: const EdgeInsets.symmetric(horizontal: 16),
            decoration: BoxDecoration(
              color: isDarkMode ? AppColors.surfaceDark : Colors.grey[200],
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            ),
            padding: const EdgeInsets.all(4),
            child: TabBar(
              controller: _tabController,
              indicator: BoxDecoration(
                color: AppColors.primary,
                borderRadius: BorderRadius.circular(AppTheme.radiusSm),
              ),
              indicatorSize: TabBarIndicatorSize.tab,
              labelColor: Colors.white,
              unselectedLabelColor: isDarkMode
                  ? AppColors.textSecondaryDark
                  : AppColors.textSecondaryLight,
              labelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w600,
              ),
              unselectedLabelStyle: const TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
              dividerColor: Colors.transparent,
              tabs: [
                Tab(text: l10n.all),
                Tab(text: l10n.announcements),
              ],
            ),
          ),
        ),
      ),
      body: groupedNotifications.when(
        data: (grouped) {
          if (grouped.isEmpty) {
            return _buildEmptyState(l10n, isDarkMode);
          }
          return _buildNotificationList(grouped, l10n, isDarkMode);
        },
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (error, _) => Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(l10n.error),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () => ref.refresh(notificationsStreamProvider),
                child: Text(l10n.tryAgain),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: isHost
          ? FloatingActionButton(
              onPressed: () {
                // Navigate to compose announcement screen
                // context.push('/notifications/compose');
              },
              backgroundColor: AppColors.primary,
              child: const Icon(Icons.edit_outlined, color: Colors.white),
            )
          : null,
    );
  }

  Widget _buildEmptyState(AppLocalizations l10n, bool isDarkMode) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.notifications_none_outlined,
              size: 80,
              color: isDarkMode ? Colors.grey[700] : Colors.grey[300],
            ),
            const SizedBox(height: 16),
            Text(
              l10n.noNotifications,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              l10n.youreAllCaughtUp,
              style: TextStyle(
                fontSize: 14,
                color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNotificationList(
    Map<String, List<NotificationModel>> grouped,
    AppLocalizations l10n,
    bool isDarkMode,
  ) {
    final sections = <Widget>[];

    if (grouped.containsKey('today') && grouped['today']!.isNotEmpty) {
      sections.add(_buildDateSection(l10n.today, grouped['today']!, l10n, isDarkMode));
    }

    if (grouped.containsKey('yesterday') && grouped['yesterday']!.isNotEmpty) {
      sections.add(_buildDateSection(l10n.yesterday, grouped['yesterday']!, l10n, isDarkMode));
    }

    if (grouped.containsKey('earlier') && grouped['earlier']!.isNotEmpty) {
      sections.add(_buildDateSection('Earlier', grouped['earlier']!, l10n, isDarkMode));
    }

    return ListView(
      padding: const EdgeInsets.symmetric(vertical: 16),
      children: sections,
    );
  }

  Widget _buildDateSection(
    String title,
    List<NotificationModel> notifications,
    AppLocalizations l10n,
    bool isDarkMode,
  ) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(16, 8, 16, 12),
          child: Text(
            title,
            style: TextStyle(
              fontSize: 13,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
        ),
        ...notifications.map((notification) => _buildNotificationItem(notification, l10n, isDarkMode)),
      ],
    );
  }

  Widget _buildNotificationItem(
    NotificationModel notification,
    AppLocalizations l10n,
    bool isDarkMode,
  ) {
    final isAnnouncement = notification.type == NotificationType.announcement;
    final isUrgent = notification.isUrgent;

    return GestureDetector(
      onTap: () {
        // Mark as read when tapped
        if (!notification.isRead) {
          ref.read(notificationNotifierProvider.notifier).markAsRead(notification.id);
        }
        // Navigate to relevant content based on notification type
        if (notification.tripId != null) {
          context.push('/trip/${notification.tripId}');
        }
      },
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        decoration: BoxDecoration(
          color: isDarkMode ? AppColors.cardDark : Colors.white,
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          border: isUrgent
              ? Border(
                  left: BorderSide(
                    color: AppColors.coral,
                    width: 4,
                  ),
                )
              : null,
          boxShadow: [
            BoxShadow(
              color: Colors.black.withValues(alpha: 0.05),
              blurRadius: 4,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildNotificationIcon(notification, isDarkMode),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        if (isAnnouncement) ...[
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                            decoration: BoxDecoration(
                              color: AppColors.coral.withValues(alpha: 0.1),
                              borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                            ),
                            child: Text(
                              l10n.announcement,
                              style: TextStyle(
                                fontSize: 11,
                                fontWeight: FontWeight.w600,
                                color: AppColors.coral,
                              ),
                            ),
                          ),
                          const SizedBox(width: 8),
                        ],
                        Expanded(
                          child: Text(
                            notification.title,
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: notification.isRead ? FontWeight.w500 : FontWeight.w700,
                              color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                            ),
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        if (!notification.isRead) ...[
                          const SizedBox(width: 8),
                          Container(
                            width: 8,
                            height: 8,
                            decoration: BoxDecoration(
                              color: AppColors.info,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ],
                      ],
                    ),
                    const SizedBox(height: 4),
                    Text(
                      notification.body,
                      style: TextStyle(
                        fontSize: 14,
                        color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        if (notification.tripName != null) ...[
                          Icon(
                            Icons.flight_takeoff_outlined,
                            size: 14,
                            color: isDarkMode ? AppColors.textMutedDark : AppColors.textMutedLight,
                          ),
                          const SizedBox(width: 4),
                          Text(
                            notification.tripName!,
                            style: TextStyle(
                              fontSize: 12,
                              color: isDarkMode ? AppColors.textMutedDark : AppColors.textMutedLight,
                            ),
                          ),
                          const SizedBox(width: 12),
                        ],
                        Text(
                          _formatTimeAgo(notification.createdAt, l10n),
                          style: TextStyle(
                            fontSize: 12,
                            color: isDarkMode ? AppColors.textMutedDark : AppColors.textMutedLight,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNotificationIcon(NotificationModel notification, bool isDarkMode) {
    IconData icon;
    Color iconColor;
    Color bgColor;

    switch (notification.type) {
      case NotificationType.announcement:
        icon = Icons.campaign_outlined;
        iconColor = AppColors.coral;
        bgColor = AppColors.coral.withValues(alpha: 0.1);
        break;
      case NotificationType.locationUpdate:
        icon = Icons.location_on_outlined;
        iconColor = AppColors.primary;
        bgColor = AppColors.primary.withValues(alpha: 0.1);
        break;
      case NotificationType.scheduleUpdate:
        icon = Icons.schedule_outlined;
        iconColor = AppColors.secondary;
        bgColor = AppColors.secondary.withValues(alpha: 0.1);
        break;
      case NotificationType.newMessage:
        icon = Icons.camera_alt_outlined;
        iconColor = AppColors.attractionColor;
        bgColor = AppColors.attractionColor.withValues(alpha: 0.1);
        break;
      case NotificationType.inviteReceived:
        icon = Icons.person_add_outlined;
        iconColor = AppColors.info;
        bgColor = AppColors.info.withValues(alpha: 0.1);
        break;
      case NotificationType.inviteAccepted:
        icon = Icons.check_circle_outline;
        iconColor = AppColors.success;
        bgColor = AppColors.success.withValues(alpha: 0.1);
        break;
      case NotificationType.tripReminder:
        icon = Icons.alarm_outlined;
        iconColor = AppColors.warning;
        bgColor = AppColors.warning.withValues(alpha: 0.1);
        break;
      default:
        icon = Icons.notifications_outlined;
        iconColor = isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight;
        bgColor = isDarkMode ? AppColors.surfaceLighter : Colors.grey[200]!;
    }

    return Container(
      width: 44,
      height: 44,
      decoration: BoxDecoration(
        color: bgColor,
        shape: BoxShape.circle,
      ),
      child: Icon(
        icon,
        size: 22,
        color: iconColor,
      ),
    );
  }

  String _formatTimeAgo(DateTime dateTime, AppLocalizations l10n) {
    final now = DateTime.now();
    final difference = now.difference(dateTime);

    if (difference.inMinutes < 60) {
      return l10n.minutesAgo(difference.inMinutes);
    } else if (difference.inHours < 24) {
      return l10n.hoursAgo(difference.inHours);
    } else {
      return '${dateTime.day}/${dateTime.month}/${dateTime.year}';
    }
  }
}
