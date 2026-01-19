import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/itinerary_item_model.dart';
import '../../../data/services/itinerary_service.dart';
import '../../../core/constants/app_constants.dart';
import '../../auth/providers/auth_provider.dart';

// Service provider
final itineraryServiceProvider = Provider<ItineraryService>((ref) {
  return ItineraryService();
});

// All itinerary items for a trip
final itineraryItemsProvider =
    StreamProvider.family<List<ItineraryItemModel>, String>((ref, tripId) {
  final service = ref.read(itineraryServiceProvider);
  return service.getItineraryItems(tripId);
});

// Itinerary items for a specific day
final itineraryItemsByDayProvider =
    StreamProvider.family<List<ItineraryItemModel>, ({String tripId, int dayNumber})>((ref, params) {
  final service = ref.read(itineraryServiceProvider);
  return service.getItineraryItemsByDay(params.tripId, params.dayNumber);
});

// Itinerary items grouped by day
final itineraryItemsGroupedProvider =
    StreamProvider.family<Map<int, List<ItineraryItemModel>>, String>((ref, tripId) {
  final service = ref.read(itineraryServiceProvider);
  return service.getItineraryItemsGroupedByDay(tripId);
});

// Current selected day state
final selectedDayProvider = StateProvider.family<int, String>((ref, tripId) => 1);

// Flights only for a trip
final flightsProvider =
    StreamProvider.family<List<ItineraryItemModel>, String>((ref, tripId) {
  final service = ref.read(itineraryServiceProvider);
  return service.getFlights(tripId);
});

// Accommodations only for a trip
final accommodationsProvider =
    StreamProvider.family<List<ItineraryItemModel>, String>((ref, tripId) {
  final service = ref.read(itineraryServiceProvider);
  return service.getAccommodations(tripId);
});

// Itinerary item by type
final itineraryItemsByTypeProvider =
    StreamProvider.family<List<ItineraryItemModel>, ({String tripId, ItineraryItemType type})>((ref, params) {
  final service = ref.read(itineraryServiceProvider);
  return service.getItineraryItemsByType(params.tripId, params.type);
});

// Single itinerary item
final itineraryItemProvider =
    FutureProvider.family<ItineraryItemModel?, ({String tripId, String itemId})>((ref, params) {
  final service = ref.read(itineraryServiceProvider);
  return service.getItineraryItem(params.tripId, params.itemId);
});

// Add itinerary item form state
class AddItineraryItemState {
  final ItineraryItemType selectedType;
  final int selectedDayNumber;
  final bool isLoading;
  final String? errorMessage;

  // Flight fields
  final String? airline;
  final String? flightNumber;
  final String? departureAirport;
  final String? arrivalAirport;
  final DateTime? departureTime;
  final DateTime? arrivalTime;
  final String? terminal;
  final String? departureTerminal;
  final String? arrivalTerminal;
  final String? gate;

  // Accommodation fields
  final String? hotelName;
  final DateTime? checkInTime;
  final DateTime? checkOutTime;
  final String? roomType;
  final String? address;

  // Rental car fields
  final String? carCompany;
  final String? carModel;
  final String? pickupLocation;
  final String? dropoffLocation;
  final DateTime? pickupTime;
  final DateTime? dropoffTime;

  // Restaurant fields
  final String? restaurantName;
  final String? cuisine;
  final String? priceRange;
  final DateTime? reservationTime;

  // Common fields
  final String? title;
  final String? description;
  final String? location;
  final String? notes;
  final String? confirmationNumber;
  final List<String> attachmentUrls;
  final bool notificationsEnabled;

  const AddItineraryItemState({
    this.selectedType = ItineraryItemType.flight,
    this.selectedDayNumber = 1,
    this.isLoading = false,
    this.errorMessage,
    this.airline,
    this.flightNumber,
    this.departureAirport,
    this.arrivalAirport,
    this.departureTime,
    this.arrivalTime,
    this.terminal,
    this.departureTerminal,
    this.arrivalTerminal,
    this.gate,
    this.hotelName,
    this.checkInTime,
    this.checkOutTime,
    this.roomType,
    this.address,
    this.carCompany,
    this.carModel,
    this.pickupLocation,
    this.dropoffLocation,
    this.pickupTime,
    this.dropoffTime,
    this.restaurantName,
    this.cuisine,
    this.priceRange,
    this.reservationTime,
    this.title,
    this.description,
    this.location,
    this.notes,
    this.confirmationNumber,
    this.attachmentUrls = const [],
    this.notificationsEnabled = true,
  });

