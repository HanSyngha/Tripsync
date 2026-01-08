import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/constants/app_constants.dart';

class TripModel {
  final String id;
  final String name;
  final String? description;
  final String? coverImageUrl;
  final String destination;
  final GeoPoint? destinationCoordinates;
  final DateTime startDate;
  final DateTime endDate;
  final String hostId;
  final String hostName;
  final String? hostPhotoUrl;
  final TripStatus status;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int participantCount;
  final List<String> tags;

  TripModel({
    required this.id,
    required this.name,
    this.description,
    this.coverImageUrl,
    required this.destination,
    this.destinationCoordinates,
    required this.startDate,
    required this.endDate,
    required this.hostId,
    required this.hostName,
    this.hostPhotoUrl,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    this.participantCount = 1,
    this.tags = const [],
  });

  int get totalDays => endDate.difference(startDate).inDays + 1;

  int get totalNights => endDate.difference(startDate).inDays;

  int get currentDay {
    final now = DateTime.now();
    if (now.isBefore(startDate)) return 0;
    if (now.isAfter(endDate)) return totalDays;
    return now.difference(startDate).inDays + 1;
  }

  bool get isUpcoming => DateTime.now().isBefore(startDate);

  bool get isInProgress {
    final now = DateTime.now();
    return now.isAfter(startDate) && now.isBefore(endDate.add(const Duration(days: 1)));
  }

  bool get isCompleted => DateTime.now().isAfter(endDate);

  factory TripModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return TripModel(
      id: doc.id,
      name: data['name'] ?? '',
      description: data['description'],
      coverImageUrl: data['coverImageUrl'],
      destination: data['destination'] ?? '',
      destinationCoordinates: data['destinationCoordinates'],
      startDate: (data['startDate'] as Timestamp).toDate(),
      endDate: (data['endDate'] as Timestamp).toDate(),
      hostId: data['hostId'] ?? '',
      hostName: data['hostName'] ?? '',
      hostPhotoUrl: data['hostPhotoUrl'],
      status: TripStatus.values.firstWhere(
        (e) => e.name == data['status'],
        orElse: () => TripStatus.draft,
      ),
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      participantCount: data['participantCount'] ?? 1,
      tags: List<String>.from(data['tags'] ?? []),
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'name': name,
      'description': description,
      'coverImageUrl': coverImageUrl,
      'destination': destination,
      'destinationCoordinates': destinationCoordinates,
      'startDate': Timestamp.fromDate(startDate),
      'endDate': Timestamp.fromDate(endDate),
      'hostId': hostId,
      'hostName': hostName,
      'hostPhotoUrl': hostPhotoUrl,
      'status': status.name,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'participantCount': participantCount,
      'tags': tags,
    };
  }

  TripModel copyWith({
    String? id,
    String? name,
    String? description,
    String? coverImageUrl,
    String? destination,
    GeoPoint? destinationCoordinates,
    DateTime? startDate,
    DateTime? endDate,
    String? hostId,
    String? hostName,
    String? hostPhotoUrl,
    TripStatus? status,
    DateTime? createdAt,
    DateTime? updatedAt,
    int? participantCount,
    List<String>? tags,
  }) {
    return TripModel(
      id: id ?? this.id,
      name: name ?? this.name,
      description: description ?? this.description,
      coverImageUrl: coverImageUrl ?? this.coverImageUrl,
      destination: destination ?? this.destination,
      destinationCoordinates: destinationCoordinates ?? this.destinationCoordinates,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      hostId: hostId ?? this.hostId,
      hostName: hostName ?? this.hostName,
      hostPhotoUrl: hostPhotoUrl ?? this.hostPhotoUrl,
      status: status ?? this.status,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      participantCount: participantCount ?? this.participantCount,
      tags: tags ?? this.tags,
    );
  }
}
