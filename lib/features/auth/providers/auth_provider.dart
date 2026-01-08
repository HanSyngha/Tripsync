import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../data/models/user_model.dart';
import '../../../data/services/auth_service.dart';
import '../../../data/services/user_service.dart';

final authServiceProvider = Provider<AuthService>((ref) {
  return AuthService();
});

final userServiceProvider = Provider<UserService>((ref) {
  return UserService();
});

final authStateProvider = StreamProvider<User?>((ref) {
  return FirebaseAuth.instance.authStateChanges();
});

final currentUserProvider = FutureProvider<UserModel?>((ref) async {
  final authState = ref.watch(authStateProvider);
  final user = authState.valueOrNull;

  if (user == null) return null;

  final userService = ref.read(userServiceProvider);
  return userService.getUser(user.uid);
});

final currentUserStreamProvider = StreamProvider<UserModel?>((ref) {
  final authState = ref.watch(authStateProvider);
  final user = authState.valueOrNull;

  if (user == null) return Stream.value(null);

  final userService = ref.read(userServiceProvider);
  return userService.getUserStream(user.uid);
});

class AuthNotifier extends StateNotifier<AsyncValue<User?>> {
  final AuthService _authService;
  final UserService _userService;

  AuthNotifier(this._authService, this._userService) : super(const AsyncValue.loading()) {
    _init();
  }

  void _init() {
    FirebaseAuth.instance.authStateChanges().listen((user) {
      state = AsyncValue.data(user);
    });
  }

  Future<void> signInWithGoogle() async {
    state = const AsyncValue.loading();
    try {
      final userCredential = await _authService.signInWithGoogle();
      if (userCredential?.user != null) {
        await _userService.createOrUpdateUser(userCredential!.user!);
      }
      state = AsyncValue.data(userCredential?.user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signInWithKakao() async {
    state = const AsyncValue.loading();
    try {
      final userCredential = await _authService.signInWithKakao();
      if (userCredential?.user != null) {
        await _userService.createOrUpdateUser(userCredential!.user!);
      }
      state = AsyncValue.data(userCredential?.user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signInWithNaver() async {
    state = const AsyncValue.loading();
    try {
      final userCredential = await _authService.signInWithNaver();
      if (userCredential?.user != null) {
        await _userService.createOrUpdateUser(userCredential!.user!);
      }
      state = AsyncValue.data(userCredential?.user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signInWithApple() async {
    state = const AsyncValue.loading();
    try {
      final userCredential = await _authService.signInWithApple();
      if (userCredential?.user != null) {
        await _userService.createOrUpdateUser(userCredential!.user!);
      }
      state = AsyncValue.data(userCredential?.user);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> signOut() async {
    state = const AsyncValue.loading();
    try {
      await _authService.signOut();
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }

  Future<void> deleteAccount() async {
    state = const AsyncValue.loading();
    try {
      final currentUser = _authService.currentUser;
      if (currentUser != null) {
        // Delete user data from Firestore first
        await _userService.deleteUserData(currentUser.uid);
        // Then delete the Firebase Auth account
        await _authService.deleteAccount();
      }
      state = const AsyncValue.data(null);
    } catch (e, st) {
      state = AsyncValue.error(e, st);
    }
  }
}

final authNotifierProvider = StateNotifierProvider<AuthNotifier, AsyncValue<User?>>((ref) {
  final authService = ref.watch(authServiceProvider);
  final userService = ref.watch(userServiceProvider);
  return AuthNotifier(authService, userService);
});
