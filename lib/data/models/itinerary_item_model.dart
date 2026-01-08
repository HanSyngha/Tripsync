import 'package:cloud_firestore/cloud_firestore.dart';
import '../../core/constants/app_constants.dart';

class ItineraryItemModel {
  final String id;
  final String tripId;
  final int dayNumber;
  final ItineraryItemType type;
  final String title;
  final String? description;
  final DateTime startTime;
  final DateTime? endTime;
  final String? location;
  final GeoPoint? coordinates;
  final String? address;
  final String? imageUrl;
  final String? confirmationNumber;
  final String? notes;
  final List<String> attachmentUrls;
  final Map<String, dynamic>? metadata; // For type-specific data
  final DateTime createdAt;
  final DateTime updatedAt;
  final String createdBy;
  final int orderIndex;

  ItineraryItemModel({
    required this.id,
    required this.tripId,
    required this.dayNumber,
    required this.type,
    required this.title,
    this.description,
    required this.startTime,
    this.endTime,
    this.location,
    this.coordinates,
    this.address,
    this.imageUrl,
    this.confirmationNumber,
    this.notes,
    this.attachmentUrls = const [],
    this.metadata,
    required this.createdAt,
    required this.updatedAt,
    required this.createdBy,
    this.orderIndex = 0,
  });

  Duration? get duration {
    if (endTime == null) return null;
    return endTime!.difference(startTime);
  }

  String get formattedDuration {
    final dur = duration;
    if (dur == null) return '';
    final hours = dur.inHours;
    final minutes = dur.inMinutes.remainder(60);
    if (hours > 0) {
      return '${hours}h ${minutes}m';
    }
    return '${minutes}m';
  }

  // Flight specific getters
  String? get airline => metadata?['airline'];
  String? get flightNumber => metadata?['flightNumber'];
  String? get departureAirport => metadata?['departureAirport'];
  String? get arrivalAirport => metadata?['arrivalAirport'];
  String? get terminal => metadata?['terminal'];
  String? get gate => metadata?['gate'];

  // Accommodation specific getters
  String? get hotelName => metadata?['hotelName'];
  DateTime? get checkInTime => metadata?['checkInTime'] != null
      ? (metadata!['checkInTime'] as Timestamp).toDate()
      : null;
  DateTime? get checkOutTime => metadata?['checkOutTime'] != null
      ? (metadata!['checkOutTime'] as Timestamp).toDate()
      : null;
  String? get roomType => metadata?['roomType'];

  // Restaurant specific getters
  String? get cuisine => metadata?['cuisine'];
  String? get priceRange => metadata?['priceRange'];
  String? get reservationTime => metadata?['reservationTime'];

  // Rental car specific getters
  String? get carCompany => metadata?['carCompany'];
  String? get carModel => metadata?['carModel'];
  String? get pickupLocation => metadata?['pickupLocation'];
  String? get dropoffLocation => metadata?['dropoffLocation'];

  factory ItineraryItemModel.fromFirestore(DocumentSnapshot doc) {
    final data = doc.data() as Map<String, dynamic>;
    return ItineraryItemModel(
      id: doc.id,
      tripId: data['tripId'] ?? '',
      dayNumber: data['dayNumber'] ?? 1,
      type: ItineraryItemType.values.firstWhere(
        (e) => e.name == data['type'],
        orElse: () => ItineraryItemType.other,
      ),
      title: data['title'] ?? '',
      description: data['description'],
      startTime: (data['startTime'] as Timestamp).toDate(),
      endTime: data['endTime'] != null
          ? (data['endTime'] as Timestamp).toDate()
          : null,
      location: data['location'],
      coordinates: data['coordinates'],
      address: data['address'],
      imageUrl: data['imageUrl'],
      confirmationNumber: data['confirmationNumber'],
      notes: data['notes'],
      attachmentUrls: List<String>.from(data['attachmentUrls'] ?? []),
      metadata: data['metadata'],
      createdAt: (data['createdAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      updatedAt: (data['updatedAt'] as Timestamp?)?.toDate() ?? DateTime.now(),
      createdBy: data['createdBy'] ?? '',
      orderIndex: data['orderIndex'] ?? 0,
    );
  }

  Map<String, dynamic> toFirestore() {
    return {
      'tripId': tripId,
      'dayNumber': dayNumber,
      'type': type.name,
      'title': title,
      'description': description,
      'startTime': Timestamp.fromDate(startTime),
      'endTime': endTime != null ? Timestamp.fromDate(endTime!) : null,
      'location': location,
      'coordinates': coordinates,
      'address': address,
      'imageUrl': imageUrl,
      'confirmationNumber': confirmationNumber,
      'notes': notes,
      'attachmentUrls': attachmentUrls,
      'metadata': metadata,
      'createdAt': Timestamp.fromDate(createdAt),
      'updatedAt': Timestamp.fromDate(updatedAt),
      'createdBy': createdBy,
      'orderIndex': orderIndex,
    };
  }

  ItineraryItemModel copyWith({
    String? id,
    String? tripId,
    int? dayNumber,
    ItineraryItemType? type,
    String? title,
    String? description,
    DateTime? startTime,
    DateTime? endTime,
    String? location,
    GeoPoint? coordinates,
    String? address,
    String? imageUrl,
    String? confirmationNumber,
    String? notes,
    List<String>? attachmentUrls,
    Map<String, dynamic>? metadata,
    DateTime? createdAt,
    DateTime? updatedAt,
    String? createdBy,
    int? orderIndex,
  }) {
    return ItineraryItemModel(
      id: id ?? this.id,
      tripId: tripId ?? this.tripId,
      dayNumber: dayNumber ?? this.dayNumber,
      type: type ?? this.type,
      title: title ?? this.title,
      description: description ?? this.description,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      location: location ?? this.location,
      coordinates: coordinates ?? this.coordinates,
      address: address ?? this.address,
      imageUrl: imageUrl ?? this.imageUrl,
      confirmationNumber: confirmationNumber ?? this.confirmationNumber,
      notes: notes ?? this.notes,
      attachmentUrls: attachmentUrls ?? this.attachmentUrls,
      metadata: metadata ?? this.metadata,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      createdBy: createdBy ?? this.createdBy,
      orderIndex: orderIndex ?? this.orderIndex,
    );
  }
}