  AddItineraryItemState copyWith({
    ItineraryItemType? selectedType,
    int? selectedDayNumber,
    bool? isLoading,
    String? errorMessage,
    String? airline,
    String? flightNumber,
    String? departureAirport,
    String? arrivalAirport,
    DateTime? departureTime,
    DateTime? arrivalTime,
    String? terminal,
    String? departureTerminal,
    String? arrivalTerminal,
    String? gate,
    String? hotelName,
    DateTime? checkInTime,
    DateTime? checkOutTime,
    String? roomType,
    String? address,
    String? carCompany,
    String? carModel,
    String? pickupLocation,
    String? dropoffLocation,
    DateTime? pickupTime,
    DateTime? dropoffTime,
    String? restaurantName,
    String? cuisine,
    String? priceRange,
    DateTime? reservationTime,
    String? title,
    String? description,
    String? location,
    String? notes,
    String? confirmationNumber,
    List<String>? attachmentUrls,
    bool? notificationsEnabled,
  }) {
    return AddItineraryItemState(
      selectedType: selectedType ?? this.selectedType,
      selectedDayNumber: selectedDayNumber ?? this.selectedDayNumber,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      airline: airline ?? this.airline,
      flightNumber: flightNumber ?? this.flightNumber,
      departureAirport: departureAirport ?? this.departureAirport,
      arrivalAirport: arrivalAirport ?? this.arrivalAirport,
      departureTime: departureTime ?? this.departureTime,
      arrivalTime: arrivalTime ?? this.arrivalTime,
      terminal: terminal ?? this.terminal,
      departureTerminal: departureTerminal ?? this.departureTerminal,
      arrivalTerminal: arrivalTerminal ?? this.arrivalTerminal,
      gate: gate ?? this.gate,
      hotelName: hotelName ?? this.hotelName,
      checkInTime: checkInTime ?? this.checkInTime,
      checkOutTime: checkOutTime ?? this.checkOutTime,
      roomType: roomType ?? this.roomType,
      address: address ?? this.address,
      carCompany: carCompany ?? this.carCompany,
      carModel: carModel ?? this.carModel,
      pickupLocation: pickupLocation ?? this.pickupLocation,
      dropoffLocation: dropoffLocation ?? this.dropoffLocation,
      pickupTime: pickupTime ?? this.pickupTime,
      dropoffTime: dropoffTime ?? this.dropoffTime,
      restaurantName: restaurantName ?? this.restaurantName,
      cuisine: cuisine ?? this.cuisine,
      priceRange: priceRange ?? this.priceRange,
      reservationTime: reservationTime ?? this.reservationTime,
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      notes: notes ?? this.notes,
      confirmationNumber: confirmationNumber ?? this.confirmationNumber,
      attachmentUrls: attachmentUrls ?? this.attachmentUrls,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }
}

class AddItineraryItemNotifier extends StateNotifier<AddItineraryItemState> {
  final ItineraryService _service;
  final Ref _ref;

  AddItineraryItemNotifier(this._service, this._ref) : super(const AddItineraryItemState());

  void setType(ItineraryItemType type) {
    state = state.copyWith(selectedType: type);
  }

  void setDayNumber(int dayNumber) {
    state = state.copyWith(selectedDayNumber: dayNumber);
  }

  void updateAirline(String value) => state = state.copyWith(airline: value);
  void updateFlightNumber(String value) => state = state.copyWith(flightNumber: value);
  void updateDepartureAirport(String value) => state = state.copyWith(departureAirport: value, departureTerminal: null);
  void updateArrivalAirport(String value) => state = state.copyWith(arrivalAirport: value, arrivalTerminal: null);
  void updateDepartureTime(DateTime value) => state = state.copyWith(departureTime: value);
  void updateArrivalTime(DateTime value) => state = state.copyWith(arrivalTime: value);
  void updateTerminal(String value) => state = state.copyWith(terminal: value);
  void updateDepartureTerminal(String value) => state = state.copyWith(departureTerminal: value);
  void updateArrivalTerminal(String value) => state = state.copyWith(arrivalTerminal: value);
  void updateGate(String value) => state = state.copyWith(gate: value);

