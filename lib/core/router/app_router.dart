import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../features/auth/presentation/screens/login_screen.dart';
import '../../features/auth/presentation/screens/splash_screen.dart';
import '../../features/home/presentation/screens/home_screen.dart';
import '../../features/trip/presentation/screens/trip_detail_screen.dart';
import '../../features/trip/presentation/screens/create_trip_screen.dart';
import '../../features/trip/presentation/screens/edit_trip_screen.dart';
import '../../features/itinerary/presentation/screens/itinerary_screen.dart';
import '../../features/itinerary/presentation/screens/add_itinerary_item_screen.dart';
import '../../features/itinerary/presentation/screens/edit_itinerary_item_screen.dart';
import '../../features/participants/presentation/screens/participants_screen.dart';
import '../../features/participants/presentation/screens/invite_participant_screen.dart';
import '../../features/chat/presentation/screens/chat_screen.dart';
import '../../features/chat/presentation/screens/send_announcement_screen.dart';
import '../../features/notifications/presentation/screens/notifications_screen.dart';
import '../../features/settings/presentation/screens/settings_screen.dart';
import '../../features/settings/presentation/screens/language_settings_screen.dart';
import '../../features/settings/presentation/screens/profile_screen.dart';
import '../../features/auth/providers/auth_provider.dart';

final routerProvider = Provider<GoRouter>((ref) {
  final authState = ref.watch(authStateProvider);

  return GoRouter(
    initialLocation: '/',
    debugLogDiagnostics: true,
    redirect: (context, state) {
      final isLoggedIn = authState.valueOrNull != null;
      final isLoggingIn = state.matchedLocation == '/login';
      final isSplash = state.matchedLocation == '/';

      if (isSplash) return null;

      if (!isLoggedIn && !isLoggingIn) {
        return '/login';
      }

      if (isLoggedIn && isLoggingIn) {
        return '/home';
      }

      return null;
    },
    routes: [
      GoRoute(
        path: '/',
        name: 'splash',
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: '/login',
        name: 'login',
        builder: (context, state) => const LoginScreen(),
      ),
      GoRoute(
        path: '/home',
        name: 'home',
        builder: (context, state) => const HomeScreen(),
        routes: [
          GoRoute(
            path: 'create-trip',
            name: 'create-trip',
            builder: (context, state) => const CreateTripScreen(),
          ),
        ],
      ),
      GoRoute(
        path: '/trip/:tripId',
        name: 'trip-detail',
        builder: (context, state) {
          final tripId = state.pathParameters['tripId']!;
          return TripDetailScreen(tripId: tripId);
        },
        routes: [
          GoRoute(
            path: 'edit',
            name: 'edit-trip',
            builder: (context, state) {
              final tripId = state.pathParameters['tripId']!;
              return EditTripScreen(tripId: tripId);
            },
          ),
          GoRoute(
            path: 'itinerary',
            name: 'itinerary',
            builder: (context, state) {
              final tripId = state.pathParameters['tripId']!;
              return ItineraryScreen(tripId: tripId);
            },
            routes: [
              GoRoute(
                path: 'add',
                name: 'add-itinerary-item',
                builder: (context, state) {
                  final tripId = state.pathParameters['tripId']!;
                  final initialDay = int.tryParse(
                    state.uri.queryParameters['day'] ?? '1',
                  ) ?? 1;
                  return AddItineraryItemScreen(
                    tripId: tripId,
                    initialDay: initialDay,
                  );
                },
              ),
              GoRoute(
                path: 'edit/:itemId',
                name: 'edit-itinerary-item',
                builder: (context, state) {
                  final tripId = state.pathParameters['tripId']!;
                  final itemId = state.pathParameters['itemId']!;
                  return EditItineraryItemScreen(
                    tripId: tripId,
                    itemId: itemId,
                  );
                },
              ),
            ],
          ),
          GoRoute(
            path: 'participants',
            name: 'participants',
            builder: (context, state) {
              final tripId = state.pathParameters['tripId']!;
              return ParticipantsScreen(tripId: tripId);
            },
            routes: [
              GoRoute(
                path: 'invite',
                name: 'invite-participant',
                builder: (context, state) {
                  final tripId = state.pathParameters['tripId']!;
                  return InviteParticipantScreen(tripId: tripId);
                },
              ),
            ],
          ),
          GoRoute(
            path: 'chat',
            name: 'chat',
            builder: (context, state) {
              final tripId = state.pathParameters['tripId']!;
              return ChatScreen(tripId: tripId);
            },
          ),
          GoRoute(
            path: 'announcement',
            name: 'send-announcement',
            builder: (context, state) {
              final tripId = state.pathParameters['tripId']!;
              return SendAnnouncementScreen(tripId: tripId);
            },
          ),
        ],
      ),
      GoRoute(
        path: '/notifications',
        name: 'notifications',
        builder: (context, state) => const NotificationsScreen(),
      ),
      GoRoute(
        path: '/settings',
        name: 'settings',
        builder: (context, state) => const SettingsScreen(),
        routes: [
          GoRoute(
            path: 'language',
            name: 'language-settings',
            builder: (context, state) => const LanguageSettingsScreen(),
          ),
          GoRoute(
            path: 'profile',
            name: 'profile',
            builder: (context, state) => const ProfileScreen(),
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) => Scaffold(
      body: Center(
        child: Text('Page not found: ${state.uri.path}'),
      ),
    ),
  );
});
