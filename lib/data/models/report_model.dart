import 'package:cloud_firestore/cloud_firestore.dart';

enum ReportType {
  spam,
  harassment,
  inappropriateContent,
  hateSpeech,
  violence,
  other,
}

enum ReportTargetType {
  message,
  user,
}

class ReportModel {
  final String id;
  final String tripId;
  final String reporterId;
  final String reporterName;
  final String targetId; // userId or messageId
  final ReportTargetType targetType;
  final String? targetUserId; // if reporting a message, the sender's userId
  final String? targetUserName;
  final ReportType reportType;
  final String? description;
  final String? messageContent; // if reporting a message
  final DateTime createdAt;
  final bool isResolved;
  final String? resolvedBy;
  final DateTime? resolvedAt;

  ReportModel({
    required this.id,
    required this.tripId,
    required this.reporterId,
    required this.reporterName,
    required this.targetId,
    required this.targetType,
    this.targetUserId,
    this.targetUserName,
    required this.reportType,
    this.description,
    this.messageContent,
    required this.createdAt,
    this.isResolved = false,
    this.resolvedBy,
    this.resolvedAt,
  });

  factory ReportModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ReportModel(
      id: doc.id,
      tripId: data['tripId'] ?? '',
      reporterId: data['reporterId'] ?? '',
      reporterName: data['reporterName'] ?? '',
      targetId: data['targetId'] ?? '',
      targetType: ReportTargetType.values.firstWhere(
        (e) => e.name == data['targetType'],
        orElse: () => ReportTargetType.user,
      ),
      targetUserId: data['targetUserId'],
      targetUserName: data['targetUserName'],
      reportType: ReportType.values.firstWhere(
        (e) => e.name == data['reportType'],
        orElse: () => ReportType.other,
      ),
      description: data['description'],
      messageContent: data['messageContent'],
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      isResolved: data['isResolved'] ?? false,
      resolvedBy: data['resolvedBy'],
      resolvedAt: (data['resolvedAt'] as Timestamp?)?.toDate(),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'tripId': tripId,
      'reporterId': reporterId,
      'reporterName': reporterName,
      'targetId': targetId,
      'targetType': targetType.name,
      'targetUserId': targetUserId,
      'targetUserName': targetUserName,
      'reportType': reportType.name,
      'description': description,
      'messageContent': messageContent,
      'createdAt': Timestamp.fromDate(createdAt),
      'isResolved': isResolved,
      'resolvedBy': resolvedBy,
      'resolvedAt': resolvedAt != null ? Timestamp.fromDate(resolvedAt!) : null,
    };
  }

  static String getReportTypeLabel(ReportType type) {
    switch (type) {
      case ReportType.spam:
        return 'Spam';
      case ReportType.harassment:
        return 'Harassment';
      case ReportType.inappropriateContent:
        return 'Inappropriate Content';
      case ReportType.hateSpeech:
        return 'Hate Speech';
      case ReportType.violence:
        return 'Violence';
      case ReportType.other:
        return 'Other';
    }
  }
}
