import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../data/models/itinerary_item_model.dart';
import '../../../../data/models/trip_model.dart';
import '../../../trip/providers/trip_provider.dart';
import '../../providers/itinerary_provider.dart';
import '../widgets/itinerary_map_view.dart';
import '../widgets/itinerary_people_view.dart';
import '../widgets/itinerary_settings_view.dart';

class ItineraryScreen extends ConsumerStatefulWidget {
  final String tripId;

  const ItineraryScreen({
    super.key,
    required this.tripId,
  });

  @override
  ConsumerState<ItineraryScreen> createState() => _ItineraryScreenState();
}

class _ItineraryScreenState extends ConsumerState<ItineraryScreen> {
  final ScrollController _dayScrollController = ScrollController();

  @override
  void dispose() {
    _dayScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tripAsync = ref.watch(tripProvider(widget.tripId));
    final selectedTab = ref.watch(itineraryTabProvider(widget.tripId));

    return tripAsync.when(
      data: (trip) {
        if (trip == null) {
          final l10n = AppLocalizations.of(context)!;
          return Scaffold(
            body: Center(child: Text(l10n.tripNotFound)),
          );
        }
        return Scaffold(
          backgroundColor: AppColors.backgroundLight,
          body: IndexedStack(
            index: selectedTab.index,
            children: [
              _buildScheduleTab(trip),
              _buildMapTab(),
              _buildPeopleTab(),
              _buildSettingsTab(),
            ],
          ),
          bottomNavigationBar: _buildBottomNav(trip),
          floatingActionButton: selectedTab == ItineraryTab.schedule
              ? FloatingActionButton.extended(
                  onPressed: () => _navigateToAddItem(context, trip),
                  backgroundColor: AppColors.coral,
                  icon: const Icon(Icons.add, color: Colors.white),
                  label: const Text(
                    'Add Activity',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                )
              : null,
          floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        );
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => Scaffold(
        body: Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildScheduleTab(TripModel trip) {
    final selectedDay = ref.watch(selectedDayProvider(widget.tripId));
    final itemsAsync = ref.watch(itineraryItemsByDayProvider(
      (tripId: widget.tripId, dayNumber: selectedDay),
    ));

    return CustomScrollView(
      slivers: [
        // App Bar
        SliverAppBar(
          expandedHeight: 0,
          floating: true,
          pinned: true,
          backgroundColor: AppColors.backgroundLight,
          elevation: 0,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: AppColors.textPrimaryLight),
            onPressed: () => context.pop(),
          ),
          title: Text(
            '${trip.name} - Organizer View',
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimaryLight,
            ),
          ),
        ),

        // Cover Image Section
        SliverToBoxAdapter(
          child: _buildCoverImageSection(trip),
        ),

        // Day Tabs
        SliverToBoxAdapter(
          child: _buildDayTabs(trip, selectedDay),
        ),

        // Timeline View
        itemsAsync.when(
          data: (items) {
            if (items.isEmpty) {
              return SliverToBoxAdapter(
                child: _buildEmptyDayState(trip),
              );
            }
            return SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              sliver: SliverList(
                delegate: SliverChildBuilderDelegate(
                  (context, index) {
                    final item = items[index];
                    final isLast = index == items.length - 1;
                    return _buildTimelineItem(item, isLast);
                  },
                  childCount: items.length,
                ),
              ),
            );
          },
          loading: () => const SliverToBoxAdapter(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(40),
                child: CircularProgressIndicator(),
              ),
            ),
          ),
          error: (error, _) => SliverToBoxAdapter(
            child: Center(child: Text('Error: $error')),
          ),
        ),

        // Bottom padding
        const SliverToBoxAdapter(
          child: SizedBox(height: 100),
        ),
      ],
    );
  }

  Widget _buildCoverImageSection(TripModel trip) {
    final dateFormat = DateFormat('MMM d');
    final startDate = dateFormat.format(trip.startDate);
    final endDate = dateFormat.format(trip.endDate);

    return Container(
      height: 180,
      margin: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        image: trip.coverImageUrl != null
            ? DecorationImage(
                image: NetworkImage(trip.coverImageUrl!),
                fit: BoxFit.cover,
              )
            : null,
        gradient: trip.coverImageUrl == null
            ? LinearGradient(
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                colors: [
                  AppColors.primary,
                  AppColors.primaryDark,
                ],
              )
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.15),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Stack(
        children: [
          // Gradient overlay
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(AppTheme.radiusLg),
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: AppColors.cardGradient,
              ),
            ),
          ),
          // Content
          Positioned(
            left: 16,
            right: 16,
            bottom: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  trip.destination,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    shadows: [
                      Shadow(
                        blurRadius: 4,
                        color: Colors.black38,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.2),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '$startDate - $endDate',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        '${trip.totalDays} Days',
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
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
    );
  }

  Widget _buildDayTabs(TripModel trip, int selectedDay) {
    return Container(
      height: 72,
      margin: const EdgeInsets.only(bottom: 8),
      child: ListView.builder(
        controller: _dayScrollController,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 16),
        itemCount: trip.totalDays,
        itemBuilder: (context, index) {
          final dayNumber = index + 1;
          final isSelected = dayNumber == selectedDay;
          final dayDate = trip.startDate.add(Duration(days: index));
          final dateFormat = DateFormat('M/d');

          return GestureDetector(
            onTap: () {
              ref.read(selectedDayProvider(widget.tripId).notifier).state = dayNumber;
            },
            child: Container(
              width: 70,
              margin: const EdgeInsets.only(right: 12),
              decoration: BoxDecoration(
                color: isSelected ? AppColors.primary : Colors.white,
                borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                border: Border.all(
                  color: isSelected ? AppColors.primary : AppColors.divider,
                  width: isSelected ? 2 : 1,
                ),
                boxShadow: isSelected
                    ? [
                        BoxShadow(
                          color: AppColors.primary.withOpacity(0.3),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ]
                    : null,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Day $dayNumber',
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold,
                      color: isSelected ? Colors.white : AppColors.textPrimaryLight,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    dateFormat.format(dayDate),
                    style: TextStyle(
                      fontSize: 11,
                      color: isSelected
                          ? Colors.white.withOpacity(0.8)
                          : AppColors.textSecondaryLight,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildTimelineItem(ItineraryItemModel item, bool isLast) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Time column
          SizedBox(
            width: 60,
            child: Text(
              DateFormat('hh:mm a').format(item.startTime),
              style: const TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w600,
                color: AppColors.textSecondaryLight,
              ),
            ),
          ),

          // Timeline line and dot
          SizedBox(
            width: 32,
            child: Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  decoration: BoxDecoration(
                    color: _getTypeColor(item.type),
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: Colors.white,
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: _getTypeColor(item.type).withOpacity(0.3),
                        blurRadius: 4,
                        offset: const Offset(0, 2),
                      ),
                    ],
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      color: AppColors.divider,
                    ),
                  ),
              ],
            ),
          ),

          // Activity card
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: _buildActivityCard(item),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActivityCard(ItineraryItemModel item) {
    final l10n = AppLocalizations.of(context)!;

    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Card header
          Padding(
            padding: const EdgeInsets.all(12),
            child: Row(
              children: [
                Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    color: _getTypeColor(item.type).withOpacity(0.1),
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(
                    _getTypeIcon(item.type),
                    color: _getTypeColor(item.type),
                    size: 22,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: const TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w600,
                          color: AppColors.textPrimaryLight,
                        ),
                      ),
                      if (item.description != null || item.location != null)
                        Text(
                          item.description ?? item.location ?? '',
                          style: const TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondaryLight,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
                if (item.duration != null)
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    margin: const EdgeInsets.only(right: 8),
                    decoration: BoxDecoration(
                      color: AppColors.backgroundLight,
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item.formattedDuration,
                      style: const TextStyle(
                        fontSize: 11,
                        fontWeight: FontWeight.w500,
                        color: AppColors.textSecondaryLight,
                      ),
                    ),
                  ),
                // Edit/Delete menu
                PopupMenuButton<String>(
                  icon: const Icon(
                    Icons.more_vert,
                    color: AppColors.textSecondaryLight,
                    size: 20,
                  ),
                  padding: EdgeInsets.zero,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  onSelected: (value) {
                    if (value == 'edit') {
                      _editItem(item);
                    } else if (value == 'delete') {
                      _showDeleteConfirmation(item, l10n);
                    }
                  },
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 'edit',
                      child: Row(
                        children: [
                          const Icon(Icons.edit_outlined, size: 20, color: AppColors.primary),
                          const SizedBox(width: 12),
                          Text(l10n.edit),
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 'delete',
                      child: Row(
                        children: [
                          const Icon(Icons.delete_outline, size: 20, color: AppColors.error),
                          const SizedBox(width: 12),
                          Text(l10n.delete, style: const TextStyle(color: AppColors.error)),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),

          // Type-specific content
          _buildTypeSpecificContent(item),

          // Notes/Tips if available
          if (item.notes != null && item.notes!.isNotEmpty)
            Container(
              margin: const EdgeInsets.all(12),
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.infoLight,
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: AppColors.info.withOpacity(0.2),
                ),
              ),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    Icons.lightbulb_outline,
                    size: 16,
                    color: AppColors.info,
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    child: Text(
                      item.notes!,
                      style: TextStyle(
                        fontSize: 12,
                        color: AppColors.info,
                      ),
                    ),
                  ),
                ],
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildTypeSpecificContent(ItineraryItemModel item) {
    switch (item.type) {
      case ItineraryItemType.flight:
        return _buildFlightContent(item);
      case ItineraryItemType.restaurant:
        return _buildRestaurantContent(item);
      default:
        return const SizedBox.shrink();
    }
  }

  Widget _buildFlightContent(ItineraryItemModel item) {
    if (item.departureAirport == null && item.arrivalAirport == null) {
      return const SizedBox.shrink();
    }

    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: AppColors.flightColor.withOpacity(0.05),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Text(
                item.departureAirport ?? '--',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimaryLight,
                ),
              ),
              if (item.terminal != null)
                Text(
                  'Terminal ${item.terminal}',
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.textSecondaryLight,
                  ),
                ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Icon(
                  Icons.flight_takeoff,
                  color: AppColors.flightColor,
                  size: 20,
                ),
                if (item.duration != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 4),
                    child: Text(
                      item.formattedDuration,
                      style: const TextStyle(
                        fontSize: 10,
                        color: AppColors.textSecondaryLight,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Column(
            children: [
              Text(
                item.arrivalAirport ?? '--',
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: AppColors.textPrimaryLight,
                ),
              ),
              if (item.gate != null)
                Text(
                  'Gate ${item.gate}',
                  style: const TextStyle(
                    fontSize: 10,
                    color: AppColors.textSecondaryLight,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildRestaurantContent(ItineraryItemModel item) {
    return Container(
      margin: const EdgeInsets.fromLTRB(12, 0, 12, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Image placeholder
          if (item.imageUrl != null)
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.network(
                item.imageUrl!,
                height: 120,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
          const SizedBox(height: 8),
          Row(
            children: [
              if (item.priceRange != null) ...[
                Text(
                  item.priceRange!,
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.restaurantColor,
                  ),
                ),
                const SizedBox(width: 8),
              ],
              if (item.cuisine != null)
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundLight,
                    borderRadius: BorderRadius.circular(4),
                  ),
                  child: Text(
                    item.cuisine!,
                    style: const TextStyle(
                      fontSize: 11,
                      color: AppColors.textSecondaryLight,
                    ),
                  ),
                ),
              const Spacer(),
              TextButton(
                onPressed: () {
                  // View menu action
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
                  minimumSize: Size.zero,
                  tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                ),
                child: const Text(
                  'View Menu',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w600,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildEmptyDayState(TripModel trip) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.event_note_outlined,
            size: 64,
            color: Colors.grey[300],
          ),
          const SizedBox(height: 16),
          const Text(
            'No activities planned',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: AppColors.textPrimaryLight,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add activities to your itinerary',
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey[600],
            ),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            onPressed: () => _navigateToAddItem(context, trip),
            icon: const Icon(Icons.add),
            label: Text(AppLocalizations.of(context)!.addActivity),
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.coral,
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

  Widget _buildMapTab() {
    return ItineraryMapView(tripId: widget.tripId);
  }

  Widget _buildPeopleTab() {
    return ItineraryPeopleView(tripId: widget.tripId);
  }

  Widget _buildSettingsTab() {
    return ItinerarySettingsView(tripId: widget.tripId);
  }

  Widget _buildBottomNav(TripModel trip) {
    final selectedTab = ref.watch(itineraryTabProvider(widget.tripId));

    return Container(
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
              _buildNavItem(
                ItineraryTab.schedule,
                Icons.calendar_today_outlined,
                Icons.calendar_today,
                'Schedule',
                selectedTab,
              ),
              _buildNavItem(
                ItineraryTab.map,
                Icons.map_outlined,
                Icons.map,
                'Map',
                selectedTab,
              ),
              _buildNavItem(
                ItineraryTab.people,
                Icons.people_outline,
                Icons.people,
                'People',
                selectedTab,
              ),
              _buildNavItem(
                ItineraryTab.settings,
                Icons.settings_outlined,
                Icons.settings,
                'Settings',
                selectedTab,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(
    ItineraryTab tab,
    IconData icon,
    IconData activeIcon,
    String label,
    ItineraryTab selectedTab,
  ) {
    final isSelected = tab == selectedTab;
    return GestureDetector(
      onTap: () => ref.read(itineraryTabProvider(widget.tripId).notifier).state = tab,
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

  void _navigateToAddItem(BuildContext context, TripModel trip) {
    final selectedDay = ref.read(selectedDayProvider(widget.tripId));
    context.push('/trip/${widget.tripId}/itinerary/add?day=$selectedDay');
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
      default:
        return AppColors.textSecondaryLight;
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
        return Icons.hiking;
      case ItineraryItemType.transportation:
        return Icons.directions_bus;
      default:
        return Icons.more_horiz;
    }
  }

  void _editItem(ItineraryItemModel item) {
    context.push('/trip/${widget.tripId}/itinerary/edit/${item.id}');
  }

  void _showDeleteConfirmation(ItineraryItemModel item, AppLocalizations l10n) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
        ),
        title: Text(l10n.deleteItinerary),
        content: Text(l10n.deleteItineraryConfirm),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text(l10n.cancel),
          ),
          ElevatedButton(
            onPressed: () async {
              Navigator.pop(context);
              await _deleteItem(item, l10n);
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.error,
              foregroundColor: Colors.white,
            ),
            child: Text(l10n.delete),
          ),
        ],
      ),
    );
  }

  Future<void> _deleteItem(ItineraryItemModel item, AppLocalizations l10n) async {
    try {
      await ref.read(itineraryNotifierProvider.notifier).deleteItem(
        widget.tripId,
        item.id,
      );
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.itemDeletedSuccess),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${l10n.error}: $e'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }
}
