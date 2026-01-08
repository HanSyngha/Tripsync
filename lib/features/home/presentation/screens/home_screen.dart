import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/widgets/banner_ad_widget.dart';
import '../../../../shared/widgets/trip_card.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../../trip/providers/trip_provider.dart';
import '../../../notifications/providers/notification_provider.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  int _selectedNavIndex = 0;
  static const String _notificationPermissionKey = 'notification_permission_asked';

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _checkNotificationPermission();
    });
  }

  Future<void> _checkNotificationPermission() async {
    final prefs = await SharedPreferences.getInstance();
    final alreadyAsked = prefs.getBool(_notificationPermissionKey) ?? false;

    if (!alreadyAsked && mounted) {
      await prefs.setBool(_notificationPermissionKey, true);
      _showNotificationPermissionDialog();
    }
  }

  void _showNotificationPermissionDialog() {
    final l10n = AppLocalizations.of(context)!;
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (ctx) => AlertDialog(
        title: Text(l10n.permissionRequired),
        content: Text(l10n.notificationPermissionMessage),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(ctx),
            child: Text(l10n.later),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(ctx);
              await ref.read(notificationNotifierProvider.notifier).requestPermission();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
            ),
            child: Text(l10n.allowNotifications),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: IndexedStack(
        index: _selectedNavIndex,
        children: [
          _buildHomeTab(),
          _buildChatTab(),
          _buildProfileTab(),
        ],
      ),
      bottomNavigationBar: _buildBottomNav(),
      floatingActionButton: _selectedNavIndex == 0
          ? FloatingActionButton(
              onPressed: () => context.push('/home/create-trip'),
              backgroundColor: AppColors.primary,
              child: const Icon(Icons.add, color: Colors.white),
            )
          : null,
    );
  }

  Widget _buildHomeTab() {
    final l10n = AppLocalizations.of(context)!;
    final currentUser = ref.watch(currentUserProvider);
    final authUser = ref.watch(authStateProvider).valueOrNull;
    final inProgressTrips = ref.watch(inProgressTripsProvider);
    final filteredTrips = ref.watch(filteredTripsProvider);
    final selectedTab = ref.watch(tripFilterTabProvider);

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // Header
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 16, 20, 0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.welcomeBack,
                        style: TextStyle(
                          fontSize: 13,
                          color: Colors.grey[600],
                        ),
                      ),
                      const SizedBox(height: 2),
                      Builder(
                        builder: (context) {
                          // Debug: print user info
                          final firestoreUser = currentUser.valueOrNull;
                          print('[HomeScreen] Firestore user: ${firestoreUser?.displayName}');
                          print('[HomeScreen] Firebase Auth user: ${authUser?.displayName}');
                          print('[HomeScreen] Auth provider: ${authUser?.providerData.map((p) => p.providerId).join(", ")}');

                          return currentUser.when(
                            data: (user) => Text(
                              user?.displayName ?? authUser?.displayName ?? 'Traveler',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            loading: () => Text(
                              authUser?.displayName ?? 'Traveler',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            error: (_, __) => Text(
                              authUser?.displayName ?? 'Traveler',
                              style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          );
                        },
                      ),
                    ],
                  ),
                  IconButton(
                    onPressed: () => context.push('/notifications'),
                    icon: Stack(
                      children: [
                        const Icon(Icons.notifications_outlined, size: 28),
                        Positioned(
                          right: 0,
                          top: 0,
                          child: Container(
                            width: 8,
                            height: 8,
                            decoration: const BoxDecoration(
                              color: AppColors.coral,
                              shape: BoxShape.circle,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Title
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 16),
              child: RichText(
                text: TextSpan(
                  style: const TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimaryLight,
                  ),
                  children: [
                    TextSpan(text: '${l10n.readyForYour}\n'),
                    TextSpan(
                      text: l10n.nextJourney,
                      style: const TextStyle(color: AppColors.primary),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Tab Bar
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                ),
                padding: const EdgeInsets.all(4),
                child: Row(
                  children: [
                    _buildTabButton(
                      label: l10n.allTrips,
                      isSelected: selectedTab == TripFilterTab.all,
                      onTap: () => ref.read(tripFilterTabProvider.notifier).state =
                          TripFilterTab.all,
                    ),
                    _buildTabButton(
                      label: l10n.hosting,
                      isSelected: selectedTab == TripFilterTab.hosting,
                      onTap: () => ref.read(tripFilterTabProvider.notifier).state =
                          TripFilterTab.hosting,
                    ),
                    _buildTabButton(
                      label: l10n.participating,
                      isSelected: selectedTab == TripFilterTab.participating,
                      onTap: () => ref.read(tripFilterTabProvider.notifier).state =
                          TripFilterTab.participating,
                    ),
                  ],
                ),
              ),
            ),
          ),

          // Happening Now Section
          inProgressTrips.when(
            data: (trips) {
              if (trips.isEmpty) return const SliverToBoxAdapter(child: SizedBox.shrink());
              return SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(20, 24, 20, 0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            l10n.happeningNow,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Icon(
                            Icons.circle,
                            size: 8,
                            color: AppColors.success,
                          ),
                        ],
                      ),
                      const SizedBox(height: 16),
                      HappeningNowCard(
                        trip: trips.first,
                        onTap: () => context.push('/trip/${trips.first.id}'),
                        onManage: () => context.push('/trip/${trips.first.id}'),
                      ),
                    ],
                  ),
                ),
              );
            },
            loading: () => const SliverToBoxAdapter(
              child: Center(child: CircularProgressIndicator()),
            ),
            error: (_, __) => const SliverToBoxAdapter(child: SizedBox.shrink()),
          ),

          // Upcoming Adventures Section
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(20, 24, 20, 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    l10n.upcomingAdventures,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      l10n.viewAll,
                      style: const TextStyle(
                        color: AppColors.primary,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Trip List
          filteredTrips.when(
            data: (trips) {
              if (trips.isEmpty) {
                return SliverToBoxAdapter(
                  child: _buildEmptyState(),
                );
              }
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final trip = trips[index];
                      return TripCard(
                        trip: trip,
                        onTap: () => context.push('/trip/${trip.id}'),
                        showProgress: trip.isInProgress,
                      );
                    },
                    childCount: trips.length,
                  ),
                ),
              );
            },
            loading: () => const SliverToBoxAdapter(
              child: Padding(
                padding: EdgeInsets.all(40),
                child: Center(child: CircularProgressIndicator()),
              ),
            ),
            error: (error, _) => SliverToBoxAdapter(
              child: Center(
                child: Text('Error: $error'),
              ),
            ),
          ),

          // Bottom Padding
          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),
    );
  }

  Widget _buildTabButton({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 200),
          padding: const EdgeInsets.symmetric(vertical: 10),
          decoration: BoxDecoration(
            color: isSelected ? Colors.white : Colors.transparent,
            borderRadius: BorderRadius.circular(8),
            boxShadow: isSelected
                ? [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 4,
                      offset: const Offset(0, 2),
                    ),
                  ]
                : null,
          ),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 13,
              fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
              color: isSelected ? AppColors.primary : Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }

  Widget _buildEmptyState() {
    final l10n = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.luggage_outlined,
            size: 80,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 16),
          Text(
            l10n.noTripsYet,
            style: const TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            l10n.createFirstTrip,
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => context.push('/home/create-trip'),
            icon: const Icon(Icons.add),
            label: Text(l10n.createTrip),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              foregroundColor: Colors.white,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildChatTab() {
    final l10n = AppLocalizations.of(context)!;
    final userTrips = ref.watch(userTripsProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Text(
              l10n.chat,
              style: const TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Expanded(
            child: userTrips.when(
              data: (trips) {
                if (trips.isEmpty) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.chat_bubble_outline,
                          size: 64,
                          color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                        ),
                        const SizedBox(height: 16),
                        Text(
                          l10n.noTripsYet,
                          style: TextStyle(
                            fontSize: 16,
                            color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                          ),
                        ),
                      ],
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: trips.length,
                  itemBuilder: (context, index) {
                    final trip = trips[index];
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundColor: AppColors.primary,
                        child: Text(
                          trip.name.isNotEmpty ? trip.name[0].toUpperCase() : 'T',
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text(trip.name),
                      subtitle: Text(trip.destination),
                      trailing: Icon(
                        Icons.chevron_right,
                        color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                      ),
                      onTap: () => context.push('/trip/${trip.id}/chat'),
                    );
                  },
                );
              },
              loading: () => const Center(child: CircularProgressIndicator()),
              error: (e, _) => Center(child: Text('${l10n.error}: $e')),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileTab() {
    final l10n = AppLocalizations.of(context)!;
    final currentUser = ref.watch(currentUserProvider);
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // Profile Header
            currentUser.when(
              data: (user) => Column(
                children: [
                  const SizedBox(height: 20),
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: AppColors.primary,
                    backgroundImage: user?.photoUrl != null
                        ? NetworkImage(user!.photoUrl!)
                        : null,
                    child: user?.photoUrl == null
                        ? Text(
                            user?.displayName.isNotEmpty == true
                                ? user!.displayName[0].toUpperCase()
                                : '?',
                            style: const TextStyle(
                              fontSize: 36,
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        : null,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    user?.displayName ?? 'User',
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    user?.email ?? '',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                    ),
                  ),
                ],
              ),
              loading: () => const CircularProgressIndicator(),
              error: (_, __) => const Icon(Icons.person, size: 64),
            ),
            const SizedBox(height: 32),
            // Menu Items
            _buildProfileMenuItem(
              icon: Icons.person_outline,
              title: l10n.profile,
              onTap: () => context.push('/settings/profile'),
            ),
            _buildProfileMenuItem(
              icon: Icons.language,
              title: l10n.language,
              onTap: () => context.push('/settings/language'),
            ),
            _buildProfileMenuItem(
              icon: Icons.notifications_outlined,
              title: l10n.notifications,
              onTap: () => context.push('/notifications'),
            ),
            _buildProfileMenuItem(
              icon: Icons.settings_outlined,
              title: l10n.settings,
              onTap: () => context.push('/settings'),
            ),
            const SizedBox(height: 24),
            // Sign Out Button
            SizedBox(
              width: double.infinity,
              child: OutlinedButton.icon(
                onPressed: () async {
                  final confirmed = await showDialog<bool>(
                    context: context,
                    builder: (ctx) => AlertDialog(
                      title: Text(l10n.signOut),
                      content: Text(l10n.logoutConfirmation),
                      actions: [
                        TextButton(
                          onPressed: () => Navigator.pop(ctx, false),
                          child: Text(l10n.cancel),
                        ),
                        TextButton(
                          onPressed: () => Navigator.pop(ctx, true),
                          child: Text(
                            l10n.signOut,
                            style: const TextStyle(color: AppColors.error),
                          ),
                        ),
                      ],
                    ),
                  );
                  if (confirmed == true && mounted) {
                    await ref.read(authNotifierProvider.notifier).signOut();
                    if (mounted) context.go('/login');
                  }
                },
                icon: const Icon(Icons.logout, color: AppColors.error),
                label: Text(
                  l10n.signOut,
                  style: const TextStyle(color: AppColors.error),
                ),
                style: OutlinedButton.styleFrom(
                  side: const BorderSide(color: AppColors.error),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileMenuItem({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(12),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        leading: Icon(icon, color: AppColors.primary),
        title: Text(title),
        trailing: Icon(
          Icons.chevron_right,
          color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
        ),
        onTap: onTap,
      ),
    );
  }

  Widget _buildBottomNav() {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        // Banner Ad
        const BannerAdWidget(),
        // Navigation Bar
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 10,
                offset: const Offset(0, -2),
              ),
            ],
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  _buildNavItem(0, Icons.home_outlined, Icons.home, l10n.home),
                  _buildNavItem(1, Icons.chat_bubble_outline, Icons.chat_bubble, l10n.chat),
                  _buildNavItem(2, Icons.person_outline, Icons.person, l10n.profile),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildNavItem(int index, IconData icon, IconData activeIcon, String label) {
    final isSelected = _selectedNavIndex == index;
    return GestureDetector(
      onTap: () => setState(() => _selectedNavIndex = index),
      behavior: HitTestBehavior.opaque,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              isSelected ? activeIcon : icon,
              color: isSelected ? AppColors.primary : Colors.grey[400],
              size: 24,
            ),
            const SizedBox(height: 4),
            Text(
              label,
              style: TextStyle(
                fontSize: 11,
                fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                color: isSelected ? AppColors.primary : Colors.grey[400],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
