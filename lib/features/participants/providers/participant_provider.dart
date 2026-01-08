import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../core/constants/app_constants.dart';
import '../../../data/models/participant_model.dart';
import '../../../data/services/trip_service.dart';
import '../../auth/providers/auth_provider.dart';
import '../../trip/providers/trip_provider.dart';

/// State for invite link
class InviteLinkState {
  final bool isActive;
  final String? link;
  final DateTime? expiresAt;

  const InviteLinkState({
    this.isActive = false,
    this.link,
    this.expiresAt,
  });

  InviteLinkState copyWith({
    bool? isActive,
    String? link,
    DateTime? expiresAt,
  }) {
    return InviteLinkState(
      isActive: isActive ?? this.isActive,
      link: link ?? this.link,
      expiresAt: expiresAt ?? this.expiresAt,
    );
  }
}

/// State for participant management
class ParticipantManagementState {
  final List<ParticipantModel> hosts;
  final List<ParticipantModel> participants;
  final List<ParticipantModel> pendingInvites;
  final bool isLoading;
  final String? error;
  final String searchQuery;

  const ParticipantManagementState({
    this.hosts = const [],
    this.participants = const [],
    this.pendingInvites = const [],
    this.isLoading = false,
    this.error,
    this.searchQuery = '',
  });

  int get totalParticipating => hosts.length + participants.length;
  int get totalPending => pendingInvites.length;

  List<ParticipantModel> get filteredHosts {
    if (searchQuery.isEmpty) return hosts;
    final query = searchQuery.toLowerCase();
    return hosts.where((p) =>
      p.displayName.toLowerCase().contains(query) ||
      p.email.toLowerCase().contains(query)
    ).toList();
  }

  List<ParticipantModel> get filteredParticipants {
    if (searchQuery.isEmpty) return participants;
    final query = searchQuery.toLowerCase();
    return participants.where((p) =>
      p.displayName.toLowerCase().contains(query) ||
      p.email.toLowerCase().contains(query)
    ).toList();
  }

  List<ParticipantModel> get filteredPendingInvites {
    if (searchQuery.isEmpty) return pendingInvites;
    final query = searchQuery.toLowerCase();
    return pendingInvites.where((p) =>
      p.displayName.toLowerCase().contains(query) ||
      p.email.toLowerCase().contains(query)
    ).toList();
  }

  ParticipantManagementState copyWith({
    List<ParticipantModel>? hosts,
    List<ParticipantModel>? participants,
    List<ParticipantModel>? pendingInvites,
    bool? isLoading,
    String? error,
    String? searchQuery,
  }) {
    return ParticipantManagementState(
      hosts: hosts ?? this.hosts,
      participants: participants ?? this.participants,
      pendingInvites: pendingInvites ?? this.pendingInvites,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      searchQuery: searchQuery ?? this.searchQuery,
    );
  }
}

/// Provider for invite link state
final inviteLinkProvider = StateProvider.family<InviteLinkState, String>((ref, tripId) {
  return InviteLinkState(
    isActive: true,
    link: 'https://tripsync.app/invite/$tripId',
    expiresAt: DateTime.now().add(const Duration(days: 7)),
  );
});

/// Provider for search query
final participantSearchQueryProvider = StateProvider<String>((ref) => '');

/// Provider that streams all participants for a trip
final allParticipantsProvider = StreamProvider.family<List<ParticipantModel>, String>((ref, tripId) {
  final tripService = ref.read(tripServiceProvider);
  return tripService.getParticipants(tripId);
});

/// Provider that organizes participants by role
final participantManagementProvider = Provider.family<ParticipantManagementState, String>((ref, tripId) {
  final participantsAsync = ref.watch(allParticipantsProvider(tripId));
  final searchQuery = ref.watch(participantSearchQueryProvider);

  return participantsAsync.when(
    data: (participants) {
      final hosts = participants.where((p) =>
        p.role == UserRole.host || p.role == UserRole.coHost
      ).toList();

      final regularParticipants = participants.where((p) =>
        p.role == UserRole.participant && p.inviteStatus == InviteStatus.accepted
      ).toList();

      final pending = participants.where((p) =>
        p.inviteStatus == InviteStatus.pending
      ).toList();

      return ParticipantManagementState(
        hosts: hosts,
        participants: regularParticipants,
        pendingInvites: pending,
        searchQuery: searchQuery,
      );
    },
    loading: () => const ParticipantManagementState(isLoading: true),
    error: (error, _) => ParticipantManagementState(error: error.toString()),
  );
});

/// Notifier for participant actions
class ParticipantActionsNotifier extends StateNotifier<AsyncValue<void>> {
  final TripService _tripService;
  final String tripId;

  ParticipantActionsNotifier(this._tripService, this.tripId)
      : super(const AsyncValue.data(null));

