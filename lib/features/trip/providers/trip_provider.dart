import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/trip_model.dart';
import '../../../data/models/participant_model.dart';
import '../../../data/services/trip_service.dart';
import '../../auth/providers/auth_provider.dart';

final tripServiceProvider = Provider<TripService>((ref) {
  return TripService();
});

// All user trips
final userTripsProvider = StreamProvider<List<TripModel>>((ref) {
  final authState = ref.watch(authStateProvider);
  final user = authState.valueOrNull;

  if (user == null) return Stream.value([]);

  final tripService = ref.read(tripServiceProvider);
  return tripService.getUserTrips(user.uid);
});

// Upcoming trips
final upcomingTripsProvider = StreamProvider<List<TripModel>>((ref) {
  final authState = ref.watch(authStateProvider);
  final user = authState.valueOrNull;

  if (user == null) return Stream.value([]);

  final tripService = ref.read(tripServiceProvider);
  return tripService.getUpcomingTrips(user.uid);
});

// In-progress trips
final inProgressTripsProvider = StreamProvider<List<TripModel>>((ref) {
  final authState = ref.watch(authStateProvider);
  final user = authState.valueOrNull;

  if (user == null) return Stream.value([]);

  final tripService = ref.read(tripServiceProvider);
  return tripService.getInProgressTrips(user.uid);
});

// Completed trips
final completedTripsProvider = StreamProvider<List<TripModel>>((ref) {
  final authState = ref.watch(authStateProvider);
  final user = authState.valueOrNull;

  if (user == null) return Stream.value([]);

  final tripService = ref.read(tripServiceProvider);
  return tripService.getCompletedTrips(user.uid);
});

// Single trip by ID
final tripProvider = StreamProvider.family<TripModel?, String>((ref, tripId) {
  final tripService = ref.read(tripServiceProvider);
  return tripService.getTripStream(tripId);
});

// Trip participants
final tripParticipantsProvider =
    StreamProvider.family<List<ParticipantModel>, String>((ref, tripId) {
  final tripService = ref.read(tripServiceProvider);
  return tripService.getParticipants(tripId);
});

// Current user's participant info for a trip
final currentUserParticipantProvider =
    FutureProvider.family<ParticipantModel?, String>((ref, tripId) async {
  final authState = ref.watch(authStateProvider);
  final user = authState.valueOrNull;

  if (user == null) return null;

  final tripService = ref.read(tripServiceProvider);
  return tripService.getParticipant(tripId, user.uid);
});

// Check if current user is host
final isHostProvider = FutureProvider.family<bool, String>((ref, tripId) async {
  final authState = ref.watch(authStateProvider);
  final user = authState.valueOrNull;

  if (user == null) return false;

  final tripService = ref.read(tripServiceProvider);
  return tripService.isHost(tripId, user.uid);
});

// Check if current user can manage trip
final canManageTripProvider =
    FutureProvider.family<bool, String>((ref, tripId) async {
  final authState = ref.watch(authStateProvider);
  final user = authState.valueOrNull;

  if (user == null) return false;

  final tripService = ref.read(tripServiceProvider);
  return tripService.canManageTrip(tripId, user.uid);
});

// Trips where user is host
final hostingTripsProvider = Provider<AsyncValue<List<TripModel>>>((ref) {
  final authState = ref.watch(authStateProvider);
  final user = authState.valueOrNull;
  final allTrips = ref.watch(userTripsProvider);

  if (user == null) return const AsyncValue.data([]);

  return allTrips.whenData((trips) {
    return trips.where((trip) => trip.hostId == user.uid).toList();
  });
});

// Trips where user is participant (not host)
final participatingTripsProvider = Provider<AsyncValue<List<TripModel>>>((ref) {
  final authState = ref.watch(authStateProvider);
  final user = authState.valueOrNull;
  final allTrips = ref.watch(userTripsProvider);

  if (user == null) return const AsyncValue.data([]);

  return allTrips.whenData((trips) {
    return trips.where((trip) => trip.hostId != user.uid).toList();
  });
});

// Tab filter state for home screen
enum TripFilterTab { all, hosting, participating }

final tripFilterTabProvider = StateProvider<TripFilterTab>((ref) {
  return TripFilterTab.all;
});

// Filtered trips based on selected tab
final filteredTripsProvider = Provider<AsyncValue<List<TripModel>>>((ref) {
  final tab = ref.watch(tripFilterTabProvider);
  final allTrips = ref.watch(userTripsProvider);
  final hostingTrips = ref.watch(hostingTripsProvider);
  final participatingTrips = ref.watch(participatingTripsProvider);

  switch (tab) {
    case TripFilterTab.all:
      return allTrips;
    case TripFilterTab.hosting:
      return hostingTrips;
    case TripFilterTab.participating:
      return participatingTrips;
  }
});
