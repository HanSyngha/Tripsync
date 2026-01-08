import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/generated/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:cached_network_image/cached_network_image.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../data/models/trip_model.dart';
import '../../../../data/models/itinerary_item_model.dart';
import '../../../../core/constants/app_constants.dart';
import '../../providers/trip_provider.dart';

/// Provider for itinerary items
final tripItineraryProvider =
    StreamProvider.family<List<ItineraryItemModel>, String>((ref, tripId) {
  // In a real app, this would fetch from itinerary service
  // For now, return empty stream
  return Stream.value([]);
});

/// Provider for selected tab in trip detail
final tripDetailTabProvider = StateProvider.autoDispose<int>((ref) => 0);

class TripDetailScreen extends ConsumerWidget {
  final String tripId;

  const TripDetailScreen({
    super.key,
    required this.tripId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final tripAsync = ref.watch(tripProvider(tripId));
    final isHost = ref.watch(isHostProvider(tripId));

    return tripAsync.when(
      loading: () => Scaffold(
        backgroundColor: AppColors.backgroundLight,
        body: const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
      ),
      error: (error, _) => Scaffold(
        backgroundColor: AppColors.backgroundLight,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textPrimaryLight),
            onPressed: () => context.pop(),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.error_outline, size: 64, color: Colors.grey[400]),
              const SizedBox(height: 16),
              Text(
                l10n.error,
                style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 32),
                child: Text(
                  error.toString(),
                  style: TextStyle(color: Colors.grey[600]),
                  textAlign: TextAlign.center,
                ),
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => ref.refresh(tripProvider(tripId)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                ),
                child: Text(l10n.tryAgain),
              ),
            ],
          ),
        ),
      ),
      data: (trip) {
        if (trip == null) {
          return Scaffold(
            backgroundColor: AppColors.backgroundLight,
            appBar: AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: AppColors.textPrimaryLight),
                onPressed: () => context.pop(),
              ),
            ),
            body: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.search_off, size: 64, color: Colors.grey[400]),
                  const SizedBox(height: 16),
                  const Text(
                    'Trip not found',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          );
        }

        return _TripDetailContent(
          trip: trip,
          isHost: isHost.valueOrNull ?? false,
        );
      },
    );
  }
}

class _TripDetailContent extends ConsumerWidget {
  final TripModel trip;
  final bool isHost;

