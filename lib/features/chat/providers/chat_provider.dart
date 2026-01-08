import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/message_model.dart';
import '../../../data/services/message_service.dart';
import '../../../core/constants/app_constants.dart';
import '../../auth/providers/auth_provider.dart';
import '../../trip/providers/trip_provider.dart';

/// Provider for MessageService
final messageServiceProvider = Provider<MessageService>((ref) {
  return MessageService();
});

/// Stream provider for messages in a trip chat
final messagesProvider =
    StreamProvider.family<List<MessageModel>, String>((ref, tripId) {
  final messageService = ref.read(messageServiceProvider);
  return messageService.getMessages(tripId);
});

/// Stream provider for pinned messages
final pinnedMessagesProvider =
    StreamProvider.family<List<MessageModel>, String>((ref, tripId) {
  final messageService = ref.read(messageServiceProvider);
  return messageService.getPinnedMessages(tripId);
});

/// Stream provider for urgent/announcement messages
final urgentMessagesProvider =
    StreamProvider.family<List<MessageModel>, String>((ref, tripId) {
  final messageService = ref.read(messageServiceProvider);
  return messageService.getUrgentMessages(tripId);
});

/// Stream provider for unread message count
final unreadCountProvider =
    StreamProvider.family<int, String>((ref, tripId) {
  final authState = ref.watch(authStateProvider);
  final user = authState.valueOrNull;

  if (user == null) return Stream.value(0);

  final messageService = ref.read(messageServiceProvider);
  return messageService.getUnreadCount(tripId, user.uid);
});

/// Provider for checking if current user is organizer for a trip
final isOrganizerProvider =
    FutureProvider.family<bool, String>((ref, tripId) async {
  final participant = await ref.watch(currentUserParticipantProvider(tripId).future);
  return participant?.canManage ?? false;
});

/// State notifier for chat actions
class ChatNotifier extends StateNotifier<AsyncValue<void>> {
  final MessageService _messageService;
  final String tripId;
  final String userId;
  final String userName;
  final String? userPhotoUrl;
  final bool isOrganizer;

  ChatNotifier({
    required MessageService messageService,
    required this.tripId,
    required this.userId,
    required this.userName,
    this.userPhotoUrl,
    this.isOrganizer = false,
  })  : _messageService = messageService,
        super(const AsyncValue.data(null));

  /// Send a text message
  Future<void> sendMessage(String content) async {
    if (content.trim().isEmpty) return;

    state = const AsyncValue.loading();
    try {
      await _messageService.sendMessage(
        tripId: tripId,
        senderId: userId,
        senderName: userName,
        senderPhotoUrl: userPhotoUrl,
        isOrganizer: isOrganizer,
        type: MessageType.text,
        content: content.trim(),
      );
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Send a location message
  Future<void> sendLocation({
    required double latitude,
    required double longitude,
    required String locationName,
    String? content,
  }) async {
    state = const AsyncValue.loading();
    try {
      await _messageService.sendLocation(
        tripId: tripId,
        senderId: userId,
        senderName: userName,
        senderPhotoUrl: userPhotoUrl,
        isOrganizer: isOrganizer,
        coordinates: GeoPoint(latitude, longitude),
        locationName: locationName,
        content: content,
      );
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Send an image message
  Future<void> sendImage({
    required String imageUrl,
    String? caption,
  }) async {
    state = const AsyncValue.loading();
    try {
      await _messageService.sendImage(
        tripId: tripId,
        senderId: userId,
        senderName: userName,
        senderPhotoUrl: userPhotoUrl,
        isOrganizer: isOrganizer,
        imageUrl: imageUrl,
        caption: caption,
      );
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Send an announcement (organizers only)
  Future<void> sendAnnouncement(String content) async {
    if (!isOrganizer) return;
    if (content.trim().isEmpty) return;

    state = const AsyncValue.loading();
    try {
      await _messageService.sendAnnouncement(
        tripId: tripId,
        senderId: userId,
        senderName: userName,
        senderPhotoUrl: userPhotoUrl,
        content: content.trim(),
      );
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Mark a message as read
  Future<void> markAsRead(String messageId) async {
    try {
      await _messageService.markAsRead(tripId, messageId, userId);
    } catch (e) {
      // Silent failure for read status
    }
  }

  /// Mark all messages as read
  Future<void> markAllAsRead() async {
    try {
      await _messageService.markAllAsRead(tripId, userId);
    } catch (e) {
      // Silent failure for read status
    }
  }

  /// Toggle pin status of a message
  Future<void> togglePinMessage(String messageId, bool isPinned) async {
    if (!isOrganizer) return;

    state = const AsyncValue.loading();
    try {
      await _messageService.togglePinMessage(tripId, messageId, isPinned);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  /// Delete a message
  Future<void> deleteMessage(String messageId) async {
    state = const AsyncValue.loading();
    try {
      await _messageService.deleteMessage(tripId, messageId);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

/// Provider for chat notifier with trip context
final chatNotifierProvider = StateNotifierProvider.family
    .autoDispose<ChatNotifier, AsyncValue<void>, String>((ref, tripId) {
  final messageService = ref.read(messageServiceProvider);
  final authState = ref.watch(authStateProvider);
  final user = authState.valueOrNull;
  final currentUser = ref.watch(currentUserProvider).valueOrNull;
  final participantAsync = ref.watch(currentUserParticipantProvider(tripId));
  final participant = participantAsync.valueOrNull;

  return ChatNotifier(
    messageService: messageService,
    tripId: tripId,
    userId: user?.uid ?? '',
    userName: currentUser?.displayName ?? user?.displayName ?? 'Unknown',
    userPhotoUrl: currentUser?.photoUrl ?? user?.photoURL,
    isOrganizer: participant?.canManage ?? false,
  );
});

/// Provider for grouped messages by date
final groupedMessagesProvider = Provider.family<
    AsyncValue<Map<DateTime, List<MessageModel>>>, String>((ref, tripId) {
  final messagesAsync = ref.watch(messagesProvider(tripId));

  return messagesAsync.whenData((messages) {
    final grouped = <DateTime, List<MessageModel>>{};

    for (final message in messages) {
      final dateKey = DateTime(
        message.createdAt.year,
        message.createdAt.month,
        message.createdAt.day,
      );

      if (!grouped.containsKey(dateKey)) {
        grouped[dateKey] = [];
      }
      grouped[dateKey]!.add(message);
    }

    return grouped;
  });
});

/// Provider for message input state
final messageInputProvider =
    StateProvider.family.autoDispose<String, String>((ref, tripId) => '');

/// Provider for attachment selection state
enum AttachmentType { none, image, location }

final attachmentTypeProvider =
    StateProvider.family.autoDispose<AttachmentType, String>(
        (ref, tripId) => AttachmentType.none);

/// Provider for total unread count across all user's trips
final totalUnreadCountProvider = Provider<AsyncValue<int>>((ref) {
  final tripsAsync = ref.watch(userTripsProvider);

  return tripsAsync.when(
    data: (trips) {
      int total = 0;
      for (final trip in trips) {
        final unreadAsync = ref.watch(unreadCountProvider(trip.id));
        total += unreadAsync.valueOrNull ?? 0;
      }
      return AsyncValue.data(total);
    },
    loading: () => const AsyncValue.loading(),
    error: (e, st) => AsyncValue.error(e, st),
  );
});