  void updateHotelName(String value) => state = state.copyWith(hotelName: value);
  void updateCheckInTime(DateTime value) => state = state.copyWith(checkInTime: value);
  void updateCheckOutTime(DateTime value) => state = state.copyWith(checkOutTime: value);
  void updateRoomType(String value) => state = state.copyWith(roomType: value);
  void updateAddress(String value) => state = state.copyWith(address: value);

  void updateCarCompany(String value) => state = state.copyWith(carCompany: value);
  void updateCarModel(String value) => state = state.copyWith(carModel: value);
  void updatePickupLocation(String value) => state = state.copyWith(pickupLocation: value);
  void updateDropoffLocation(String value) => state = state.copyWith(dropoffLocation: value);
  void updatePickupTime(DateTime value) => state = state.copyWith(pickupTime: value);
  void updateDropoffTime(DateTime value) => state = state.copyWith(dropoffTime: value);

  void updateRestaurantName(String value) => state = state.copyWith(restaurantName: value);
  void updateCuisine(String value) => state = state.copyWith(cuisine: value);
  void updatePriceRange(String value) => state = state.copyWith(priceRange: value);
  void updateReservationTime(DateTime value) => state = state.copyWith(reservationTime: value);

  void updateTitle(String value) => state = state.copyWith(title: value);
  void updateDescription(String value) => state = state.copyWith(description: value);
  void updateLocation(String value) => state = state.copyWith(location: value);
  void updateNotes(String value) => state = state.copyWith(notes: value);
  void updateConfirmationNumber(String value) => state = state.copyWith(confirmationNumber: value);
  void toggleNotifications() => state = state.copyWith(notificationsEnabled: !state.notificationsEnabled);

  void addAttachment(String url) {
    state = state.copyWith(attachmentUrls: [...state.attachmentUrls, url]);
  }

  void removeAttachment(String url) {
    state = state.copyWith(
      attachmentUrls: state.attachmentUrls.where((u) => u != url).toList(),
    );
  }

  void reset() {
    state = const AddItineraryItemState();
  }

