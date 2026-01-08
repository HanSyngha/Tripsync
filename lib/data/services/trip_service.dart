import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/trip_model.dart';
import '../models/participant_model.dart';
import '../../core/constants/app_constants.dart';

class TripService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> get _tripsCollection =>
      _firestore.collection('trips');

  CollectionReference<Map<String, dynamic>> _participantsCollection(String tripId) =>
      _tripsCollection.doc(tripId).collection('participants');

  // Create a new trip
  Future<TripModel> createTrip({
    required String name,
    String? description,
    String? coverImageUrl,
    required String destination,
    GeoPoint? destinationCoordinates,
    required DateTime startDate,
    required DateTime endDate,
    required String hostId,
    required String hostName,
    String? hostPhotoUrl,
    List<String> tags = const [],
  }) async {
    try {
      final docRef = _tripsCollection.doc();
      final now = DateTime.now();

      final trip = TripModel(
        id: docRef.id,
        name: name,
        description: description,
        coverImageUrl: coverImageUrl,
        destination: destination,
        destinationCoordinates: destinationCoordinates,
        startDate: startDate,
        endDate: endDate,
        hostId: hostId,
        hostName: hostName,
        hostPhotoUrl: hostPhotoUrl,
        status: TripStatus.upcoming,
        createdAt: now,
        updatedAt: now,
        participantCount: 1,
        tags: tags,
      );

      await docRef.set(trip.toFirestore());

      // Add host as participant
      final hostParticipant = ParticipantModel(
        id: docRef.id,
        oderId: hostId,
        tripId: docRef.id,
        displayName: hostName,
        email: '', // Will be updated from user data
        photoUrl: hostPhotoUrl,
        role: UserRole.host,
        canEditSchedule: true,
        canUploadPhotos: true,
        joinedAt: now,
        inviteStatus: InviteStatus.accepted,
      );

      await _participantsCollection(docRef.id).doc(hostId).set(hostParticipant.toFirestore());

      return trip;
    } catch (e) {
      rethrow;
    }
  }

  // Get trip by ID
  Future<TripModel?> getTrip(String tripId) async {
    try {
      final doc = await _tripsCollection.doc(tripId).get();
      if (!doc.exists) return null;
      return TripModel.fromFirestore(doc);
    } catch (e) {
      rethrow;
    }
  }

  // Get trip stream
  Stream<TripModel?> getTripStream(String tripId) {
    return _tripsCollection.doc(tripId).snapshots().map((doc) {
      if (!doc.exists) return null;
      return TripModel.fromFirestore(doc);
    });
  }

  // Get user's trips
  Stream<List<TripModel>> getUserTrips(String userId) {
    return _firestore
        .collectionGroup('participants')
        .where('userId', isEqualTo: userId)
        .where('inviteStatus', isEqualTo: 'accepted')
        .snapshots()
        .asyncMap((snapshot) async {
      final tripIds = snapshot.docs.map((doc) => doc.reference.parent.parent!.id).toSet();

      if (tripIds.isEmpty) return <TripModel>[];

      final trips = await Future.wait(
        tripIds.map((tripId) => getTrip(tripId)),
      );

      return trips.whereType<TripModel>().toList()
        ..sort((a, b) => b.startDate.compareTo(a.startDate));
    });
  }

  // Get upcoming trips
  Stream<List<TripModel>> getUpcomingTrips(String userId) {
    return getUserTrips(userId).map((trips) {
      return trips.where((trip) => trip.isUpcoming).toList();
    });
  }

  // Get in-progress trips
  Stream<List<TripModel>> getInProgressTrips(String userId) {
    return getUserTrips(userId).map((trips) {
      return trips.where((trip) => trip.isInProgress).toList();
    });
  }

  // Get completed trips
  Stream<List<TripModel>> getCompletedTrips(String userId) {
    return getUserTrips(userId).map((trips) {
      return trips.where((trip) => trip.isCompleted).toList();
    });
  }

  // Update trip
  Future<void> updateTrip(String tripId, Map<String, dynamic> updates) async {
    try {
      updates['updatedAt'] = Timestamp.now();
      await _tripsCollection.doc(tripId).update(updates);
    } catch (e) {
      rethrow;
    }
  }

  // Delete trip
  Future<void> deleteTrip(String tripId) async {
    try {
      // Delete all subcollections first
      final batch = _firestore.batch();

      // Delete participants
      final participants = await _participantsCollection(tripId).get();
      for (final doc in participants.docs) {
        batch.delete(doc.reference);
      }

      // Delete itinerary items
      final itinerary = await _tripsCollection.doc(tripId).collection('itinerary').get();
      for (final doc in itinerary.docs) {
        batch.delete(doc.reference);
      }

      // Delete messages
      final messages = await _tripsCollection.doc(tripId).collection('messages').get();
      for (final doc in messages.docs) {
        batch.delete(doc.reference);
      }

      // Delete the trip document
      batch.delete(_tripsCollection.doc(tripId));

      await batch.commit();
    } catch (e) {
      rethrow;
    }
  }

  // Update trip status
  Future<void> updateTripStatus(String tripId, TripStatus status) async {
    try {
      await _tripsCollection.doc(tripId).update({
        'status': status.name,
        'updatedAt': Timestamp.now(),
      });
    } catch (e) {
      rethrow;
    }
  }

  // Get participants
  Stream<List<ParticipantModel>> getParticipants(String tripId) {
    return _participantsCollection(tripId)
        .orderBy('joinedAt')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => ParticipantModel.fromFirestore(doc)).toList();
    });
  }

  // Get participant
  Future<ParticipantModel?> getParticipant(String tripId, String userId) async {
    try {
      final doc = await _participantsCollection(tripId).doc(userId).get();
      if (!doc.exists) return null;
      return ParticipantModel.fromFirestore(doc);
    } catch (e) {
      rethrow;
    }
  }

  // Add participant
  Future<void> addParticipant({
    required String tripId,
    required String oderId,
    required String displayName,
    required String email,
    String? photoUrl,
    UserRole role = UserRole.participant,
    String? invitedBy,
  }) async {
    try {
      final participant = ParticipantModel(
        id: oderId,
        oderId: oderId,
        tripId: tripId,
        displayName: displayName,
        email: email,
        photoUrl: photoUrl,
        role: role,
        joinedAt: DateTime.now(),
        inviteStatus: InviteStatus.pending,
        invitedBy: invitedBy,
      );

      await _participantsCollection(tripId).doc(oderId).set(participant.toFirestore());

      // Update participant count
      await _tripsCollection.doc(tripId).update({
        'participantCount': FieldValue.increment(1),
        'updatedAt': Timestamp.now(),
      });
    } catch (e) {
      rethrow;
    }
  }

  // Update participant
  Future<void> updateParticipant(
    String tripId,
    String oderId,
    Map<String, dynamic> updates,
  ) async {
    try {
      await _participantsCollection(tripId).doc(oderId).update(updates);
    } catch (e) {
      rethrow;
    }
  }

  // Remove participant
  Future<void> removeParticipant(String tripId, String oderId) async {
    try {
      await _participantsCollection(tripId).doc(oderId).delete();

      // Update participant count
      await _tripsCollection.doc(tripId).update({
        'participantCount': FieldValue.increment(-1),
        'updatedAt': Timestamp.now(),
      });
    } catch (e) {
      rethrow;
    }
  }

  // Accept invite
  Future<void> acceptInvite(String tripId, String oderId) async {
    try {
      await _participantsCollection(tripId).doc(oderId).update({
        'inviteStatus': InviteStatus.accepted.name,
      });
    } catch (e) {
      rethrow;
    }
  }

  // Decline invite
  Future<void> declineInvite(String tripId, String oderId) async {
    try {
      await _participantsCollection(tripId).doc(oderId).update({
        'inviteStatus': InviteStatus.declined.name,
      });

      // Update participant count
      await _tripsCollection.doc(tripId).update({
        'participantCount': FieldValue.increment(-1),
        'updatedAt': Timestamp.now(),
      });
    } catch (e) {
      rethrow;
    }
  }

  // Check if user is participant
  Future<bool> isParticipant(String tripId, String userId) async {
    final participant = await getParticipant(tripId, userId);
    return participant != null && participant.inviteStatus == InviteStatus.accepted;
  }

  // Check if user is host
  Future<bool> isHost(String tripId, String userId) async {
    final participant = await getParticipant(tripId, userId);
    return participant != null && participant.isHost;
  }

  // Check if user can manage trip
  Future<bool> canManageTrip(String tripId, String userId) async {
    final participant = await getParticipant(tripId, userId);
    return participant != null && participant.canManage;
  }

  // Add participant with ParticipantModel
  Future<void> addParticipantModel(String tripId, ParticipantModel participant) async {
    try {
      final docRef = _participantsCollection(tripId).doc();
      final participantWithId = participant.copyWith(id: docRef.id);
      await docRef.set(participantWithId.toFirestore());

      // Update participant count
      await _tripsCollection.doc(tripId).update({
        'participantCount': FieldValue.increment(1),
        'updatedAt': Timestamp.now(),
      });
    } catch (e) {
      rethrow;
    }
  }

  // Resend invite
  Future<void> resendInvite(String tripId, String participantId) async {
    try {
      // In a real app, this would trigger an email/notification
      // For now, we just update the timestamp to track resend
      await _participantsCollection(tripId).doc(participantId).update({
        'lastInviteSentAt': Timestamp.now(),
      });
    } catch (e) {
      rethrow;
    }
  }

  // Update participant permissions
  Future<void> updateParticipantPermissions(
    String tripId,
    String participantId, {
    bool? canEditSchedule,
    bool? canUploadPhotos,
  }) async {
    try {
      final updates = <String, dynamic>{};
      if (canEditSchedule != null) updates['canEditSchedule'] = canEditSchedule;
      if (canUploadPhotos != null) updates['canUploadPhotos'] = canUploadPhotos;

      if (updates.isNotEmpty) {
        await _participantsCollection(tripId).doc(participantId).update(updates);
      }
    } catch (e) {
      rethrow;
    }
  }

  // Update participant role
  Future<void> updateParticipantRole(
    String tripId,
    String participantId,
    UserRole newRole,
  ) async {
    try {
      await _participantsCollection(tripId).doc(participantId).update({
        'role': newRole.name,
      });
    } catch (e) {
      rethrow;
    }
  }

  // Set invite link active status
  Future<void> setInviteLinkActive(String tripId, bool isActive) async {
    try {
      await _tripsCollection.doc(tripId).update({
        'inviteLinkActive': isActive,
        'updatedAt': Timestamp.now(),
      });
    } catch (e) {
      rethrow;
    }
  }

  // Generate new invite link
  Future<String> generateInviteLink(String tripId) async {
    try {
      // Generate a unique invite code
      final inviteCode = DateTime.now().millisecondsSinceEpoch.toRadixString(36);
      final link = 'https://tripsync.app/invite/$tripId/$inviteCode';

      await _tripsCollection.doc(tripId).update({
        'inviteCode': inviteCode,
        'inviteLinkActive': true,
        'inviteLinkExpiresAt': Timestamp.fromDate(
          DateTime.now().add(const Duration(days: 7)),
        ),
        'updatedAt': Timestamp.now(),
      });

      return link;
    } catch (e) {
      rethrow;
    }
  }
}
