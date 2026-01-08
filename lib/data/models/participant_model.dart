import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/constants/app_constants.dart';

class ParticipantModel {
  final String id;
  final String oderId;
  final String tripId;
  final String displayName;
  final String email;
  final String? photoUrl;
  final UserRole role;
  final bool canEditSchedule;
  final bool canUploadPhotos;
  final DateTime joinedAt;
  final InviteStatus inviteStatus;
  final String? invitedBy;

  ParticipantModel({
    required this.id,
    required this.oderId,
    required this.tripId,
    required this.displayName,
    required this.email,
    this.photoUrl,
    required this.role,
    this.canEditSchedule = false,
    this.canUploadPhotos = true,
    required this.joinedAt,
    this.inviteStatus = InviteStatus.accepted,
    this.invitedBy,
  });

  bool get isHost => role == UserRole.host;
  bool get isCoHost => role == UserRole.coHost;
  bool get canManage => role == UserRole.host || role == UserRole.coHost;
  bool get isPending => inviteStatus == InviteStatus.pending;

  factory ParticipantModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ParticipantModel(
      id: doc.id,
      oderId: data['userId'] ?? '',
      tripId: data['tripId'] ?? '',
      displayName: data['displayName'] ?? '',
      email: data['email'] ?? '',
      photoUrl: data['photoUrl'],
      role: UserRole.values.firstWhere(
        (e) => e.name == data['role'],
        orElse: () => UserRole.participant,
      ),
      canEditSchedule: data['canEditSchedule'] ?? false,
      canUploadPhotos: data['canUploadPhotos'] ?? true,
      joinedAt: (data['joinedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      inviteStatus: InviteStatus.values.firstWhere(
        (e) => e.name == data['inviteStatus'],
        orElse: () => InviteStatus.accepted,
      ),
      invitedBy: data['invitedBy'],
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'userId': oderId,
      'tripId': tripId,
      'displayName': displayName,
      'email': email,
      'photoUrl': photoUrl,
      'role': role.name,
      'canEditSchedule': canEditSchedule,
      'canUploadPhotos': canUploadPhotos,
      'joinedAt': Timestamp.fromDate(joinedAt),
      'inviteStatus': inviteStatus.name,
      'invitedBy': invitedBy,
    };
  }

  ParticipantModel copyWith({
    String? id,
    String? oderId,
    String? tripId,
    String? displayName,
    String? email,
    String? photoUrl,
    UserRole? role,
    bool? canEditSchedule,
    bool? canUploadPhotos,
    DateTime? joinedAt,
    InviteStatus? inviteStatus,
    String? invitedBy,
  }) {
    return ParticipantModel(
      id: id ?? this.id,
      oderId: oderId ?? this.oderId,
      tripId: tripId ?? this.tripId,
      displayName: displayName ?? this.displayName,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      role: role ?? this.role,
      canEditSchedule: canEditSchedule ?? this.canEditSchedule,
      canUploadPhotos: canUploadPhotos ?? this.canUploadPhotos,
      joinedAt: joinedAt ?? this.joinedAt,
      inviteStatus: inviteStatus ?? this.inviteStatus,
      invitedBy: invitedBy ?? this.invitedBy,
    );
  }
}