  Future<ItineraryItemModel?> save(String tripId) async {
    final user = _ref.read(authStateProvider).valueOrNull;
    if (user == null) {
      state = state.copyWith(errorMessage: 'User not authenticated');
      return null;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      String title;
      DateTime startTime;
      DateTime? endTime;
      Map<String, dynamic>? metadata;

      switch (state.selectedType) {
        case ItineraryItemType.flight:
          title = state.title ?? '${state.departureAirport ?? ''} - ${state.arrivalAirport ?? ''} Flight';
          startTime = state.departureTime ?? DateTime.now();
          endTime = state.arrivalTime;
          metadata = {
            'airline': state.airline,
            'flightNumber': state.flightNumber,
            'departureAirport': state.departureAirport,
            'arrivalAirport': state.arrivalAirport,
            'departureTerminal': state.departureTerminal,
            'arrivalTerminal': state.arrivalTerminal,
            'terminal': state.terminal,
            'gate': state.gate,
          };
          break;
        case ItineraryItemType.accommodation:
          title = state.title ?? state.hotelName ?? 'Accommodation';
          startTime = state.checkInTime ?? DateTime.now();
          endTime = state.checkOutTime;
          metadata = {
            'hotelName': state.hotelName,
            'roomType': state.roomType,
            'checkInTime': state.checkInTime != null ? Timestamp.fromDate(state.checkInTime!) : null,
            'checkOutTime': state.checkOutTime != null ? Timestamp.fromDate(state.checkOutTime!) : null,
          };
          break;
        case ItineraryItemType.rentalCar:
          title = state.title ?? '${state.carCompany ?? ''} Rental';
          startTime = state.pickupTime ?? DateTime.now();
          endTime = state.dropoffTime;
          metadata = {
            'carCompany': state.carCompany,
            'carModel': state.carModel,
            'pickupLocation': state.pickupLocation,
            'dropoffLocation': state.dropoffLocation,
          };
          break;
        case ItineraryItemType.restaurant:
          title = state.title ?? state.restaurantName ?? 'Restaurant';
          startTime = state.reservationTime ?? DateTime.now();
          endTime = state.reservationTime?.add(const Duration(hours: 2));
          metadata = {
            'cuisine': state.cuisine,
            'priceRange': state.priceRange,
            'reservationTime': state.reservationTime?.toIso8601String(),
          };
          break;
        default:
          title = state.title ?? 'Activity';
          startTime = DateTime.now();
          endTime = null;
          metadata = {};
      }

      final item = await _service.createItineraryItem(
        tripId: tripId,
        dayNumber: state.selectedDayNumber,
        type: state.selectedType,
        title: title,
        description: state.description,
        startTime: startTime,
        endTime: endTime,
        location: state.location,
        address: state.address,
        confirmationNumber: state.confirmationNumber,
        notes: state.notes,
        attachmentUrls: state.attachmentUrls,
        metadata: metadata,
        createdBy: user.uid,
      );

      state = state.copyWith(isLoading: false);
      return item;
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      return null;
    }
  }
}

final addItineraryItemProvider =
    StateNotifierProvider.autoDispose<AddItineraryItemNotifier, AddItineraryItemState>((ref) {
  final service = ref.read(itineraryServiceProvider);
  return AddItineraryItemNotifier(service, ref);
});

// Notifier for managing itinerary items
class ItineraryNotifier extends StateNotifier<AsyncValue<void>> {
  final ItineraryService _service;

  ItineraryNotifier(this._service) : super(const AsyncValue.data(null));