  const _TripDetailContent({
    required this.trip,
    required this.isHost,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = AppLocalizations.of(context)!;
    final dateFormat = DateFormat('MMM d, yyyy');
    final daysUntilTrip = trip.startDate.difference(DateTime.now()).inDays;

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      body: CustomScrollView(
        slivers: [
          // Cover image with gradient overlay
          SliverAppBar(
            expandedHeight: 280,
            pinned: true,
            backgroundColor: AppColors.primary,
            leading: IconButton(
              icon: Container(
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.3),
                  shape: BoxShape.circle,
                ),
                child: const Icon(Icons.arrow_back, color: Colors.white, size: 20),
              ),
              onPressed: () => context.pop(),
            ),
            actions: [
              if (isHost)
                IconButton(
                  icon: Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.3),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.edit, color: Colors.white, size: 20),
                  ),
                  onPressed: () => context.push('/trip/${trip.id}/edit'),
                ),
              IconButton(
                icon: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.3),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.share, color: Colors.white, size: 20),
                ),
                onPressed: () {
                  // TODO: Share trip
                },
              ),
            ],
            flexibleSpace: FlexibleSpaceBar(
              background: Stack(
                fit: StackFit.expand,
                children: [
                  // Cover image
                  trip.coverImageUrl != null
                      ? CachedNetworkImage(
                          imageUrl: trip.coverImageUrl!,
                          fit: BoxFit.cover,
                          placeholder: (context, url) => Container(
                            color: AppColors.primary,
                          ),
                          errorWidget: (context, url, error) => Container(
                            color: AppColors.primary,
                            child: const Center(
                              child: Icon(
                                Icons.landscape_outlined,
                                size: 64,
                                color: Colors.white30,
                              ),
                            ),
                          ),
                        )
                      : Container(
                          color: AppColors.primary,
                          child: const Center(
                            child: Icon(
                              Icons.landscape_outlined,
                              size: 64,
                              color: Colors.white30,
                            ),
                          ),
                        ),

                  // Gradient overlay
                  Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Colors.transparent,
                          Colors.black.withOpacity(0.7),
                        ],
                        stops: const [0.4, 1.0],
                      ),
                    ),
                  ),

                  // Trip info on cover
                  Positioned(
                    bottom: 20,
                    left: 20,
                    right: 20,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Status badge
                        Container(
                          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
                          decoration: BoxDecoration(
                            color: trip.isInProgress
                                ? AppColors.success
                                : trip.isUpcoming
                                    ? AppColors.primary
                                    : Colors.grey,
                            borderRadius: BorderRadius.circular(4),
                          ),
                          child: Text(
                            trip.isInProgress
                                ? l10n.inProgress
                                : trip.isUpcoming
                                    ? 'Upcoming'
                                    : 'Completed',
                            style: const TextStyle(
                              fontSize: 11,
                              fontWeight: FontWeight.w600,
                              color: Colors.white,
                            ),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Trip name
                        Text(
                          trip.name,
                          style: const TextStyle(
                            fontSize: 28,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const SizedBox(height: 8),

                        // Date and duration
                        Row(
                          children: [
                            const Icon(
                              Icons.calendar_today_outlined,
                              size: 14,
                              color: Colors.white70,
                            ),
                            const SizedBox(width: 6),
                            Text(
                              '${dateFormat.format(trip.startDate)} - ${dateFormat.format(trip.endDate)}',
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.white70,
                              ),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                              decoration: BoxDecoration(
                                color: Colors.white.withOpacity(0.2),
                                borderRadius: BorderRadius.circular(4),
                              ),
                              child: Text(
                                '${trip.totalDays} ${trip.totalDays == 1 ? 'Day' : 'Days'}',
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Quick action tabs
          SliverToBoxAdapter(
            child: Container(
              margin: const EdgeInsets.all(16),
              padding: const EdgeInsets.all(4),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  _buildQuickActionTab(
                    context,
                    icon: Icons.map_outlined,
                    label: l10n.mapView,
                    onTap: () {
                      context.push('/trip/${trip.id}/itinerary?view=map');
                    },
                  ),
                  _buildQuickActionTab(
                    context,
                    icon: Icons.chat_bubble_outline,
                    label: l10n.groupChat,
                    onTap: () {
                      context.push('/trip/${trip.id}/chat');
                    },
                  ),
                  _buildQuickActionTab(
                    context,
                    icon: Icons.folder_outlined,
                    label: l10n.savedDocs,
                    onTap: () {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(l10n.featureComingSoon)),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),

          // Don't forget reminder box
          if (trip.isUpcoming)
            SliverToBoxAdapter(
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: 16),
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.warningLight,
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: AppColors.warning.withOpacity(0.3)),
                ),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: AppColors.warning.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: const Icon(
                        Icons.notifications_active_outlined,
                        color: AppColors.warning,
                        size: 20,
                      ),
                    ),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.dontForget,
                            style: const TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: AppColors.warning,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            'Pack your passport and travel documents',
                            style: TextStyle(
                              fontSize: 12,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Icon(
                      Icons.chevron_right,
                      color: Colors.grey[600],
                    ),
                  ],
                ),
              ),
            ),

          // Overview section
          SliverToBoxAdapter(
            child: _buildSection(
              context,
              title: l10n.overview,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Destination
                  Row(
                    children: [
                      Icon(Icons.location_on_outlined, size: 18, color: Colors.grey[600]),
                      const SizedBox(width: 8),
                      Text(
                        trip.destination,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),

                  // Description
                  if (trip.description != null && trip.description!.isNotEmpty) ...[
                    Text(
                      trip.description!,
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[700],
                        height: 1.5,
                      ),
                    ),
                    const SizedBox(height: 16),
                  ],

                  // Tags
                  if (trip.tags.isNotEmpty)
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: trip.tags.map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _getTagIcon(tag),
                                size: 14,
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                tag,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),

                  // Sample tags if none exist
                  if (trip.tags.isEmpty)
                    Wrap(
                      spacing: 8,
                      runSpacing: 8,
                      children: ['Nature', 'Coffee', 'Culture'].map((tag) {
                        return Container(
                          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                          decoration: BoxDecoration(
                            color: AppColors.primary.withOpacity(0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                _getTagIcon(tag),
                                size: 14,
                                color: AppColors.primary,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                tag,
                                style: const TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w500,
                                  color: AppColors.primary,
                                ),
                              ),
                            ],
                          ),
                        );
                      }).toList(),
                    ),
                ],
              ),
            ),
          ),

          // Itinerary section
          SliverToBoxAdapter(
            child: _buildSection(
              context,
              title: l10n.itinerary,
              trailing: TextButton(
                onPressed: () {},
                child: Text(
                  l10n.expandAll,
                  style: const TextStyle(
                    fontSize: 13,
                    color: AppColors.primary,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              child: _buildItineraryTimeline(context, trip, ref),
            ),
          ),

          // Accommodation section
          SliverToBoxAdapter(
            child: _buildSection(
              context,
              title: l10n.accommodation,
              child: _buildAccommodationCard(context, l10n),
            ),
          ),

          // Bottom padding for footer
          const SliverToBoxAdapter(
            child: SizedBox(height: 100),
          ),
        ],
      ),

      // Footer with countdown and check-in button
      bottomNavigationBar: trip.isUpcoming
          ? Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: SafeArea(
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            l10n.tripStartsIn(daysUntilTrip.abs()),
                            style: const TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: AppColors.textPrimaryLight,
                            ),
                          ),
                          const SizedBox(height: 2),
                          Text(
                            dateFormat.format(trip.startDate),
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                    ElevatedButton.icon(
                      onPressed: () {
                        // TODO: Handle check-in
                      },
                      icon: const Icon(Icons.check_circle_outline, size: 20),
                      label: Text(l10n.checkIn),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.coral,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            )
          : null,
    );
  }

  Widget _buildQuickActionTab(
    BuildContext context, {
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12),
          child: Column(
            children: [
              Icon(icon, color: AppColors.primary, size: 24),
              const SizedBox(height: 4),
              Text(
                label,
                style: const TextStyle(
                  fontSize: 11,
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection(
    BuildContext context, {
    required String title,
    required Widget child,
    Widget? trailing,
  }) {
    return Container(
      margin: const EdgeInsets.fromLTRB(16, 16, 16, 0),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimaryLight,
                ),
              ),
              if (trailing != null) trailing,
            ],
          ),
          const SizedBox(height: 16),
          child,
        ],
      ),
    );
  }

  Widget _buildItineraryTimeline(BuildContext context, TripModel trip, WidgetRef ref) {
    // Generate sample days based on trip duration
    final days = List.generate(
      trip.totalDays > 5 ? 5 : trip.totalDays,
      (index) => index + 1,
    );

    return Column(
      children: days.map((dayNumber) {
        final date = trip.startDate.add(Duration(days: dayNumber - 1));
        final dateFormat = DateFormat('EEE, MMM d');
        final isCurrentDay = trip.isInProgress && trip.currentDay == dayNumber;

        return _buildDaySection(
          context,
          dayNumber: dayNumber,
          date: dateFormat.format(date),
          isCurrentDay: isCurrentDay,
          activities: _getSampleActivities(dayNumber),
        );
      }).toList(),
    );
  }

  List<Map<String, dynamic>> _getSampleActivities(int day) {
    // Sample activities for demonstration
    if (day == 1) {
      return [
        {
          'time': '08:00',
          'title': 'Arrive at destination',
          'type': ItineraryItemType.flight,
          'location': 'Airport',
        },
        {
          'time': '14:00',
          'title': 'Hotel Check-in',
          'type': ItineraryItemType.accommodation,
          'location': 'Hotel Grand Plaza',
        },
      ];
    } else if (day == 2) {
      return [
        {
          'time': '09:00',
          'title': 'City Tour',
          'type': ItineraryItemType.activity,
          'location': 'City Center',
        },
        {
          'time': '12:30',
          'title': 'Lunch at Local Restaurant',
          'type': ItineraryItemType.restaurant,
          'location': 'Traditional Cuisine',
        },
      ];
    }
    return [];
  }

  Widget _buildDaySection(
    BuildContext context, {
    required int dayNumber,
    required String date,
    required bool isCurrentDay,
    required List<Map<String, dynamic>> activities,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Day header
          Row(
            children: [
              Container(
                width: 36,
                height: 36,
                decoration: BoxDecoration(
                  color: isCurrentDay ? AppColors.primary : Colors.grey[200],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Center(
                  child: Text(
                    '$dayNumber',
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.bold,
                      color: isCurrentDay ? Colors.white : Colors.grey[700],
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Day $dayNumber',
                    style: const TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Text(
                    date,
                    style: TextStyle(
                      fontSize: 12,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              if (isCurrentDay)
                Container(
                  margin: const EdgeInsets.only(left: 8),
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.success.withOpacity(0.1),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: const Text(
                    'Today',
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: AppColors.success,
                    ),
                  ),
                ),
            ],
          ),
          const SizedBox(height: 12),

          // Activities timeline
          if (activities.isNotEmpty)
            ...activities.map((activity) => _buildActivityItem(activity))
          else
            Padding(
              padding: const EdgeInsets.only(left: 48),
              child: Text(
                'No activities planned',
                style: TextStyle(
                  fontSize: 13,
                  color: Colors.grey[500],
                  fontStyle: FontStyle.italic,
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildActivityItem(Map<String, dynamic> activity) {
    final type = activity['type'] as ItineraryItemType;
    final color = _getTypeColor(type);

    return Padding(
      padding: const EdgeInsets.only(left: 16, bottom: 8),
      child: Row(
        children: [
          // Timeline line and dot
          SizedBox(
            width: 32,
            child: Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: color.withOpacity(0.2),
                    shape: BoxShape.circle,
                    border: Border.all(color: color, width: 2),
                  ),
                ),
              ],
            ),
          ),

          // Activity details
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: Colors.grey[50],
                borderRadius: BorderRadius.circular(8),
                border: Border.all(color: Colors.grey[200]!),
              ),
              child: Row(
                children: [
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: color.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Icon(
                      _getTypeIcon(type),
                      size: 18,
                      color: color,
                    ),
                  ),
                  const SizedBox(width: 12),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          activity['title'] as String,
                          style: const TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 2),
                        Row(
                          children: [
                            Text(
                              activity['time'] as String,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(width: 8),
                            Icon(
                              Icons.location_on_outlined,
                              size: 12,
                              color: Colors.grey[500],
                            ),
                            const SizedBox(width: 2),
                            Expanded(
                              child: Text(
                                activity['location'] as String,
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey[600],
                                ),
                                overflow: TextOverflow.ellipsis,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Icon(
                    Icons.chevron_right,
                    color: Colors.grey[400],
                    size: 20,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAccommodationCard(BuildContext context, AppLocalizations l10n) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: AppColors.accommodationColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.accommodationColor.withOpacity(0.2)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: AppColors.accommodationColor.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Icon(
                  Icons.hotel,
                  color: AppColors.accommodationColor,
                  size: 24,
                ),
              ),
              const SizedBox(width: 12),
              const Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Hotel Grand Plaza',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 2),
                    Text(
                      '123 Main Street, City Center',
                      style: TextStyle(
                        fontSize: 12,
                        color: Colors.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),
          const Divider(height: 1),
          const SizedBox(height: 16),

          // Check-in/Check-out times
          Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.checkIn,
                      style: TextStyle(
                        fontSize: 11,
                        color: Colors.grey[600],
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 4),
                    const Row(
                      children: [
                        Icon(Icons.login, size: 16, color: AppColors.success),
                        SizedBox(width: 4),
                        Text(
                          '3:00 PM',
                          style: TextStyle(
                            fontSize: 14,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Container(
                width: 1,
                height: 40,
                color: Colors.grey[300],
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        l10n.checkOut,
                        style: TextStyle(
                          fontSize: 11,
                          color: Colors.grey[600],
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      const SizedBox(height: 4),
                      const Row(
                        children: [
                          Icon(Icons.logout, size: 16, color: AppColors.error),
                          SizedBox(width: 4),
                          Text(
                            '11:00 AM',
                            style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // Action buttons
          Row(
            children: [
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.directions, size: 18),
                  label: Text(l10n.directions),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: const BorderSide(color: AppColors.primary),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: OutlinedButton.icon(
                  onPressed: () {},
                  icon: const Icon(Icons.confirmation_number, size: 18),
                  label: Text(l10n.reservation),
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    side: const BorderSide(color: AppColors.primary),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  IconData _getTagIcon(String tag) {
    switch (tag.toLowerCase()) {
      case 'nature':
        return Icons.park_outlined;
      case 'coffee':
        return Icons.coffee_outlined;
      case 'culture':
        return Icons.museum_outlined;
      case 'beach':
        return Icons.beach_access_outlined;
      case 'food':
        return Icons.restaurant_outlined;
      case 'adventure':
        return Icons.hiking;
      case 'shopping':
        return Icons.shopping_bag_outlined;
      case 'nightlife':
        return Icons.nightlife_outlined;
      default:
        return Icons.label_outline;
    }
  }

  IconData _getTypeIcon(ItineraryItemType type) {
    switch (type) {
      case ItineraryItemType.flight:
        return Icons.flight;
      case ItineraryItemType.accommodation:
        return Icons.hotel;
      case ItineraryItemType.rentalCar:
        return Icons.directions_car;
      case ItineraryItemType.restaurant:
        return Icons.restaurant;
      case ItineraryItemType.attraction:
        return Icons.attractions;
      case ItineraryItemType.activity:
        return Icons.local_activity;
      case ItineraryItemType.transportation:
        return Icons.directions_bus;
      case ItineraryItemType.other:
        return Icons.more_horiz;
    }
  }

  Color _getTypeColor(ItineraryItemType type) {
    switch (type) {
      case ItineraryItemType.flight:
        return AppColors.flightColor;
      case ItineraryItemType.accommodation:
        return AppColors.accommodationColor;
      case ItineraryItemType.rentalCar:
        return AppColors.rentalCarColor;
      case ItineraryItemType.restaurant:
        return AppColors.restaurantColor;
      case ItineraryItemType.attraction:
        return AppColors.attractionColor;
      case ItineraryItemType.activity:
        return AppColors.activityColor;
      case ItineraryItemType.transportation:
        return AppColors.transportationColor;
      case ItineraryItemType.other:
        return Colors.grey;
    }
  }
}
