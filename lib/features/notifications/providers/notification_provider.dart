import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/notification_model.dart';
import '../../../data/services/notification_service.dart';
import '../../auth/providers/auth_provider.dart';
import '../../../core/constants/app_constants.dart';

/// Provider for notification service
final notificationServiceProvider = Provider<NotificationService>((ref) {
  return NotificationService();
});

/// Stream provider for user notifications
final notificationsStreamProvider = StreamProvider<List<NotificationModel>>((ref) {
  final authState = ref.watch(authStateProvider);
  final user = authState.valueOrNull;

  if (user == null) return Stream.value([]);

  final notificationService = ref.read(notificationServiceProvider);
  return notificationService.getUserNotifications(user.uid);
});

/// Stream provider for unread notifications
final unreadNotificationsProvider = StreamProvider<List<NotificationModel>>((ref) {
  final authState = ref.watch(authStateProvider);
  final user = authState.valueOrNull;

  if (user == null) return Stream.value([]);

  final notificationService = ref.read(notificationServiceProvider);
  return notificationService.getUnreadNotifications(user.uid);
});

/// Stream provider for unread notification count
final unreadCountProvider = StreamProvider<int>((ref) {
  final authState = ref.watch(authStateProvider);
  final user = authState.valueOrNull;

  if (user == null) return Stream.value(0);

  final notificationService = ref.read(notificationServiceProvider);
  return notificationService.getUnreadCount(user.uid);
});

/// Provider for filtered notifications (by type)
final notificationFilterProvider = StateProvider<NotificationFilterType>((ref) {
  return NotificationFilterType.all;
});

/// Filtered notifications based on selected filter
final filteredNotificationsProvider = Provider<AsyncValue<List<NotificationModel>>>((ref) {
  final notifications = ref.watch(notificationsStreamProvider);
  final filter = ref.watch(notificationFilterProvider);

  return notifications.whenData((notificationList) {
    if (filter == NotificationFilterType.all) {
      return notificationList;
    } else if (filter == NotificationFilterType.announcements) {
      return notificationList.where((n) => n.type == NotificationType.announcement).toList();
    }
    return notificationList;
  });
});

/// Grouped notifications by date
final groupedNotificationsProvider = Provider<AsyncValue<Map<String, List<NotificationModel>>>>((ref) {
  final filtered = ref.watch(filteredNotificationsProvider);

  return filtered.whenData((notifications) {
    final Map<String, List<NotificationModel>> grouped = {};
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final yesterday = today.subtract(const Duration(days: 1));

    for (final notification in notifications) {
      final notificationDate = DateTime(
        notification.createdAt.year,
        notification.createdAt.month,
        notification.createdAt.day,
      );

      String key;
      if (notificationDate == today) {
        key = 'today';
      } else if (notificationDate == yesterday) {
        key = 'yesterday';
      } else {
        key = 'earlier';
      }

      grouped.putIfAbsent(key, () => []);
      grouped[key]!.add(notification);
    }

    return grouped;
  });
});

/// Notification filter types
enum NotificationFilterType {
  all,
  announcements,
}

/// Notification notifier for actions
class NotificationNotifier extends StateNotifier<AsyncValue<void>> {
  final NotificationService _notificationService;
  final String? _userId;

  NotificationNotifier(this._notificationService, this._userId)
      : super(const AsyncValue.data(null));

  /// Request notification permission
  Future<bool> requestPermission() async {
    state = const AsyncValue.loading();
    try {
      final granted = await _notificationService.requestPermission();
      state = const AsyncValue.data(null);
      return granted;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  /// Mark a single notification as read
  Future<void> markAsRead(String notificationId) async {
    final userId = _userId;
    if (userId == null) return;

    state = const AsyncValue.loading();
    try {
      await _notificationService.markAsRead(userId, notificationId);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Mark all notifications as read
  Future<void> markAllAsRead() async {
    final userId = _userId;
    if (userId == null) return;

    state = const AsyncValue.loading();
    try {
      await _notificationService.markAllAsRead(userId);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Delete a notification
  Future<void> deleteNotification(String notificationId) async {
    final userId = _userId;
    if (userId == null) return;

    state = const AsyncValue.loading();
    try {
      await _notificationService.deleteNotification(userId, notificationId);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Delete all notifications
  Future<void> deleteAllNotifications() async {
    final userId = _userId;
    if (userId == null) return;

    state = const AsyncValue.loading();
    try {
      await _notificationService.deleteAllNotifications(userId);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

/// Provider for notification actions
final notificationNotifierProvider = StateNotifierProvider<NotificationNotifier, AsyncValue<void>>((ref) {
  final authState = ref.watch(authStateProvider);
  final user = authState.valueOrNull;
  final notificationService = ref.read(notificationServiceProvider);

  return NotificationNotifier(notificationService, user?.uid);
});