  /// Send an invite to a new participant
  Future<bool> inviteParticipant({
    required String email,
    required UserRole role,
    required bool canEditSchedule,
    required bool canUploadPhotos,
    required String invitedBy,
  }) async {
    state = const AsyncValue.loading();
    try {
      final participant = ParticipantModel(
        id: '',
        oderId: '',
        tripId: tripId,
        displayName: email.split('@').first,
        email: email,
        role: role,
        canEditSchedule: canEditSchedule,
        canUploadPhotos: canUploadPhotos,
        joinedAt: DateTime.now(),
        inviteStatus: InviteStatus.pending,
        invitedBy: invitedBy,
      );

      await _tripService.addParticipantModel(tripId, participant);
      state = const AsyncValue.data(null);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  /// Resend invite to a pending participant
  Future<bool> resendInvite(String participantId) async {
    state = const AsyncValue.loading();
    try {
      await _tripService.resendInvite(tripId, participantId);
      state = const AsyncValue.data(null);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  /// Remove a participant from the trip
  Future<bool> removeParticipant(String participantId) async {
    state = const AsyncValue.loading();
    try {
      await _tripService.removeParticipant(tripId, participantId);
      state = const AsyncValue.data(null);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  /// Update participant permissions
  Future<bool> updatePermissions({
    required String participantId,
    bool? canEditSchedule,
    bool? canUploadPhotos,
  }) async {
    state = const AsyncValue.loading();
    try {
      await _tripService.updateParticipantPermissions(
        tripId,
        participantId,
        canEditSchedule: canEditSchedule,
        canUploadPhotos: canUploadPhotos,
      );
      state = const AsyncValue.data(null);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  /// Change participant role
  Future<bool> updateRole({
    required String participantId,
    required UserRole newRole,
  }) async {
    state = const AsyncValue.loading();
    try {
      await _tripService.updateParticipantRole(tripId, participantId, newRole);
      state = const AsyncValue.data(null);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  /// Toggle invite link active status
  Future<bool> toggleInviteLink(bool isActive) async {
    state = const AsyncValue.loading();
    try {
      await _tripService.setInviteLinkActive(tripId, isActive);
      state = const AsyncValue.data(null);
      return true;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return false;
    }
  }

  /// Generate a new invite link
  Future<String?> generateInviteLink() async {
    state = const AsyncValue.loading();
    try {
      final link = await _tripService.generateInviteLink(tripId);
      state = const AsyncValue.data(null);
      return link;
    } catch (e, st) {
      state = AsyncValue.error(e, st);
      return null;
    }
  }
}

/// Provider for participant actions
final participantActionsProvider = StateNotifierProvider.family<
    ParticipantActionsNotifier, AsyncValue<void>, String>((ref, tripId) {
  final tripService = ref.read(tripServiceProvider);
  return ParticipantActionsNotifier(tripService, tripId);
});

/// Provider to check if current user can manage participants
final canManageParticipantsProvider = FutureProvider.family<bool, String>((ref, tripId) async {
  final authState = ref.watch(authStateProvider);
  final user = authState.valueOrNull;

  if (user == null) return false;

  final tripService = ref.read(tripServiceProvider);
  return tripService.canManageTrip(tripId, user.uid);
});

/// Provider for invite form state
class InviteFormState {
  final String email;
  final UserRole role;
  final bool canEditSchedule;
  final bool canUploadPhotos;
  final bool isSubmitting;
  final String? emailError;

  const InviteFormState({
    this.email = '',
    this.role = UserRole.participant,
    this.canEditSchedule = false,
    this.canUploadPhotos = true,
    this.isSubmitting = false,
    this.emailError,
  });

  bool get isValid => email.isNotEmpty && emailError == null;

  InviteFormState copyWith({
    String? email,
    UserRole? role,
    bool? canEditSchedule,
    bool? canUploadPhotos,
    bool? isSubmitting,
    String? emailError,
    bool clearEmailError = false,
  }) {
    return InviteFormState(
      email: email ?? this.email,
      role: role ?? this.role,
      canEditSchedule: canEditSchedule ?? this.canEditSchedule,
      canUploadPhotos: canUploadPhotos ?? this.canUploadPhotos,
      isSubmitting: isSubmitting ?? this.isSubmitting,
      emailError: clearEmailError ? null : (emailError ?? this.emailError),
    );
  }
}

class InviteFormNotifier extends StateNotifier<InviteFormState> {
  InviteFormNotifier() : super(const InviteFormState());

  void setEmail(String email) {
    String? error;
    if (email.isNotEmpty && !_isValidEmail(email)) {
      error = '올바른 이메일 형식을 입력해주세요';
    }
    state = state.copyWith(email: email, emailError: error, clearEmailError: error == null);
  }

  void setRole(UserRole role) {
    state = state.copyWith(role: role);
  }

  void setCanEditSchedule(bool value) {
    state = state.copyWith(canEditSchedule: value);
  }

  void setCanUploadPhotos(bool value) {
    state = state.copyWith(canUploadPhotos: value);
  }

  void setSubmitting(bool value) {
    state = state.copyWith(isSubmitting: value);
  }

  void reset() {
    state = const InviteFormState();
  }

  bool _isValidEmail(String email) {
    return RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(email);
  }
}

final inviteFormProvider = StateNotifierProvider.autoDispose<InviteFormNotifier, InviteFormState>((ref) {
  return InviteFormNotifier();
});
