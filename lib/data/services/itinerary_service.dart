import 'package:cloud_firestore/cloud_firestore.dart';
import '../models/itinerary_item_model.dart';
import '../../core/constants/app_constants.dart';

class ItineraryService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  CollectionReference<Map<String, dynamic>> _itineraryCollection(String tripId) =>
      _firestore.collection('trips').doc(tripId).collection('itinerary');

  // Create itinerary item
  Future<ItineraryItemModel> createItineraryItem({
    required String tripId,
    required int dayNumber,
    required ItineraryItemType type,
    required String title,
    String? description,
    required DateTime startTime,
    DateTime? endTime,
    String? location,
    GeoPoint? coordinates,
    String? address,
    String? imageUrl,
    String? confirmationNumber,
    String? notes,
    List<String> attachmentUrls = const [],
    Map<String, dynamic>? metadata,
    required String createdBy,
    int? orderIndex,
  }) async {
    try {
      final docRef = _itineraryCollection(tripId).doc();
      final now = DateTime.now();

      // Get next order index if not provided
      final order = orderIndex ?? await _getNextOrderIndex(tripId, dayNumber);

      final item = ItineraryItemModel(
        id: docRef.id,
        tripId: tripId,
        dayNumber: dayNumber,
        type: type,
        title: title,
        description: description,
        startTime: startTime,
        endTime: endTime,
        location: location,
        coordinates: coordinates,
        address: address,
        imageUrl: imageUrl,
        confirmationNumber: confirmationNumber,
        notes: notes,
        attachmentUrls: attachmentUrls,
        metadata: metadata,
        createdAt: now,
        updatedAt: now,
        createdBy: createdBy,
        orderIndex: order,
      );

      await docRef.set(item.toFirestore());
      return item;
    } catch (e) {
      rethrow;
    }
  }

  Future<int> _getNextOrderIndex(String tripId, int dayNumber) async {
    final snapshot = await _itineraryCollection(tripId)
        .where('dayNumber', isEqualTo: dayNumber)
        .orderBy('orderIndex', descending: true)
        .limit(1)
        .get();

    if (snapshot.docs.isEmpty) return 0;
    final lastItem = ItineraryItemModel.fromFirestore(snapshot.docs.first);
    return lastItem.orderIndex + 1;
  }

  // Get itinerary item
  Future<ItineraryItemModel?> getItineraryItem(String tripId, String itemId) async {
    try {
      final doc = await _itineraryCollection(tripId).doc(itemId).get();
      if (!doc.exists) return null;
      return ItineraryItemModel.fromFirestore(doc);
    } catch (e) {
      rethrow;
    }
  }

  // Get all itinerary items for a trip
  Stream<List<ItineraryItemModel>> getItineraryItems(String tripId) {
    return _itineraryCollection(tripId)
        .orderBy('dayNumber')
        .orderBy('orderIndex')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => ItineraryItemModel.fromFirestore(doc)).toList();
    });
  }

  // Get itinerary items for a specific day
  Stream<List<ItineraryItemModel>> getItineraryItemsByDay(String tripId, int dayNumber) {
    return _itineraryCollection(tripId)
        .where('dayNumber', isEqualTo: dayNumber)
        .orderBy('orderIndex')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => ItineraryItemModel.fromFirestore(doc)).toList();
    });
  }

  // Get itinerary items grouped by day
  Stream<Map<int, List<ItineraryItemModel>>> getItineraryItemsGroupedByDay(String tripId) {
    return getItineraryItems(tripId).map((items) {
      final grouped = <int, List<ItineraryItemModel>>{};
      for (final item in items) {
        grouped.putIfAbsent(item.dayNumber, () => []).add(item);
      }
      return grouped;
    });
  }

  // Update itinerary item
  Future<void> updateItineraryItem(
    String tripId,
    String itemId,
    Map<String, dynamic> updates,
  ) async {
    try {
      updates['updatedAt'] = Timestamp.now();
      await _itineraryCollection(tripId).doc(itemId).update(updates);
    } catch (e) {
      rethrow;
    }
  }

  // Delete itinerary item
  Future<void> deleteItineraryItem(String tripId, String itemId) async {
    try {
      await _itineraryCollection(tripId).doc(itemId).delete();
    } catch (e) {
      rethrow;
    }
  }

  // Reorder itinerary items
  Future<void> reorderItineraryItems(
    String tripId,
    List<String> itemIds,
    int dayNumber,
  ) async {
    try {
      final batch = _firestore.batch();

      for (var i = 0; i < itemIds.length; i++) {
        final docRef = _itineraryCollection(tripId).doc(itemIds[i]);
        batch.update(docRef, {
          'orderIndex': i,
          'dayNumber': dayNumber,
          'updatedAt': Timestamp.now(),
        });
      }

      await batch.commit();
    } catch (e) {
      rethrow;
    }
  }

  // Move item to different day
  Future<void> moveItemToDay(
    String tripId,
    String itemId,
    int newDayNumber,
  ) async {
    try {
      final newOrderIndex = await _getNextOrderIndex(tripId, newDayNumber);
      await _itineraryCollection(tripId).doc(itemId).update({
        'dayNumber': newDayNumber,
        'orderIndex': newOrderIndex,
        'updatedAt': Timestamp.now(),
      });
    } catch (e) {
      rethrow;
    }
  }

  // Get items by type
  Stream<List<ItineraryItemModel>> getItineraryItemsByType(
    String tripId,
    ItineraryItemType type,
  ) {
    return _itineraryCollection(tripId)
        .where('type', isEqualTo: type.name)
        .orderBy('startTime')
        .snapshots()
        .map((snapshot) {
      return snapshot.docs.map((doc) => ItineraryItemModel.fromFirestore(doc)).toList();
    });
  }

  // Get flights only
  Stream<List<ItineraryItemModel>> getFlights(String tripId) {
    return getItineraryItemsByType(tripId, ItineraryItemType.flight);
  }

  // Get accommodations only
  Stream<List<ItineraryItemModel>> getAccommodations(String tripId) {
    return getItineraryItemsByType(tripId, ItineraryItemType.accommodation);
  }
}
