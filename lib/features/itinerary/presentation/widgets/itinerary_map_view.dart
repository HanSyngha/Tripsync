import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../data/models/itinerary_item_model.dart';
import '../../providers/itinerary_provider.dart';
import '../../../../l10n/generated/app_localizations.dart';

class ItineraryMapView extends ConsumerStatefulWidget {
  final String tripId;
  final int? selectedDay;

  const ItineraryMapView({
    super.key,
    required this.tripId,
    this.selectedDay,
  });

  @override
  ConsumerState<ItineraryMapView> createState() => _ItineraryMapViewState();
}

class _ItineraryMapViewState extends ConsumerState<ItineraryMapView> {
  GoogleMapController? _mapController;
  final Set<Marker> _markers = {};
  final Set<Polyline> _polylines = {};
  ItineraryItemModel? _selectedItem;
  bool _isLoading = true;

  // Default location (Seoul)
  static const LatLng _defaultLocation = LatLng(37.5665, 126.9780);

  @override
  void dispose() {
    _mapController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final itemsAsync = ref.watch(itineraryItemsProvider(widget.tripId));
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return itemsAsync.when(
      data: (items) {
        final filteredItems = widget.selectedDay != null
            ? items.where((item) => item.dayNumber == widget.selectedDay).toList()
            : items;

        // Filter items with valid coordinates
        final locatedItems = filteredItems
            .where((item) => item.coordinates != null)
            .toList();

        // Sort by day and time
        locatedItems.sort((a, b) {
          final dayCompare = a.dayNumber.compareTo(b.dayNumber);
          if (dayCompare != 0) return dayCompare;
          return a.startTime.compareTo(b.startTime);
        });

        if (locatedItems.isEmpty) {
          return _buildEmptyState(context, l10n);
        }

        WidgetsBinding.instance.addPostFrameCallback((_) {
          _updateMarkers(locatedItems);
          _updatePolylines(locatedItems);
        });

        return Stack(
          children: [
            GoogleMap(
              initialCameraPosition: CameraPosition(
                target: locatedItems.isNotEmpty
                    ? LatLng(
                        locatedItems.first.coordinates!.latitude,
                        locatedItems.first.coordinates!.longitude,
                      )
                    : _defaultLocation,
                zoom: 13,
              ),
              markers: _markers,
              polylines: _polylines,
              onMapCreated: (controller) {
                _mapController = controller;
                _fitBounds(locatedItems);
                setState(() => _isLoading = false);
              },
              mapType: MapType.normal,
              myLocationEnabled: true,
              myLocationButtonEnabled: false,
              zoomControlsEnabled: false,
              compassEnabled: true,
              mapToolbarEnabled: false,
            ),
            // Day filter chips
            Positioned(
              top: 16,
              left: 16,
              right: 16,
              child: _buildDayFilter(items, locatedItems),
            ),
            // Controls
            Positioned(
              right: 16,
              bottom: _selectedItem != null ? 200 : 100,
              child: Column(
                children: [
                  _buildMapButton(
                    icon: Icons.my_location,
                    onPressed: _goToCurrentLocation,
                  ),
                  const SizedBox(height: 8),
                  _buildMapButton(
                    icon: Icons.zoom_out_map,
                    onPressed: () => _fitBounds(locatedItems),
                  ),
                ],
              ),
            ),
            // Selected item card
            if (_selectedItem != null)
              Positioned(
                left: 16,
                right: 16,
                bottom: 24,
                child: _buildSelectedItemCard(_selectedItem!),
              ),
            // Loading overlay
            if (_isLoading)
              Container(
                color: isDark ? Colors.black54 : Colors.white54,
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, stack) => Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 48,
              color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
            ),
            const SizedBox(height: 16),
            Text(
              l10n.error,
              style: TextStyle(
                color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildEmptyState(BuildContext context, AppLocalizations l10n) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.map_outlined,
            size: 64,
            color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
          ),
          const SizedBox(height: 16),
          Text(
            l10n.noResults,
            style: TextStyle(
              fontSize: 16,
              color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            'Add locations to your itinerary to see them on the map',
            style: TextStyle(
              fontSize: 14,
              color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }

  Widget _buildDayFilter(
    List<ItineraryItemModel> allItems,
    List<ItineraryItemModel> locatedItems,
  ) {
    final days = allItems.map((e) => e.dayNumber).toSet().toList()..sort();
    if (days.length <= 1) return const SizedBox.shrink();

    final l10n = AppLocalizations.of(context)!;
    final selectedDay = ref.watch(selectedMapDayProvider(widget.tripId));

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          _buildFilterChip(
            label: l10n.all,
            isSelected: selectedDay == null,
            onTap: () {
              ref.read(selectedMapDayProvider(widget.tripId).notifier).state = null;
              _fitBounds(locatedItems);
            },
          ),
          ...days.map((day) => _buildFilterChip(
                label: l10n.day(day),
                isSelected: selectedDay == day,
                onTap: () {
                  ref.read(selectedMapDayProvider(widget.tripId).notifier).state = day;
                  final dayItems = locatedItems.where((i) => i.dayNumber == day).toList();
                  if (dayItems.isNotEmpty) {
                    _fitBounds(dayItems);
                  }
                },
              )),
        ],
      ),
    );
  }

  Widget _buildFilterChip({
    required String label,
    required bool isSelected,
    required VoidCallback onTap,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Material(
        elevation: 2,
        borderRadius: BorderRadius.circular(20),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(20),
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
              color: isSelected
                  ? AppColors.primary
                  : isDark
                      ? AppColors.surfaceDark
                      : Colors.white,
              borderRadius: BorderRadius.circular(20),
            ),
            child: Text(
              label,
              style: TextStyle(
                color: isSelected
                    ? Colors.white
                    : isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildMapButton({
    required IconData icon,
    required VoidCallback onPressed,
  }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    return Material(
      elevation: 2,
      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      child: InkWell(
        onTap: onPressed,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        child: Container(
          width: 44,
          height: 44,
          decoration: BoxDecoration(
            color: isDark ? AppColors.surfaceDark : Colors.white,
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          ),
          child: Icon(
            icon,
            color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
      ),
    );
  }

  Widget _buildSelectedItemCard(ItineraryItemModel item) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final l10n = AppLocalizations.of(context)!;

    return Material(
      elevation: 4,
      borderRadius: BorderRadius.circular(AppTheme.radiusLg),
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isDark ? AppColors.surfaceDark : Colors.white,
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: BoxDecoration(
                    color: _getTypeColor(item.type).withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                  ),
                  child: Icon(
                    _getTypeIcon(item.type),
                    color: _getTypeColor(item.type),
                    size: 20,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.title,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: isDark
                              ? AppColors.textPrimaryDark
                              : AppColors.textPrimaryLight,
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                      if (item.location != null || item.address != null)
                        Text(
                          item.location ?? item.address ?? '',
                          style: TextStyle(
                            fontSize: 13,
                            color: isDark
                                ? AppColors.textSecondaryDark
                                : AppColors.textSecondaryLight,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                    ],
                  ),
                ),
                IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () => setState(() => _selectedItem = null),
                  color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Icon(
                  Icons.schedule,
                  size: 16,
                  color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                ),
                const SizedBox(width: 4),
                Text(
                  '${l10n.day(item.dayNumber)} \u00B7 ${_formatTime(item.startTime)}',
                  style: TextStyle(
                    fontSize: 13,
                    color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                  ),
                ),
                const Spacer(),
                TextButton.icon(
                  onPressed: () => _openDirections(item),
                  icon: const Icon(Icons.directions, size: 18),
                  label: Text(l10n.directions),
                  style: TextButton.styleFrom(
                    foregroundColor: AppColors.primary,
                    padding: const EdgeInsets.symmetric(horizontal: 12),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _updateMarkers(List<ItineraryItemModel> items) {
    _markers.clear();
    for (int i = 0; i < items.length; i++) {
      final item = items[i];
      if (item.coordinates == null) continue;

      final marker = Marker(
        markerId: MarkerId(item.id),
        position: LatLng(
          item.coordinates!.latitude,
          item.coordinates!.longitude,
        ),
        icon: BitmapDescriptor.defaultMarkerWithHue(
          _getMarkerHue(item.type),
        ),
        infoWindow: InfoWindow(
          title: item.title,
          snippet: item.location ?? item.address,
        ),
        onTap: () {
          setState(() => _selectedItem = item);
          _mapController?.animateCamera(
            CameraUpdate.newLatLng(
              LatLng(
                item.coordinates!.latitude,
                item.coordinates!.longitude,
              ),
            ),
          );
        },
      );
      _markers.add(marker);
    }
    setState(() {});
  }

  void _updatePolylines(List<ItineraryItemModel> items) {
    _polylines.clear();

    if (items.length < 2) return;

    // Group items by day
    final Map<int, List<ItineraryItemModel>> dayGroups = {};
    for (final item in items) {
      dayGroups.putIfAbsent(item.dayNumber, () => []).add(item);
    }

    // Create polylines for each day
    final colors = [
      AppColors.primary,
      AppColors.coral,
      AppColors.info,
      AppColors.success,
      AppColors.warning,
    ];

    int colorIndex = 0;
    dayGroups.forEach((day, dayItems) {
      if (dayItems.length < 2) return;

      final points = dayItems
          .where((item) => item.coordinates != null)
          .map((item) => LatLng(
                item.coordinates!.latitude,
                item.coordinates!.longitude,
              ))
          .toList();

      if (points.length >= 2) {
        final color = colors[colorIndex % colors.length];

        // Add solid line for route
        _polylines.add(
          Polyline(
            polylineId: PolylineId('day_$day'),
            points: points,
            color: color,
            width: 4,
          ),
        );

        // Add arrow markers along the route to show direction
        _addArrowMarkers(points, day, color);

        colorIndex++;
      }
    });

    setState(() {});
  }

  // Arrow markers are automatically shown by the numbered order of itinerary items
  // The solid polyline shows the route direction from first to last item
  void _addArrowMarkers(List<LatLng> points, int day, Color color) {
    // The direction is shown by the polyline itself
    // Items are already marked with their type-specific markers in _updateMarkers
    // The solid line connects them in order, showing the travel path
  }

  void _fitBounds(List<ItineraryItemModel> items) {
    if (_mapController == null || items.isEmpty) return;

    final bounds = _calculateBounds(items);
    if (bounds != null) {
      _mapController?.animateCamera(
        CameraUpdate.newLatLngBounds(bounds, 60),
      );
    }
  }

  LatLngBounds? _calculateBounds(List<ItineraryItemModel> items) {
    final locatedItems = items.where((item) => item.coordinates != null).toList();
    if (locatedItems.isEmpty) return null;

    double minLat = locatedItems.first.coordinates!.latitude;
    double maxLat = locatedItems.first.coordinates!.latitude;
    double minLng = locatedItems.first.coordinates!.longitude;
    double maxLng = locatedItems.first.coordinates!.longitude;

    for (final item in locatedItems) {
      minLat = minLat < item.coordinates!.latitude
          ? minLat
          : item.coordinates!.latitude;
      maxLat = maxLat > item.coordinates!.latitude
          ? maxLat
          : item.coordinates!.latitude;
      minLng = minLng < item.coordinates!.longitude
          ? minLng
          : item.coordinates!.longitude;
      maxLng = maxLng > item.coordinates!.longitude
          ? maxLng
          : item.coordinates!.longitude;
    }

    // Add some padding
    const padding = 0.01;
    return LatLngBounds(
      southwest: LatLng(minLat - padding, minLng - padding),
      northeast: LatLng(maxLat + padding, maxLng + padding),
    );
  }

  void _goToCurrentLocation() async {
    // TODO: Implement current location
    if (_mapController == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.featureComingSoon)),
    );
  }

  void _openDirections(ItineraryItemModel item) {
    if (item.coordinates == null) return;

    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(AppLocalizations.of(context)!.featureComingSoon)),
    );

    // TODO: Open Google Maps directions
    // final url = 'https://www.google.com/maps/dir/?api=1&destination=${item.coordinates!.latitude},${item.coordinates!.longitude}';
    // launchUrl(Uri.parse(url));
  }

  double _getMarkerHue(ItineraryItemType type) {
    switch (type) {
      case ItineraryItemType.flight:
        return BitmapDescriptor.hueBlue;
      case ItineraryItemType.accommodation:
        return BitmapDescriptor.hueViolet;
      case ItineraryItemType.restaurant:
        return BitmapDescriptor.hueOrange;
      case ItineraryItemType.attraction:
        return BitmapDescriptor.hueGreen;
      case ItineraryItemType.activity:
        return BitmapDescriptor.hueCyan;
      case ItineraryItemType.transportation:
        return BitmapDescriptor.hueYellow;
      case ItineraryItemType.rentalCar:
        return BitmapDescriptor.hueRose;
      case ItineraryItemType.other:
        return BitmapDescriptor.hueRed;
    }
  }

  Color _getTypeColor(ItineraryItemType type) {
    switch (type) {
      case ItineraryItemType.flight:
        return AppColors.info;
      case ItineraryItemType.accommodation:
        return Colors.purple;
      case ItineraryItemType.restaurant:
        return AppColors.coral;
      case ItineraryItemType.attraction:
        return AppColors.success;
      case ItineraryItemType.activity:
        return Colors.cyan;
      case ItineraryItemType.transportation:
        return AppColors.warning;
      case ItineraryItemType.rentalCar:
        return Colors.pink;
      case ItineraryItemType.other:
        return AppColors.error;
    }
  }

  IconData _getTypeIcon(ItineraryItemType type) {
    switch (type) {
      case ItineraryItemType.flight:
        return Icons.flight;
      case ItineraryItemType.accommodation:
        return Icons.hotel;
      case ItineraryItemType.restaurant:
        return Icons.restaurant;
      case ItineraryItemType.attraction:
        return Icons.place;
      case ItineraryItemType.activity:
        return Icons.local_activity;
      case ItineraryItemType.transportation:
        return Icons.directions_bus;
      case ItineraryItemType.rentalCar:
        return Icons.directions_car;
      case ItineraryItemType.other:
        return Icons.event;
    }
  }

  String _formatTime(DateTime time) {
    final hour = time.hour;
    final minute = time.minute.toString().padLeft(2, '0');
    final period = hour >= 12 ? 'PM' : 'AM';
    final displayHour = hour > 12 ? hour - 12 : (hour == 0 ? 12 : hour);
    return '$displayHour:$minute $period';
  }
}

// Provider for selected day in map view
final selectedMapDayProvider = StateProvider.family<int?, String>((ref, tripId) => null);
