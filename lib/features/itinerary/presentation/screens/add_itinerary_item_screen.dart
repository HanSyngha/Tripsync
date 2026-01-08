import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../data/models/trip_model.dart';
import '../../../trip/providers/trip_provider.dart';
import '../../providers/itinerary_provider.dart';

class AddItineraryItemScreen extends ConsumerStatefulWidget {
  final String tripId;
  final int? initialDay;

  const AddItineraryItemScreen({
    super.key,
    required this.tripId,
    this.initialDay,
  });

  @override
  ConsumerState<AddItineraryItemScreen> createState() => _AddItineraryItemScreenState();
}

class _AddItineraryItemScreenState extends ConsumerState<AddItineraryItemScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final List<_CategoryTab> _categories = [
    _CategoryTab(type: ItineraryItemType.flight, emoji: '\u2708\ufe0f', label: '\ud56d\uacf5\ud3b8', labelEn: 'Flight'),
    _CategoryTab(type: ItineraryItemType.accommodation, emoji: '\ud83c\udfe8', label: '\uc219\uc18c', labelEn: 'Accommodation'),
    _CategoryTab(type: ItineraryItemType.rentalCar, emoji: '\ud83d\ude97', label: '\ub80c\ud130\uce74', labelEn: 'Rental Car'),
    _CategoryTab(type: ItineraryItemType.restaurant, emoji: '\ud83c\udf7d\ufe0f', label: '\ub808\uc2a4\ud1a0\ub791', labelEn: 'Restaurant'),
    _CategoryTab(type: ItineraryItemType.attraction, emoji: '\ud83c\udff0', label: '\uad00\uad11', labelEn: 'Attraction'),
    _CategoryTab(type: ItineraryItemType.activity, emoji: '\ud83e\udd7e', label: '\uc561\ud2f0\ube44\ud2f0', labelEn: 'Activity'),
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: _categories.length, vsync: this);
    _tabController.addListener(() {
      if (!_tabController.indexIsChanging) {
        ref.read(addItineraryItemProvider.notifier).setType(
              _categories[_tabController.index].type,
            );
      }
    });

    // Set initial day if provided
    if (widget.initialDay != null) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        ref.read(addItineraryItemProvider.notifier).setDayNumber(widget.initialDay!);
      });
    }
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final tripAsync = ref.watch(tripProvider(widget.tripId));
    final formState = ref.watch(addItineraryItemProvider);

    return tripAsync.when(
      data: (trip) {
        if (trip == null) {
          return const Scaffold(
            body: Center(child: Text('Trip not found')),
          );
        }
        return Scaffold(
          backgroundColor: AppColors.backgroundLight,
          appBar: AppBar(
            backgroundColor: AppColors.backgroundLight,
            elevation: 0,
            leading: IconButton(
              icon: const Icon(Icons.close, color: AppColors.textPrimaryLight),
              onPressed: () => context.pop(),
            ),
            title: const Text(
              '\uc138\ubd80 \uc815\ubcf4 \uc785\ub825', // Detailed Info Input
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimaryLight,
              ),
            ),
            actions: [
              TextButton(
                onPressed: formState.isLoading ? null : () => _saveItem(trip),
                child: Text(
                  '\uc800\uc7a5', // Save
                  style: TextStyle(
                    color: formState.isLoading ? Colors.grey : AppColors.primary,
                    fontWeight: FontWeight.w600,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
          body: Column(
            children: [
              // Category tabs
              _buildCategoryTabs(),

              // Form content
              Expanded(
                child: formState.isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: _buildFormContent(trip, formState),
                      ),
              ),
            ],
          ),
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

  Widget _buildCategoryTabs() {
    return Container(
      height: 80,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TabBar(
        controller: _tabController,
        isScrollable: true,
        indicatorColor: AppColors.primary,
        indicatorWeight: 3,
        labelColor: AppColors.primary,
        unselectedLabelColor: AppColors.textSecondaryLight,
        labelPadding: const EdgeInsets.symmetric(horizontal: 16),
        tabs: _categories.map((category) {
          return Tab(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  category.emoji,
                  style: const TextStyle(fontSize: 24),
                ),
                const SizedBox(height: 4),
                Text(
                  category.label,
                  style: const TextStyle(
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

  Widget _buildFormContent(TripModel trip, AddItineraryItemState formState) {
    switch (formState.selectedType) {
      case ItineraryItemType.flight:
        return _buildFlightForm(trip, formState);
      case ItineraryItemType.accommodation:
        return _buildAccommodationForm(trip, formState);
      case ItineraryItemType.rentalCar:
        return _buildRentalCarForm(trip, formState);
      case ItineraryItemType.restaurant:
        return _buildRestaurantForm(trip, formState);
      case ItineraryItemType.attraction:
      case ItineraryItemType.activity:
        return _buildActivityForm(trip, formState);
      default:
        return _buildActivityForm(trip, formState);
    }
  }

  Widget _buildFlightForm(TripModel trip, AddItineraryItemState formState) {
    final notifier = ref.read(addItineraryItemProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Visual flight card
        _buildFlightVisualCard(formState),

        const SizedBox(height: 24),

        // Day selector
        _buildDaySelector(trip, formState),

        const SizedBox(height: 24),

        // Basic info section
        _buildSectionTitle('\uae30\ubcf8 \uc815\ubcf4', 'Basic Info'),
        const SizedBox(height: 12),
        _buildDropdownField(
          label: '\ud56d\uacf5\uc0ac (Airline)',
          hint: '\ud56d\uacf5\uc0ac \uc120\ud0dd',
          value: formState.airline,
          items: ['Korean Air', 'Asiana Airlines', 'Jeju Air', 'Jin Air', 'T\'way Air'],
          onChanged: (value) => notifier.updateAirline(value ?? ''),
        ),
        const SizedBox(height: 12),
        _buildTextField(
          label: '\ud56d\uacf5\ud3b8\uba85 (Flight Number)',
          hint: 'KE123',
          value: formState.flightNumber,
          onChanged: notifier.updateFlightNumber,
        ),

        const SizedBox(height: 24),

        // Schedule section
        _buildSectionTitle('\uc77c\uc815', 'Schedule'),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildDateTimePicker(
                label: '\ucd9c\ubc1c (Departure)',
                value: formState.departureTime,
                onChanged: notifier.updateDepartureTime,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildDateTimePicker(
                label: '\ub3c4\ucc29 (Arrival)',
                value: formState.arrivalTime,
                onChanged: notifier.updateArrivalTime,
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Notes
        _buildSectionTitle('\uba54\ubaa8', 'Notes'),
        const SizedBox(height: 12),
        _buildTextArea(
          hint: '\ucd94\uac00 \uba54\ubaa8\ub97c \uc785\ub825\ud558\uc138\uc694',
          value: formState.notes,
          onChanged: notifier.updateNotes,
        ),

        const SizedBox(height: 24),

        // Attachments
        _buildAttachmentsSection(formState),

        const SizedBox(height: 24),

        // Notification toggle
        _buildNotificationToggle(formState),

        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildFlightVisualCard(AddItineraryItemState formState) {
    final notifier = ref.read(addItineraryItemProvider.notifier);

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [
            AppColors.flightColor,
            AppColors.flightColor.withOpacity(0.8),
          ],
        ),
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        boxShadow: [
          BoxShadow(
            color: AppColors.flightColor.withOpacity(0.3),
            blurRadius: 12,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              children: [
                const Text(
                  'FROM',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                _buildAirportCodeInput(
                  value: formState.departureAirport ?? '',
                  hint: 'GMP',
                  onChanged: notifier.updateDepartureAirport,
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Column(
              children: [
                Transform.rotate(
                  angle: 1.57, // 90 degrees
                  child: const Icon(
                    Icons.flight,
                    color: Colors.white,
                    size: 32,
                  ),
                ),
                if (formState.departureTime != null && formState.arrivalTime != null)
                  Padding(
                    padding: const EdgeInsets.only(top: 8),
                    child: Text(
                      _calculateFlightDuration(
                        formState.departureTime!,
                        formState.arrivalTime!,
                      ),
                      style: const TextStyle(
                        color: Colors.white70,
                        fontSize: 11,
                      ),
                    ),
                  ),
              ],
            ),
          ),
          Expanded(
            child: Column(
              children: [
                const Text(
                  'TO',
                  style: TextStyle(
                    color: Colors.white70,
                    fontSize: 11,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                const SizedBox(height: 4),
                _buildAirportCodeInput(
                  value: formState.arrivalAirport ?? '',
                  hint: 'CJU',
                  onChanged: notifier.updateArrivalAirport,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAirportCodeInput({
    required String value,
    required String hint,
    required Function(String) onChanged,
  }) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: TextField(
        controller: TextEditingController(text: value),
        onChanged: onChanged,
        textAlign: TextAlign.center,
        textCapitalization: TextCapitalization.characters,
        maxLength: 3,
        style: const TextStyle(
          color: Colors.white,
          fontSize: 28,
          fontWeight: FontWeight.bold,
          letterSpacing: 2,
        ),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(
            color: Colors.white.withOpacity(0.5),
            fontSize: 28,
            fontWeight: FontWeight.bold,
          ),
          border: InputBorder.none,
          counterText: '',
          isDense: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 8),
        ),
      ),
    );
  }

  Widget _buildAccommodationForm(TripModel trip, AddItineraryItemState formState) {
    final notifier = ref.read(addItineraryItemProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Day selector
        _buildDaySelector(trip, formState),

        const SizedBox(height: 24),

        // Basic info section
        _buildSectionTitle('\uae30\ubcf8 \uc815\ubcf4', 'Basic Info'),
        const SizedBox(height: 12),
        _buildTextField(
          label: '\uc219\uc18c\uba85 (Hotel Name)',
          hint: '\uc219\uc18c\uba85\uc744 \uc785\ub825\ud558\uc138\uc694',
          value: formState.hotelName,
          onChanged: notifier.updateHotelName,
        ),
        const SizedBox(height: 12),
        _buildTextField(
          label: '\uac1d\uc2e4 \uc720\ud615 (Room Type)',
          hint: '\uc608: \ub514\ub7ed\uc2a4 \ud2b8\uc708',
          value: formState.roomType,
          onChanged: notifier.updateRoomType,
        ),
        const SizedBox(height: 12),
        _buildTextField(
          label: '\uc8fc\uc18c (Address)',
          hint: '\uc8fc\uc18c\ub97c \uc785\ub825\ud558\uc138\uc694',
          value: formState.address,
          onChanged: notifier.updateAddress,
        ),

        const SizedBox(height: 24),

        // Check-in/out section
        _buildSectionTitle('\uc77c\uc815', 'Schedule'),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildDateTimePicker(
                label: '\uccb4\ud06c\uc778 (Check-in)',
                value: formState.checkInTime,
                onChanged: notifier.updateCheckInTime,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildDateTimePicker(
                label: '\uccb4\ud06c\uc544\uc6c3 (Check-out)',
                value: formState.checkOutTime,
                onChanged: notifier.updateCheckOutTime,
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Confirmation number
        _buildTextField(
          label: '\uc608\uc57d\ubc88\ud638 (Confirmation Number)',
          hint: '\uc608\uc57d\ubc88\ud638\ub97c \uc785\ub825\ud558\uc138\uc694',
          value: formState.confirmationNumber,
          onChanged: notifier.updateConfirmationNumber,
        ),

        const SizedBox(height: 24),

        // Notes
        _buildSectionTitle('\uba54\ubaa8', 'Notes'),
        const SizedBox(height: 12),
        _buildTextArea(
          hint: '\ucd94\uac00 \uba54\ubaa8\ub97c \uc785\ub825\ud558\uc138\uc694',
          value: formState.notes,
          onChanged: notifier.updateNotes,
        ),

        const SizedBox(height: 24),

        // Attachments
        _buildAttachmentsSection(formState),

        const SizedBox(height: 24),

        // Notification toggle
        _buildNotificationToggle(formState),

        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildRentalCarForm(TripModel trip, AddItineraryItemState formState) {
    final notifier = ref.read(addItineraryItemProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Day selector
        _buildDaySelector(trip, formState),

        const SizedBox(height: 24),

        // Basic info section
        _buildSectionTitle('\uae30\ubcf8 \uc815\ubcf4', 'Basic Info'),
        const SizedBox(height: 12),
        _buildDropdownField(
          label: '\ub80c\ud130\uce74 \uc5c5\uccb4 (Rental Company)',
          hint: '\uc5c5\uccb4 \uc120\ud0dd',
          value: formState.carCompany,
          items: ['Jeju Rent-a-Car', 'Lotte Rent-a-Car', 'SK Rent-a-Car', 'AJ Rent-a-Car'],
          onChanged: (value) => notifier.updateCarCompany(value ?? ''),
        ),
        const SizedBox(height: 12),
        _buildTextField(
          label: '\ucc28\ub7c9 \ubaa8\ub378 (Car Model)',
          hint: '\uc608: \ud604\ub300 \uc544\ubc18\ub5bc',
          value: formState.carModel,
          onChanged: notifier.updateCarModel,
        ),

        const SizedBox(height: 24),

        // Pickup section
        _buildSectionTitle('\ud53d\uc5c5 \uc815\ubcf4', 'Pickup Info'),
        const SizedBox(height: 12),
        _buildTextField(
          label: '\ud53d\uc5c5 \uc7a5\uc18c (Pickup Location)',
          hint: '\ud53d\uc5c5 \uc7a5\uc18c\ub97c \uc785\ub825\ud558\uc138\uc694',
          value: formState.pickupLocation,
          onChanged: notifier.updatePickupLocation,
        ),
        const SizedBox(height: 12),
        _buildDateTimePicker(
          label: '\ud53d\uc5c5 \uc77c\uc2dc (Pickup Time)',
          value: formState.pickupTime,
          onChanged: notifier.updatePickupTime,
        ),

        const SizedBox(height: 24),

        // Dropoff section
        _buildSectionTitle('\ubc18\ub0a9 \uc815\ubcf4', 'Dropoff Info'),
        const SizedBox(height: 12),
        _buildTextField(
          label: '\ubc18\ub0a9 \uc7a5\uc18c (Dropoff Location)',
          hint: '\ubc18\ub0a9 \uc7a5\uc18c\ub97c \uc785\ub825\ud558\uc138\uc694',
          value: formState.dropoffLocation,
          onChanged: notifier.updateDropoffLocation,
        ),
        const SizedBox(height: 12),
        _buildDateTimePicker(
          label: '\ubc18\ub0a9 \uc77c\uc2dc (Dropoff Time)',
          value: formState.dropoffTime,
          onChanged: notifier.updateDropoffTime,
        ),

        const SizedBox(height: 24),

        // Notes
        _buildSectionTitle('\uba54\ubaa8', 'Notes'),
        const SizedBox(height: 12),
        _buildTextArea(
          hint: '\ucd94\uac00 \uba54\ubaa8\ub97c \uc785\ub825\ud558\uc138\uc694',
          value: formState.notes,
          onChanged: notifier.updateNotes,
        ),

        const SizedBox(height: 24),

        // Attachments
        _buildAttachmentsSection(formState),

        const SizedBox(height: 24),

        // Notification toggle
        _buildNotificationToggle(formState),

        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildRestaurantForm(TripModel trip, AddItineraryItemState formState) {
    final notifier = ref.read(addItineraryItemProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Day selector
        _buildDaySelector(trip, formState),

        const SizedBox(height: 24),

        // Basic info section
        _buildSectionTitle('\uae30\ubcf8 \uc815\ubcf4', 'Basic Info'),
        const SizedBox(height: 12),
        _buildTextField(
          label: '\ub808\uc2a4\ud1a0\ub791\uba85 (Restaurant Name)',
          hint: '\ub808\uc2a4\ud1a0\ub791\uba85\uc744 \uc785\ub825\ud558\uc138\uc694',
          value: formState.restaurantName,
          onChanged: notifier.updateRestaurantName,
        ),
        const SizedBox(height: 12),
        _buildDropdownField(
          label: '\uc694\ub9ac \uc885\ub958 (Cuisine Type)',
          hint: '\uc694\ub9ac \uc885\ub958 \uc120\ud0dd',
          value: formState.cuisine,
          items: ['\ud55c\uc2dd (Korean)', '\uc77c\uc2dd (Japanese)', '\uc911\uc2dd (Chinese)',
                  '\uc591\uc2dd (Western)', '\uc528\ud478\ub4dc (Seafood)', '\uce74\ud398 (Cafe)'],
          onChanged: (value) => notifier.updateCuisine(value ?? ''),
        ),
        const SizedBox(height: 12),
        _buildPriceRangeSelector(formState),

        const SizedBox(height: 24),

        // Reservation section
        _buildSectionTitle('\uc608\uc57d \uc815\ubcf4', 'Reservation'),
        const SizedBox(height: 12),
        _buildDateTimePicker(
          label: '\uc608\uc57d \uc77c\uc2dc (Reservation Time)',
          value: formState.reservationTime,
          onChanged: notifier.updateReservationTime,
        ),
        const SizedBox(height: 12),
        _buildTextField(
          label: '\uc8fc\uc18c (Address)',
          hint: '\uc8fc\uc18c\ub97c \uc785\ub825\ud558\uc138\uc694',
          value: formState.address,
          onChanged: notifier.updateAddress,
        ),

        const SizedBox(height: 24),

        // Notes
        _buildSectionTitle('\uba54\ubaa8', 'Notes'),
        const SizedBox(height: 12),
        _buildTextArea(
          hint: '\uc608: \ucd94\ucc9c \uba54\ub274, \uc8fc\uc758\uc0ac\ud56d \ub4f1',
          value: formState.notes,
          onChanged: notifier.updateNotes,
        ),

        const SizedBox(height: 24),

        // Notification toggle
        _buildNotificationToggle(formState),

        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildActivityForm(TripModel trip, AddItineraryItemState formState) {
    final notifier = ref.read(addItineraryItemProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Day selector
        _buildDaySelector(trip, formState),

        const SizedBox(height: 24),

        // Basic info section
        _buildSectionTitle('\uae30\ubcf8 \uc815\ubcf4', 'Basic Info'),
        const SizedBox(height: 12),
        _buildTextField(
          label: '\uc81c\ubaa9 (Title)',
          hint: '\uc561\ud2f0\ube44\ud2f0 \uc81c\ubaa9\uc744 \uc785\ub825\ud558\uc138\uc694',
          value: formState.title,
          onChanged: notifier.updateTitle,
        ),
        const SizedBox(height: 12),
        _buildTextField(
          label: '\uc124\uba85 (Description)',
          hint: '\uac04\ub2e8\ud55c \uc124\uba85\uc744 \uc785\ub825\ud558\uc138\uc694',
          value: formState.description,
          onChanged: notifier.updateDescription,
        ),
        const SizedBox(height: 12),
        _buildTextField(
          label: '\uc7a5\uc18c (Location)',
          hint: '\uc7a5\uc18c\ub97c \uc785\ub825\ud558\uc138\uc694',
          value: formState.location,
          onChanged: notifier.updateLocation,
        ),

        const SizedBox(height: 24),

        // Schedule section
        _buildSectionTitle('\uc77c\uc815', 'Schedule'),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildDateTimePicker(
                label: '\uc2dc\uc791 (Start)',
                value: formState.departureTime,
                onChanged: notifier.updateDepartureTime,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildDateTimePicker(
                label: '\uc885\ub8cc (End)',
                value: formState.arrivalTime,
                onChanged: notifier.updateArrivalTime,
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Notes
        _buildSectionTitle('\uba54\ubaa8', 'Notes'),
        const SizedBox(height: 12),
        _buildTextArea(
          hint: '\ucd94\uac00 \uba54\ubaa8\ub97c \uc785\ub825\ud558\uc138\uc694',
          value: formState.notes,
          onChanged: notifier.updateNotes,
        ),

        const SizedBox(height: 24),

        // Attachments
        _buildAttachmentsSection(formState),

        const SizedBox(height: 24),

        // Notification toggle
        _buildNotificationToggle(formState),

        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildDaySelector(TripModel trip, AddItineraryItemState formState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('\uc77c\uc790 \uc120\ud0dd', 'Select Day'),
        const SizedBox(height: 12),
        SizedBox(
          height: 60,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: trip.totalDays,
            itemBuilder: (context, index) {
              final dayNumber = index + 1;
              final isSelected = dayNumber == formState.selectedDayNumber;
              final dayDate = trip.startDate.add(Duration(days: index));
              final dateFormat = DateFormat('M/d');

              return GestureDetector(
                onTap: () {
                  ref.read(addItineraryItemProvider.notifier).setDayNumber(dayNumber);
                },
                child: Container(
                  width: 60,
                  margin: const EdgeInsets.only(right: 8),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : Colors.white,
                    borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.divider,
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Day $dayNumber',
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.bold,
                          color: isSelected ? Colors.white : AppColors.textPrimaryLight,
                        ),
                      ),
                      Text(
                        dateFormat.format(dayDate),
                        style: TextStyle(
                          fontSize: 10,
                          color: isSelected ? Colors.white70 : AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ],
    );
  }

  Widget _buildSectionTitle(String korean, String english) {
    return Row(
      children: [
        Text(
          korean,
          style: const TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
            color: AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(width: 8),
        Text(
          english,
          style: const TextStyle(
            fontSize: 12,
            color: AppColors.textSecondaryLight,
          ),
        ),
      ],
    );
  }

  Widget _buildTextField({
    required String label,
    required String hint,
    String? value,
    required Function(String) onChanged,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 6),
        TextField(
          controller: TextEditingController(text: value),
          onChanged: onChanged,
          keyboardType: keyboardType,
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: const TextStyle(color: AppColors.textMutedLight),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              borderSide: const BorderSide(color: AppColors.divider),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              borderSide: const BorderSide(color: AppColors.divider),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
      ],
    );
  }

  Widget _buildDropdownField({
    required String label,
    required String hint,
    String? value,
    required List<String> items,
    required Function(String?) onChanged,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 6),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            border: Border.all(color: AppColors.divider),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: items.contains(value) ? value : null,
              hint: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  hint,
                  style: const TextStyle(color: AppColors.textMutedLight),
                ),
              ),
              isExpanded: true,
              icon: const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondaryLight),
              ),
              items: items.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(item),
                  ),
                );
              }).toList(),
              onChanged: onChanged,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTextArea({
    required String hint,
    String? value,
    required Function(String) onChanged,
  }) {
    return TextField(
      controller: TextEditingController(text: value),
      onChanged: onChanged,
      maxLines: 4,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: AppColors.textMutedLight),
        filled: true,
        fillColor: Colors.white,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          borderSide: const BorderSide(color: AppColors.divider),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          borderSide: const BorderSide(color: AppColors.divider),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          borderSide: const BorderSide(color: AppColors.primary, width: 2),
        ),
        contentPadding: const EdgeInsets.all(16),
      ),
    );
  }

  Widget _buildDateTimePicker({
    required String label,
    DateTime? value,
    required Function(DateTime) onChanged,
  }) {
    final dateFormat = DateFormat('MM/dd HH:mm');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 6),
        GestureDetector(
          onTap: () async {
            final date = await showDatePicker(
              context: context,
              initialDate: value ?? DateTime.now(),
              firstDate: DateTime.now().subtract(const Duration(days: 365)),
              lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
            );
            if (date != null) {
              final time = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.fromDateTime(value ?? DateTime.now()),
              );
              if (time != null) {
                onChanged(DateTime(date.year, date.month, date.day, time.hour, time.minute));
              }
            }
          },
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              border: Border.all(color: AppColors.divider),
            ),
            child: Row(
              children: [
                const Icon(Icons.calendar_today, size: 18, color: AppColors.textSecondaryLight),
                const SizedBox(width: 12),
                Text(
                  value != null ? dateFormat.format(value) : '\uc120\ud0dd',
                  style: TextStyle(
                    color: value != null ? AppColors.textPrimaryLight : AppColors.textMutedLight,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildPriceRangeSelector(AddItineraryItemState formState) {
    final notifier = ref.read(addItineraryItemProvider.notifier);
    final priceRanges = ['\$', '\$\$', '\$\$\$', '\$\$\$\$'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '\uac00\uaca9\ub300 (Price Range)',
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
            color: AppColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 6),
        Row(
          children: priceRanges.map((range) {
            final isSelected = formState.priceRange == range;
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: GestureDetector(
                onTap: () => notifier.updatePriceRange(range),
                child: Container(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                  decoration: BoxDecoration(
                    color: isSelected ? AppColors.primary : Colors.white,
                    borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                    border: Border.all(
                      color: isSelected ? AppColors.primary : AppColors.divider,
                    ),
                  ),
                  child: Text(
                    range,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: isSelected ? Colors.white : AppColors.textSecondaryLight,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ],
    );
  }

  Widget _buildAttachmentsSection(AddItineraryItemState formState) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('\ucca8\ubd80\ud30c\uc77c \ucd94\uac00', 'Add Attachments'),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () {
            // TODO: Implement file picker
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('File picker coming soon')),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              border: Border.all(
                color: AppColors.divider,
                style: BorderStyle.solid,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.attach_file,
                  color: AppColors.textSecondaryLight,
                ),
                const SizedBox(width: 8),
                const Text(
                  'E-\ud2f0\ucf13, \uc608\uc57d \ud655\uc778\uc11c \ub4f1',
                  style: TextStyle(
                    color: AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
        ),
        if (formState.attachmentUrls.isNotEmpty) ...[
          const SizedBox(height: 8),
          ...formState.attachmentUrls.map((url) => ListTile(
                leading: const Icon(Icons.insert_drive_file),
                title: Text(url.split('/').last),
                trailing: IconButton(
                  icon: const Icon(Icons.close),
                  onPressed: () {
                    ref.read(addItineraryItemProvider.notifier).removeAttachment(url);
                  },
                ),
              )),
        ],
      ],
    );
  }

  Widget _buildNotificationToggle(AddItineraryItemState formState) {
    final notifier = ref.read(addItineraryItemProvider.notifier);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(color: AppColors.divider),
      ),
      child: Row(
        children: [
          Icon(
            Icons.notifications_outlined,
            color: formState.notificationsEnabled ? AppColors.primary : AppColors.textSecondaryLight,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  '\uc54c\ub9bc \uc124\uc815',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                    color: AppColors.textPrimaryLight,
                  ),
                ),
                Text(
                  'Notification Setting',
                  style: TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: formState.notificationsEnabled,
            onChanged: (_) => notifier.toggleNotifications(),
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  String _calculateFlightDuration(DateTime departure, DateTime arrival) {
    final duration = arrival.difference(departure);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '${hours}h ${minutes}m';
  }

  Future<void> _saveItem(TripModel trip) async {
    final item = await ref.read(addItineraryItemProvider.notifier).save(widget.tripId);

    if (item != null) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Activity added successfully')),
        );
        context.pop();
      }
    } else {
      final errorMessage = ref.read(addItineraryItemProvider).errorMessage;
      if (mounted && errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $errorMessage')),
        );
      }
    }
  }
}

class _CategoryTab {
  final ItineraryItemType type;
  final String emoji;
  final String label;
  final String labelEn;

  _CategoryTab({
    required this.type,
    required this.emoji,
    required this.label,
    required this.labelEn,
  });
}
