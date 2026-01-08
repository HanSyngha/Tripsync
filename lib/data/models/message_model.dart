import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/constants/app_constants.dart';

class MessageModel {
  final String id;
  final String tripId;
  final String senderId;
  final String senderName;
  final String? senderPhotoUrl;
  final bool isOrganizer;
  final MessageType type;
  final String content;
  final String? imageUrl;
  final GeoPoint? locationCoordinates;
  final String? locationName;
  final DateTime createdAt;
  final bool isPinned;
  final bool isUrgent;
  final List<String> readBy;

  MessageModel({
    required this.id,
    required this.tripId,
    required this.senderId,
    required this.senderName,
    this.senderPhotoUrl,
    this.isOrganizer = false,
    required this.type,
    required this.content,
    this.imageUrl,
    this.locationCoordinates,
    this.locationName,
    required this.createdAt,
    this.isPinned = false,
    this.isUrgent = false,
    this.readBy = const [],
  });

  bool isReadBy(String oderId) => readBy.contains(oderId);

  factory MessageModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return MessageModel(
      id: doc.id,
      tripId: data['tripId'] ?? '',
      senderId: data['senderId'] ?? '',
      senderName: data['senderName'] ?? '',
      senderPhotoUrl: data['senderPhotoUrl'],
      isOrganizer: data['isOrganizer'] ?? false,
      type: MessageType.values.firstWhere(
        (e) => e.name == data['type'],
        orElse: () => MessageType.text,
      ),
      content: data['content'] ?? '',
      imageUrl: data['imageUrl'],
      locationCoordinates: data['locationCoordinates'],
      locationName: data['locationName'],
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      isPinned: data['isPinned'] ?? false,
      isUrgent: data['isUrgent'] ?? false,
      readBy: List<String>.from(data['readBy'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'tripId': tripId,
      'senderId': senderId,
      'senderName': senderName,
      'senderPhotoUrl': senderPhotoUrl,
      'isOrganizer': isOrganizer,
      'type': type.name,
      'content': content,
      'imageUrl': imageUrl,
      'locationCoordinates': locationCoordinates,
      'locationName': locationName,
      'createdAt': Timestamp.fromDate(createdAt),
      'isPinned': isPinned,
      'isUrgent': isUrgent,
      'readBy': readBy,
    };
  }

  MessageModel copyWith({
    String? id,
    String? tripId,
    String? senderId,
    String? senderName,
    String? senderPhotoUrl,
    bool? isOrganizer,
    MessageType? type,
    String? content,
    String? imageUrl,
    GeoPoint? locationCoordinates,
    String? locationName,
    DateTime? createdAt,
    bool? isPinned,
    bool? isUrgent,
    List<String>? readBy,
  }) {
    return MessageModel(
      id: id ?? this.id,
      tripId: tripId ?? this.tripId,
      senderId: senderId ?? this.senderId,
      senderName: senderName ?? this.senderName,
      senderPhotoUrl: senderPhotoUrl ?? this.senderPhotoUrl,
      isOrganizer: isOrganizer ?? this.isOrganizer,
      type: type ?? this.type,
      content: content ?? this.content,
      imageUrl: imageUrl ?? this.imageUrl,
      locationCoordinates: locationCoordinates ?? this.locationCoordinates,
      locationName: locationName ?? this.locationName,
      createdAt: createdAt ?? this.createdAt,
      isPinned: isPinned ?? this.isPinned,
      isUrgent: isUrgent ?? this.isUrgent,
      readBy: readBy ?? this.readBy,
    );
  }
}
