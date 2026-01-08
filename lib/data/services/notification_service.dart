import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import '../models/notification_model.dart';
import '../../core/constants/app_constants.dart';

class NotificationService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  final FirebaseMessaging _messaging = FirebaseMessaging.instance;
  final FlutterLocalNotificationsPlugin _localNotifications =
      FlutterLocalNotificationsPlugin();

  static const AndroidNotificationChannel _channel = AndroidNotificationChannel(
    'tripsync_channel',
    'TripSync Notifications',
    description: 'Notifications for TripSync app',
    importance: Importance.high,
  );

  CollectionReference<Map<String, dynamic>> _notificationsCollection(String userId) =>
      _firestore.collection('users').doc(userId).collection('notifications');

  // Initialize notifications
  Future<void> initialize() async {
    // Initialize local notifications
    const androidSettings = AndroidInitializationSettings('@mipmap/ic_launcher');
    const iosSettings = DarwinInitializationSettings(
      requestAlertPermission: true,
      requestBadgePermission: true,
      requestSoundPermission: true,
    );

    const initSettings = InitializationSettings(
      android: androidSettings,
      iOS: iosSettings,
    );

    await _localNotifications.initialize(
      initSettings,
      onDidReceiveNotificationResponse: _onNotificationTapped,
    );

    // Create Android notification channel
    await _localNotifications
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(_channel);

    // Handle foreground messages
    FirebaseMessaging.onMessage.listen(_handleForegroundMessage);

    // Handle background message taps
    FirebaseMessaging.onMessageOpenedApp.listen(_handleMessageOpenedApp);

    // Check for initial message (app opened from terminated state)
    final initialMessage = await _messaging.getInitialMessage();
    if (initialMessage != null) {
      _handleMessageOpenedApp(initialMessage);
    }
  }

  // Request notification permissions
  Future<bool> requestPermission() async {
    final settings = await _messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );

    return settings.authorizationStatus == AuthorizationStatus.authorized ||
        settings.authorizationStatus == AuthorizationStatus.provisional;
  }

  // Get FCM token
  Future<String?> getFcmToken() async {
    return await _messaging.getToken();
  }

  // Subscribe to topic
  Future<void> subscribeToTopic(String topic) async {
    await _messaging.subscribeToTopic(topic);
  }

  // Unsubscribe from topic
  Future<void> unsubscribeFromTopic(String topic) async {
    await _messaging.unsubscribeFromTopic(topic);
  }

  // Handle foreground message
  void _handleForegroundMessage(RemoteMessage message) {
    final notification = message.notification;
    if (notification != null) {
      _showLocalNotification(
        title: notification.title ?? '',
        body: notification.body ?? '',
        payload: message.data.toString(),
      );
    }
  }

  // Handle message opened app
  void _handleMessageOpenedApp(RemoteMessage message) {
    // Navigate based on message data
    final data = message.data;
    if (data.containsKey('tripId')) {
      // Navigate to trip details
      // This would be handled by the navigation service
    }
  }

  // On notification tapped
  void _onNotificationTapped(NotificationResponse response) {
    // Handle notification tap
    // This would navigate based on the payload
  }

  // Show local notification
  Future<void> _showLocalNotification({
    required String title,
    required String body,
    String? payload,
  }) async {
    const androidDetails = AndroidNotificationDetails(
      'tripsync_channel',
      'TripSync Notifications',
      channelDescription: 'Notifications for TripSync app',
      importance: Importance.high,
      priority: Priority.high,
      showWhen: true,
    );

    const iosDetails = DarwinNotificationDetails(
      presentAlert: true,
      presentBadge: true,
      presentSound: true,
    );

    const details = NotificationDetails(
      android: androidDetails,
      iOS: iosDetails,
    );

    await _localNotifications.show(
      DateTime.now().millisecondsSinceEpoch ~/ 1000,
      title,
      body,
      details,
      payload: payload,
    );
  }

  // Get user notifications
  Stream<List<NotificationModel>> getUserNotifications(String userId, {int limit = 50}) {
    return _notificationsCollection(userId)
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => NotificationModel.fromFirestore(doc)).toList();
    });
  }

  // Get unread notifications
  Stream<List<NotificationModel>> getUnreadNotifications(String userId) {
    return _notificationsCollection(userId)
        .where('isRead', isEqualTo: false)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => NotificationModel.fromFirestore(doc)).toList();
    });
  }

  // Get unread count
  Stream<int> getUnreadCount(String userId) {
    return _notificationsCollection(userId)
        .where('isRead', isEqualTo: false)
        .snapshots()
        .map((snapshot) => snapshot.docs.length);
  }

  // Mark notification as read
  Future<void> markAsRead(String userId, String notificationId) async {
    await _notificationsCollection(userId).doc(notificationId).update({
      'isRead': true,
    });
  }

  // Mark all notifications as read
  Future<void> markAllAsRead(String userId) async {
    final snapshot = await _notificationsCollection(userId)
        .where('isRead', isEqualTo: false)
        .get();

    final batch = _firestore.batch();
    for (final doc in snapshot.docs) {
      batch.update(doc.reference, {'isRead': true});
    }

    await batch.commit();
  }

  // Delete notification
  Future<void> deleteNotification(String userId, String notificationId) async {
    await _notificationsCollection(userId).doc(notificationId).delete();
  }

  // Delete all notifications
  Future<void> deleteAllNotifications(String userId) async {
    final snapshot = await _notificationsCollection(userId).get();

    final batch = _firestore.batch();
    for (final doc in snapshot.docs) {
      batch.delete(doc.reference);
    }

    await batch.commit();
  }

  // Create notification (server-side typically, but for local testing)
  Future<void> createNotification({
    required String userId,
    String? tripId,
    String? tripName,
    required NotificationType type,
    required String title,
    required String body,
    String? imageUrl,
    bool isUrgent = false,
    Map<String, dynamic>? data,
  }) async {
    final docRef = _notificationsCollection(userId).doc();

    final notification = NotificationModel(
      id: docRef.id,
      oderId: userId,
      tripId: tripId,
      tripName: tripName,
      type: type,
      title: title,
      body: body,
      imageUrl: imageUrl,
      createdAt: DateTime.now(),
      isRead: false,
      isUrgent: isUrgent,
      data: data,
    );

    await docRef.set(notification.toFirestore());
  }
}
