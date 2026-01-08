import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/message_model.dart';
import '../../core/constants/app_constants.dart';

class MessageService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _messagesCollection(String tripId) =>
      _firestore.collection('trips').doc(tripId).collection('messages');

  // Send a message
  Future<MessageModel> sendMessage({
    required String tripId,
    required String senderId,
    required String senderName,
    String? senderPhotoUrl,
    bool isOrganizer = false,
    MessageType type = MessageType.text,
    required String content,
    String? imageUrl,
    GeoPoint? locationCoordinates,
    String? locationName,
    bool isPinned = false,
    bool isUrgent = false,
  }) async {
    try {
      final docRef = _messagesCollection(tripId).doc();
      final now = DateTime.now();

      final message = MessageModel(
        id: docRef.id,
        tripId: tripId,
        senderId: senderId,
        senderName: senderName,
        senderPhotoUrl: senderPhotoUrl,
        isOrganizer: isOrganizer,
        type: type,
        content: content,
        imageUrl: imageUrl,
        locationCoordinates: locationCoordinates,
        locationName: locationName,
        createdAt: now,
        isPinned: isPinned,
        isUrgent: isUrgent,
        readBy: [senderId],
      );

      await docRef.set(message.toFirestore());
      return message;
    } catch (e) {
      rethrow;
    }
  }

  // Get messages stream
  Stream<List<MessageModel>> getMessages(String tripId, {int limit = 50}) {
    return _messagesCollection(tripId)
        .orderBy('createdAt', descending: true)
        .limit(limit)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => MessageModel.fromFirestore(doc))
          .toList()
          .reversed
          .toList();
    });
  }

  // Get more messages (pagination)
  Future<List<MessageModel>> getMoreMessages(
    String tripId,
    DateTime beforeDate, {
    int limit = 50,
  }) async {
    try {
      final snapshot = await _messagesCollection(tripId)
          .orderBy('createdAt', descending: true)
          .where('createdAt', isLessThan: Timestamp.fromDate(beforeDate))
          .limit(limit)
          .get();

      return snapshot.docs
          .map((doc) => MessageModel.fromFirestore(doc))
          .toList()
          .reversed
          .toList();
    } catch (e) {
      rethrow;
    }
  }

  // Get pinned messages
  Stream<List<MessageModel>> getPinnedMessages(String tripId) {
    return _messagesCollection(tripId)
        .where('isPinned', isEqualTo: true)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => MessageModel.fromFirestore(doc)).toList();
    });
  }

  // Get urgent messages (announcements)
  Stream<List<MessageModel>> getUrgentMessages(String tripId) {
    return _messagesCollection(tripId)
        .where('isUrgent', isEqualTo: true)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => MessageModel.fromFirestore(doc)).toList();
    });
  }

  // Mark message as read
  Future<void> markAsRead(String tripId, String messageId, String userId) async {
    try {
      await _messagesCollection(tripId).doc(messageId).update({
        'readBy': FieldValue.arrayUnion([userId]),
      });
    } catch (e) {
      rethrow;
    }
  }

  // Mark all messages as read
  Future<void> markAllAsRead(String tripId, String userId) async {
    try {
      final snapshot = await _messagesCollection(tripId)
          .where('readBy', whereNotIn: [[userId]])
          .get();

      final batch = _firestore.batch();
      for (final doc in snapshot.docs) {
        batch.update(doc.reference, {
          'readBy': FieldValue.arrayUnion([userId]),
        });
      }

      await batch.commit();
    } catch (e) {
      rethrow;
    }
  }

  // Pin/unpin message
  Future<void> togglePinMessage(String tripId, String messageId, bool isPinned) async {
    try {
      await _messagesCollection(tripId).doc(messageId).update({
        'isPinned': isPinned,
      });
    } catch (e) {
      rethrow;
    }
  }

  // Delete message
  Future<void> deleteMessage(String tripId, String messageId) async {
    try {
      await _messagesCollection(tripId).doc(messageId).delete();
    } catch (e) {
      rethrow;
    }
  }

  // Get unread count for user
  Stream<int> getUnreadCount(String tripId, String userId) {
    return _messagesCollection(tripId)
        .snapshots()
        .map((snapshot) {
      return snapshot.docs
          .map((doc) => MessageModel.fromFirestore(doc))
          .where((message) => !message.isReadBy(userId))
          .length;
    });
  }

  // Send announcement
  Future<MessageModel> sendAnnouncement({
    required String tripId,
    required String senderId,
    required String senderName,
    String? senderPhotoUrl,
    required String content,
  }) async {
    return sendMessage(
      tripId: tripId,
      senderId: senderId,
      senderName: senderName,
      senderPhotoUrl: senderPhotoUrl,
      isOrganizer: true,
      type: MessageType.announcement,
      content: content,
      isPinned: true,
      isUrgent: true,
    );
  }

  // Send location
  Future<MessageModel> sendLocation({
    required String tripId,
    required String senderId,
    required String senderName,
    String? senderPhotoUrl,
    bool isOrganizer = false,
    required GeoPoint coordinates,
    required String locationName,
    String? content,
  }) async {
    return sendMessage(
      tripId: tripId,
      senderId: senderId,
      senderName: senderName,
      senderPhotoUrl: senderPhotoUrl,
      isOrganizer: isOrganizer,
      type: MessageType.location,
      content: content ?? locationName,
      locationCoordinates: coordinates,
      locationName: locationName,
    );
  }

  // Send image
  Future<MessageModel> sendImage({
    required String tripId,
    required String senderId,
    required String senderName,
    String? senderPhotoUrl,
    bool isOrganizer = false,
    required String imageUrl,
    String? caption,
  }) async {
    return sendMessage(
      tripId: tripId,
      senderId: senderId,
      senderName: senderName,
      senderPhotoUrl: senderPhotoUrl,
      isOrganizer: isOrganizer,
      type: MessageType.image,
      content: caption ?? '',
      imageUrl: imageUrl,
    );
  }
}
