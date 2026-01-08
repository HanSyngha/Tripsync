import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/constants/app_constants.dart';

class NotificationModel {
  final String id;
  final String oderId;
  final String? tripId;
  final String? tripName;
  final NotificationType type;
  final String title;
  final String body;
  final String? imageUrl;
  final DateTime createdAt;
  final bool isRead;
  final bool isUrgent;
  final Map<String, dynamic>? data;

  NotificationModel({
    required this.id,
    required this.oderId,
    this.tripId,
    this.tripName,
    required this.type,
    required this.title,
    required this.body,
    this.imageUrl,
    required this.createdAt,
    this.isRead = false,
    this.isUrgent = false,
    this.data,
  });

  factory NotificationModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return NotificationModel(
      id: doc.id,
      oderId: data['userId'] ?? '',
      tripId: data['tripId'],
      tripName: data['tripName'],
      type: NotificationType.values.firstWhere(
        (e) => e.name == data['type'],
        orElse: () => NotificationType.announcement,
      ),
      title: data['title'] ?? '',
      body: data['body'] ?? '',
      imageUrl: data['imageUrl'],
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      isRead: data['isRead'] ?? false,
      isUrgent: data['isUrgent'] ?? false,
      data: data['data'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': oderId,
      'tripId': tripId,
      'tripName': tripName,
      'type': type.name,
      'title': title,
      'body': body,
      'imageUrl': imageUrl,
      'createdAt': Timestamp.fromDate(createdAt),
      'isRead': isRead,
      'isUrgent': isUrgent,
      'data': data,
    };
  }

  NotificationModel copyWith({
    String? id,
    String? oderId,
    String? tripId,
    String? tripName,
    NotificationType? type,
    String? title,
    String? body,
    String? imageUrl,
    DateTime? createdAt,
    bool? isRead,
    bool? isUrgent,
    Map<String, dynamic>? data,
  }) {
    return NotificationModel(
      id: id ?? this.id,
      oderId: oderId ?? this.oderId,
      tripId: tripId ?? this.tripId,
      tripName: tripName ?? this.tripName,
      type: type ?? this.type,
      title: title ?? this.title,
      body: body ?? this.body,
      imageUrl: imageUrl ?? this.imageUrl,
      createdAt: createdAt ?? this.createdAt,
      isRead: isRead ?? this.isRead,
      isUrgent: isUrgent ?? this.isUrgent,
      data: data ?? this.data,
    );
  }
}
