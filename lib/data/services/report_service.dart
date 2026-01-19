import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/report_model.dart';

class ReportService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  // Collection references
  CollectionReference get _reportsRef => _firestore.collection('reports');
  CollectionReference get _usersRef => _firestore.collection('users');
  CollectionReference get _tripsRef => _firestore.collection('trips');
  CollectionReference get _notificationsRef => _firestore.collection('notifications');

  // Submit a report
  Future<void> submitReport({
    required String tripId,
    required String reporterId,
    required String reporterName,
    required String targetId,
    required ReportTargetType targetType,
    String? targetUserId,
    String? targetUserName,
    required ReportType reportType,
    String? description,
    String? messageContent,
  }) async {
    // Create report
    final reportRef = _reportsRef.doc();
    final report = ReportModel(
      id: reportRef.id,
      tripId: tripId,
      reporterId: reporterId,
      reporterName: reporterName,
      targetId: targetId,
      targetType: targetType,
      targetUserId: targetUserId,
      targetUserName: targetUserName,
      reportType: reportType,
      description: description,
      messageContent: messageContent,
      createdAt: DateTime.now(),
    );

    await reportRef.set(report.toFirestore());

    // Notify trip organizer
    await _notifyOrganizer(tripId, report);
  }

  // Notify the trip organizer about the report
  Future<void> _notifyOrganizer(String tripId, ReportModel report) async {
    try {
      // Get trip to find organizer
      final tripDoc = await _tripsRef.doc(tripId).get();
      if (!tripDoc.exists) return;

      final tripData = tripDoc.data() as Map<String, dynamic>;
      final organizerId = tripData['organizerId'] as String?;

      if (organizerId == null || organizerId == report.reporterId) return;

      // Create notification for organizer
      final targetName = report.targetUserName ?? 'a user';
      final reportTypeLabel = ReportModel.getReportTypeLabel(report.reportType);

      String notificationBody;
      if (report.targetType == ReportTargetType.message) {
        notificationBody = '${report.reporterName} reported a message from $targetName for: $reportTypeLabel';
      } else {
        notificationBody = '${report.reporterName} reported $targetName for: $reportTypeLabel';
      }

      await _notificationsRef.add({
        'userId': organizerId,
        'tripId': tripId,
        'type': 'report',
        'title': 'New Report',
        'body': notificationBody,
        'reportId': report.id,
        'isRead': false,
        'createdAt': FieldValue.serverTimestamp(),
      });
    } catch (e) {
      print('[ReportService] Error notifying organizer: $e');
    }
  }

  // Block a user
  Future<void> blockUser({
    required String currentUserId,
    required String blockedUserId,
    required String blockedUserName,
  }) async {
    await _usersRef.doc(currentUserId).update({
      'blockedUsers': FieldValue.arrayUnion([
        {
          'userId': blockedUserId,
          'userName': blockedUserName,
          'blockedAt': Timestamp.now(),
        }
      ]),
    });
  }

  // Unblock a user
  Future<void> unblockUser({
    required String currentUserId,
    required String blockedUserId,
  }) async {
    // Get current blocked users
    final userDoc = await _usersRef.doc(currentUserId).get();
    if (!userDoc.exists) return;

    final userData = userDoc.data() as Map<String, dynamic>;
    final blockedUsers = List<Map<String, dynamic>>.from(userData['blockedUsers'] ?? []);

    blockedUsers.removeWhere((user) => user['userId'] == blockedUserId);

    await _usersRef.doc(currentUserId).update({
      'blockedUsers': blockedUsers,
    });
  }

  // Get blocked users list
  Future<List<Map<String, dynamic>>> getBlockedUsers(String userId) async {
    final userDoc = await _usersRef.doc(userId).get();
    if (!userDoc.exists) return [];

    final userData = userDoc.data() as Map<String, dynamic>;
    return List<Map<String, dynamic>>.from(userData['blockedUsers'] ?? []);
  }

  // Check if a user is blocked
  Future<bool> isUserBlocked({
    required String currentUserId,
    required String targetUserId,
  }) async {
    final blockedUsers = await getBlockedUsers(currentUserId);
    return blockedUsers.any((user) => user['userId'] == targetUserId);
  }

  // Get reports for a trip (for organizers)
  Stream<List<ReportModel>> getTripReports(String tripId) {
    return _reportsRef
        .where('tripId', isEqualTo: tripId)
        .orderBy('createdAt', descending: true)
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => ReportModel.fromFirestore(doc))
            .toList());
  }

  // Resolve a report
  Future<void> resolveReport({
    required String reportId,
    required String resolvedBy,
  }) async {
    await _reportsRef.doc(reportId).update({
      'isResolved': true,
      'resolvedBy': resolvedBy,
      'resolvedAt': FieldValue.serverTimestamp(),
    });
  }

  // Remove user from trip (for organizers)
  Future<void> removeUserFromTrip({
    required String tripId,
    required String userId,
  }) async {
    // Remove from participants
    await _tripsRef.doc(tripId).update({
      'participantIds': FieldValue.arrayRemove([userId]),
    });

    // Remove from participants subcollection if exists
    try {
      await _tripsRef.doc(tripId).collection('participants').doc(userId).delete();
    } catch (e) {
      // Subcollection might not exist
    }
  }
}