  Future<void> deleteItem(String tripId, String itemId) async {
    state = const AsyncValue.loading();
    try {
      await _service.deleteItineraryItem(tripId, itemId);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> updateItem(
    String tripId,
    String itemId,
    Map<String, dynamic> updates,
  ) async {
    state = const AsyncValue.loading();
    try {
      await _service.updateItineraryItem(tripId, itemId, updates);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> reorderItems(
    String tripId,
    List<String> itemIds,
    int dayNumber,
  ) async {
    state = const AsyncValue.loading();
    try {
      await _service.reorderItineraryItems(tripId, itemIds, dayNumber);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> moveItemToDay(
    String tripId,
    String itemId,
    int newDayNumber,
  ) async {
    state = const AsyncValue.loading();
    try {
      await _service.moveItemToDay(tripId, itemId, newDayNumber);
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final itineraryNotifierProvider =
    StateNotifierProvider<ItineraryNotifier, AsyncValue<void>>((ref) {
  final service = ref.read(itineraryServiceProvider);
  return ItineraryNotifier(service);
});

// Bottom navigation state for itinerary screen
enum ItineraryTab { schedule, map, people, settings }

final itineraryTabProvider = StateProvider.family<ItineraryTab, String>((ref, tripId) {
  return ItineraryTab.schedule;
});

// Edit itinerary item form state
class EditItineraryItemState {
  final ItineraryItemType selectedType;
  final int selectedDayNumber;
  final bool isLoading;
  final String? errorMessage;
  final bool isInitialized;

  // Flight fields
  final String? airline;
  final String? flightNumber;
  final String? departureAirport;
  final String? arrivalAirport;
  final DateTime? departureTime;
  final DateTime? arrivalTime;
  final String? terminal;
  final String? gate;

  // Accommodation fields
  final String? hotelName;
  final DateTime? checkInTime;
  final DateTime? checkOutTime;
  final String? roomType;
  final String? address;

  // Rental car fields
  final String? carCompany;
  final String? carModel;
  final String? pickupLocation;
  final String? dropoffLocation;
  final DateTime? pickupTime;
  final DateTime? dropoffTime;

  // Restaurant fields
  final String? restaurantName;
  final String? cuisine;
  final String? priceRange;
  final DateTime? reservationTime;

  // Common fields
  final String? title;
  final String? description;
  final String? location;
  final String? notes;
  final String? confirmationNumber;
  final List<String> attachmentUrls;
  final bool notificationsEnabled;

  const EditItineraryItemState({
    this.selectedType = ItineraryItemType.flight,
    this.selectedDayNumber = 1,
    this.isLoading = false,
    this.errorMessage,
    this.isInitialized = false,
    this.airline,
    this.flightNumber,
    this.departureAirport,
    this.arrivalAirport,
    this.departureTime,
    this.arrivalTime,
    this.terminal,
    this.gate,
    this.hotelName,
    this.checkInTime,
    this.checkOutTime,
    this.roomType,
    this.address,
    this.carCompany,
    this.carModel,
    this.pickupLocation,
    this.dropoffLocation,
    this.pickupTime,
    this.dropoffTime,
    this.restaurantName,
    this.cuisine,
    this.priceRange,
    this.reservationTime,
    this.title,
    this.description,
    this.location,
    this.notes,
    this.confirmationNumber,
    this.attachmentUrls = const [],
    this.notificationsEnabled = true,
  });

  EditItineraryItemState copyWith({
    ItineraryItemType? selectedType,
    int? selectedDayNumber,
    bool? isLoading,
    String? errorMessage,
    bool? isInitialized,
    String? airline,
    String? flightNumber,
    String? departureAirport,
    String? arrivalAirport,
    DateTime? departureTime,
    DateTime? arrivalTime,
    String? terminal,
    String? gate,
    String? hotelName,
    DateTime? checkInTime,
    DateTime? checkOutTime,
    String? roomType,
    String? address,
    String? carCompany,
    String? carModel,
    String? pickupLocation,
    String? dropoffLocation,
    DateTime? pickupTime,
    DateTime? dropoffTime,
    String? restaurantName,
    String? cuisine,
    String? priceRange,
    DateTime? reservationTime,
    String? title,
    String? description,
    String? location,
    String? notes,
    String? confirmationNumber,
    List<String>? attachmentUrls,
    bool? notificationsEnabled,
  }) {
    return EditItineraryItemState(
      selectedType: selectedType ?? this.selectedType,
      selectedDayNumber: selectedDayNumber ?? this.selectedDayNumber,
      isLoading: isLoading ?? this.isLoading,
      errorMessage: errorMessage,
      isInitialized: isInitialized ?? this.isInitialized,
      airline: airline ?? this.airline,
      flightNumber: flightNumber ?? this.flightNumber,
      departureAirport: departureAirport ?? this.departureAirport,
      arrivalAirport: arrivalAirport ?? this.arrivalAirport,
      departureTime: departureTime ?? this.departureTime,
      arrivalTime: arrivalTime ?? this.arrivalTime,
      terminal: terminal ?? this.terminal,
      gate: gate ?? this.gate,
      hotelName: hotelName ?? this.hotelName,
      checkInTime: checkInTime ?? this.checkInTime,
      checkOutTime: checkOutTime ?? this.checkOutTime,
      roomType: roomType ?? this.roomType,
      address: address ?? this.address,
      carCompany: carCompany ?? this.carCompany,
      carModel: carModel ?? this.carModel,
      pickupLocation: pickupLocation ?? this.pickupLocation,
      dropoffLocation: dropoffLocation ?? this.dropoffLocation,
      pickupTime: pickupTime ?? this.pickupTime,
      dropoffTime: dropoffTime ?? this.dropoffTime,
      restaurantName: restaurantName ?? this.restaurantName,
      cuisine: cuisine ?? this.cuisine,
      priceRange: priceRange ?? this.priceRange,
      reservationTime: reservationTime ?? this.reservationTime,
      title: title ?? this.title,
      description: description ?? this.description,
      location: location ?? this.location,
      notes: notes ?? this.notes,
      confirmationNumber: confirmationNumber ?? this.confirmationNumber,
      attachmentUrls: attachmentUrls ?? this.attachmentUrls,
      notificationsEnabled: notificationsEnabled ?? this.notificationsEnabled,
    );
  }
}

class EditItineraryItemNotifier extends StateNotifier<EditItineraryItemState> {
  final ItineraryService _service;
  String? _itemId;
  String? _tripId;

  EditItineraryItemNotifier(this._service) : super(const EditItineraryItemState());

  void initializeFromItem(ItineraryItemModel item) {
    _itemId = item.id;
    _tripId = item.tripId;

    state = EditItineraryItemState(
      selectedType: item.type,
      selectedDayNumber: item.dayNumber,
      isInitialized: true,
      title: item.title,
      description: item.description,
      location: item.location,
      address: item.address,
      notes: item.notes,
      confirmationNumber: item.confirmationNumber,
      attachmentUrls: item.attachmentUrls,
      // Flight fields
      airline: item.metadata?['airline'],
      flightNumber: item.metadata?['flightNumber'],
      departureAirport: item.metadata?['departureAirport'],
      arrivalAirport: item.metadata?['arrivalAirport'],
      departureTime: item.startTime,
      arrivalTime: item.endTime,
      terminal: item.metadata?['terminal'],
      gate: item.metadata?['gate'],
      // Accommodation fields
      hotelName: item.metadata?['hotelName'],
      checkInTime: item.checkInTime,
      checkOutTime: item.checkOutTime,
      roomType: item.metadata?['roomType'],
      // Rental car fields
      carCompany: item.metadata?['carCompany'],
      carModel: item.metadata?['carModel'],
      pickupLocation: item.metadata?['pickupLocation'],
      dropoffLocation: item.metadata?['dropoffLocation'],
      pickupTime: item.type == ItineraryItemType.rentalCar ? item.startTime : null,
      dropoffTime: item.type == ItineraryItemType.rentalCar ? item.endTime : null,
      // Restaurant fields
      restaurantName: item.type == ItineraryItemType.restaurant ? item.title : null,
      cuisine: item.metadata?['cuisine'],
      priceRange: item.metadata?['priceRange'],
      reservationTime: item.type == ItineraryItemType.restaurant ? item.startTime : null,
    );
  }

  void setType(ItineraryItemType type) {
    state = state.copyWith(selectedType: type);
  }

  void setDayNumber(int dayNumber) {
    state = state.copyWith(selectedDayNumber: dayNumber);
  }

  void updateAirline(String value) => state = state.copyWith(airline: value);
  void updateFlightNumber(String value) => state = state.copyWith(flightNumber: value);
  void updateDepartureAirport(String value) => state = state.copyWith(departureAirport: value);
  void updateArrivalAirport(String value) => state = state.copyWith(arrivalAirport: value);
  void updateDepartureTime(DateTime value) => state = state.copyWith(departureTime: value);
  void updateArrivalTime(DateTime value) => state = state.copyWith(arrivalTime: value);
  void updateTerminal(String value) => state = state.copyWith(terminal: value);
  void updateGate(String value) => state = state.copyWith(gate: value);

  void updateHotelName(String value) => state = state.copyWith(hotelName: value);
  void updateCheckInTime(DateTime value) => state = state.copyWith(checkInTime: value);
  void updateCheckOutTime(DateTime value) => state = state.copyWith(checkOutTime: value);
  void updateRoomType(String value) => state = state.copyWith(roomType: value);
  void updateAddress(String value) => state = state.copyWith(address: value);

  void updateCarCompany(String value) => state = state.copyWith(carCompany: value);
  void updateCarModel(String value) => state = state.copyWith(carModel: value);
  void updatePickupLocation(String value) => state = state.copyWith(pickupLocation: value);
  void updateDropoffLocation(String value) => state = state.copyWith(dropoffLocation: value);
  void updatePickupTime(DateTime value) => state = state.copyWith(pickupTime: value);
  void updateDropoffTime(DateTime value) => state = state.copyWith(dropoffTime: value);

  void updateRestaurantName(String value) => state = state.copyWith(restaurantName: value);
  void updateCuisine(String value) => state = state.copyWith(cuisine: value);
  void updatePriceRange(String value) => state = state.copyWith(priceRange: value);
  void updateReservationTime(DateTime value) => state = state.copyWith(reservationTime: value);

  void updateTitle(String value) => state = state.copyWith(title: value);
  void updateDescription(String value) => state = state.copyWith(description: value);
  void updateLocation(String value) => state = state.copyWith(location: value);
  void updateNotes(String value) => state = state.copyWith(notes: value);
  void updateConfirmationNumber(String value) => state = state.copyWith(confirmationNumber: value);
  void toggleNotifications() => state = state.copyWith(notificationsEnabled: !state.notificationsEnabled);

  void addAttachment(String url) {
    state = state.copyWith(attachmentUrls: [...state.attachmentUrls, url]);
  }

  void removeAttachment(String url) {
    state = state.copyWith(
      attachmentUrls: state.attachmentUrls.where((u) => u != url).toList(),
    );
  }

  void reset() {
    _itemId = null;
    _tripId = null;
    state = const EditItineraryItemState();
  }

  Future<bool> save() async {
    if (_itemId == null || _tripId == null) {
      state = state.copyWith(errorMessage: 'Item not initialized');
      return false;
    }

    state = state.copyWith(isLoading: true, errorMessage: null);

    try {
      String title;
      DateTime startTime;
      DateTime? endTime;
      Map<String, dynamic>? metadata;

      switch (state.selectedType) {
        case ItineraryItemType.flight:
          title = state.title ?? '${state.departureAirport ?? ''} - ${state.arrivalAirport ?? ''} Flight';
          startTime = state.departureTime ?? DateTime.now();
          endTime = state.arrivalTime;
          metadata = {
            'airline': state.airline,
            'flightNumber': state.flightNumber,
            'departureAirport': state.departureAirport,
            'arrivalAirport': state.arrivalAirport,
            'terminal': state.terminal,
            'gate': state.gate,
          };
          break;
        case ItineraryItemType.accommodation:
          title = state.title ?? state.hotelName ?? 'Accommodation';
          startTime = state.checkInTime ?? DateTime.now();
          endTime = state.checkOutTime;
          metadata = {
            'hotelName': state.hotelName,
            'roomType': state.roomType,
            'checkInTime': state.checkInTime != null ? Timestamp.fromDate(state.checkInTime!) : null,
            'checkOutTime': state.checkOutTime != null ? Timestamp.fromDate(state.checkOutTime!) : null,
          };
          break;
        case ItineraryItemType.rentalCar:
          title = state.title ?? '${state.carCompany ?? ''} Rental';
          startTime = state.pickupTime ?? DateTime.now();
          endTime = state.dropoffTime;
          metadata = {
            'carCompany': state.carCompany,
            'carModel': state.carModel,
            'pickupLocation': state.pickupLocation,
            'dropoffLocation': state.dropoffLocation,
          };
          break;
        case ItineraryItemType.restaurant:
          title = state.title ?? state.restaurantName ?? 'Restaurant';
          startTime = state.reservationTime ?? DateTime.now();
          endTime = state.reservationTime?.add(const Duration(hours: 2));
          metadata = {
            'cuisine': state.cuisine,
            'priceRange': state.priceRange,
            'reservationTime': state.reservationTime?.toIso8601String(),
          };
          break;
        default:
          title = state.title ?? 'Activity';
          startTime = state.departureTime ?? DateTime.now();
          endTime = state.arrivalTime;
          metadata = {};
      }

      final updates = {
        'dayNumber': state.selectedDayNumber,
        'type': state.selectedType.name,
        'title': title,
        'description': state.description,
        'startTime': Timestamp.fromDate(startTime),
        'endTime': endTime != null ? Timestamp.fromDate(endTime) : null,
        'location': state.location,
        'address': state.address,
        'confirmationNumber': state.confirmationNumber,
        'notes': state.notes,
        'attachmentUrls': state.attachmentUrls,
        'metadata': metadata,
        'updatedAt': Timestamp.now(),
      };

      await _service.updateItineraryItem(_tripId!, _itemId!, updates);

      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, errorMessage: e.toString());
      return false;
    }
  }
}

final editItineraryItemProvider =
    StateNotifierProvider.autoDispose<EditItineraryItemNotifier, EditItineraryItemState>((ref) {
  final service = ref.read(itineraryServiceProvider);
  return EditItineraryItemNotifier(service);
});
