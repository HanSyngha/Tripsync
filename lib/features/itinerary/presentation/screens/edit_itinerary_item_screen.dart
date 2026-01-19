import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../data/models/trip_model.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../trip/providers/trip_provider.dart';
import '../../providers/itinerary_provider.dart';

class EditItineraryItemScreen extends ConsumerStatefulWidget {
  final String tripId;
  final String itemId;

  const EditItineraryItemScreen({
    super.key,
    required this.tripId,
    required this.itemId,
  });

  @override
  ConsumerState<EditItineraryItemScreen> createState() => _EditItineraryItemScreenState();
}

class _EditItineraryItemScreenState extends ConsumerState<EditItineraryItemScreen> {
  bool _initialized = false;

  // Major airlines list (100+)
  static const List<String> _majorAirlines = [
    'Korean Air', 'Asiana Airlines', 'Jeju Air', 'Jin Air', 'T\'way Air', 'Air Busan', 'Air Seoul', 'Eastar Jet',
    'All Nippon Airways (ANA)', 'Japan Airlines (JAL)', 'Peach Aviation', 'Jetstar Japan', 'Skymark Airlines', 'Solaseed Air', 'StarFlyer',
    'Air China', 'China Eastern Airlines', 'China Southern Airlines', 'Hainan Airlines', 'Xiamen Airlines', 'Sichuan Airlines', 'Shenzhen Airlines', 'Spring Airlines', 'Juneyao Airlines',
    'Singapore Airlines', 'Cathay Pacific', 'Thai Airways', 'Vietnam Airlines', 'Malaysia Airlines', 'Philippine Airlines', 'Garuda Indonesia',
    'AirAsia', 'AirAsia X', 'Scoot', 'Cebu Pacific', 'VietJet Air', 'Bangkok Airways', 'Lion Air', 'Batik Air',
    'Emirates', 'Qatar Airways', 'Etihad Airways', 'Turkish Airlines', 'Saudia', 'Oman Air', 'Gulf Air', 'Kuwait Airways', 'Royal Jordanian', 'EgyptAir',
    'Lufthansa', 'British Airways', 'Air France', 'KLM Royal Dutch Airlines', 'Swiss International Air Lines', 'Austrian Airlines', 'Scandinavian Airlines (SAS)', 'Finnair',
    'Iberia', 'TAP Air Portugal', 'Alitalia', 'LOT Polish Airlines', 'Czech Airlines', 'Aeroflot', 'Norwegian Air', 'Vueling', 'EasyJet', 'Ryanair', 'Eurowings', 'Wizz Air', 'Transavia', 'Aegean Airlines', 'Icelandair', 'Brussels Airlines', 'Air Europa', 'Aer Lingus',
    'United Airlines', 'American Airlines', 'Delta Air Lines', 'Southwest Airlines', 'JetBlue Airways', 'Alaska Airlines', 'Spirit Airlines', 'Frontier Airlines', 'Hawaiian Airlines',
    'Air Canada', 'WestJet', 'Porter Airlines', 'Aeromexico', 'Volaris', 'Interjet',
    'LATAM Airlines', 'Avianca', 'GOL Airlines', 'Azul Brazilian Airlines', 'Copa Airlines', 'Aerolineas Argentinas',
    'Qantas', 'Virgin Australia', 'Jetstar Airways', 'Air New Zealand', 'Fiji Airways',
    'Ethiopian Airlines', 'South African Airways', 'Kenya Airways', 'Royal Air Maroc', 'Air Mauritius',
    'Air India', 'IndiGo', 'SpiceJet', 'GoAir', 'Vistara', 'SriLankan Airlines', 'Pakistan International Airlines', 'Biman Bangladesh Airlines',
    'EVA Air', 'China Airlines', 'Starlux Airlines', 'Hong Kong Airlines', 'Mongolian Airlines',
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final tripAsync = ref.watch(tripProvider(widget.tripId));
    final itemAsync = ref.watch(itineraryItemProvider((tripId: widget.tripId, itemId: widget.itemId)));
    final formState = ref.watch(editItineraryItemProvider);

    return tripAsync.when(
      data: (trip) {
        if (trip == null) {
          return Scaffold(
            body: Center(child: Text(l10n.tripNotFound)),
          );
        }
        return itemAsync.when(
          data: (item) {
            if (item == null) {
              return Scaffold(
                body: Center(child: Text(l10n.itemNotFound)),
              );
            }

            // Initialize form with item data
            if (!_initialized && !formState.isInitialized) {
              WidgetsBinding.instance.addPostFrameCallback((_) {
                ref.read(editItineraryItemProvider.notifier).initializeFromItem(item);
              });
              _initialized = true;
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
                title: Text(
                  l10n.editItinerary,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: AppColors.textPrimaryLight,
                  ),
                ),
                actions: [
                  TextButton(
                    onPressed: formState.isLoading ? null : () => _saveItem(),
                    child: Text(
                      l10n.save,
                      style: TextStyle(
                        color: formState.isLoading ? Colors.grey : AppColors.primary,
                        fontWeight: FontWeight.w600,
                        fontSize: 16,
                      ),
                    ),
                  ),
                ],
              ),
              body: formState.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : SingleChildScrollView(
                      padding: const EdgeInsets.all(16),
                      child: _buildFormContent(trip, formState, l10n),
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
      },
      loading: () => const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      ),
      error: (error, _) => Scaffold(
        body: Center(child: Text('Error: $error')),
      ),
    );
  }

  Widget _buildFormContent(TripModel trip, EditItineraryItemState formState, AppLocalizations l10n) {
    switch (formState.selectedType) {
      case ItineraryItemType.flight:
        return _buildFlightForm(trip, formState, l10n);
      case ItineraryItemType.accommodation:
        return _buildAccommodationForm(trip, formState, l10n);
      case ItineraryItemType.rentalCar:
        return _buildRentalCarForm(trip, formState, l10n);
      case ItineraryItemType.restaurant:
        return _buildRestaurantForm(trip, formState, l10n);
      case ItineraryItemType.attraction:
      case ItineraryItemType.activity:
      default:
        return _buildActivityForm(trip, formState, l10n);
    }
  }

  Widget _buildFlightForm(TripModel trip, EditItineraryItemState formState, AppLocalizations l10n) {
    final notifier = ref.read(editItineraryItemProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Visual flight card
        _buildFlightVisualCard(formState),

        const SizedBox(height: 24),

        // Day selector
        _buildDaySelector(trip, formState, l10n),

        const SizedBox(height: 24),

        // Basic info section
        _buildSectionTitle(l10n.basicInfo),
        const SizedBox(height: 12),
        _buildDropdownField(
          label: l10n.airline,
          hint: l10n.selectAirline,
          value: formState.airline,
          items: _majorAirlines,
          onChanged: (value) => notifier.updateAirline(value ?? ''),
        ),
        const SizedBox(height: 12),
        _buildTextField(
          label: l10n.flightNumber,
          hint: 'KE123',
          value: formState.flightNumber,
          onChanged: notifier.updateFlightNumber,
        ),

        const SizedBox(height: 24),

        // Schedule section
        _buildSectionTitle(l10n.schedule),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildDateTimePicker(
                label: l10n.departure,
                value: formState.departureTime,
                onChanged: notifier.updateDepartureTime,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildDateTimePicker(
                label: l10n.arrival,
                value: formState.arrivalTime,
                onChanged: notifier.updateArrivalTime,
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Notes
        _buildSectionTitle(l10n.notes),
        const SizedBox(height: 12),
        _buildTextArea(
          hint: l10n.enterNotesHint,
          value: formState.notes,
          onChanged: notifier.updateNotes,
        ),

        const SizedBox(height: 24),

        // Attachments
        _buildAttachmentsSection(formState, l10n),

        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildFlightVisualCard(EditItineraryItemState formState) {
    final notifier = ref.read(editItineraryItemProvider.notifier);

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
                  angle: 1.57,
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

  Widget _buildAccommodationForm(TripModel trip, EditItineraryItemState formState, AppLocalizations l10n) {
    final notifier = ref.read(editItineraryItemProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Day selector
        _buildDaySelector(trip, formState, l10n),

        const SizedBox(height: 24),

        // Basic info section
        _buildSectionTitle(l10n.basicInfo),
        const SizedBox(height: 12),
        _buildTextField(
          label: l10n.hotelName,
          hint: l10n.enterHotelName,
          value: formState.hotelName,
          onChanged: notifier.updateHotelName,
        ),
        const SizedBox(height: 12),
        _buildTextField(
          label: l10n.roomType,
          hint: l10n.enterRoomType,
          value: formState.roomType,
          onChanged: notifier.updateRoomType,
        ),
        const SizedBox(height: 12),
        _buildTextField(
          label: l10n.address,
          hint: l10n.enterAddress,
          value: formState.address,
          onChanged: notifier.updateAddress,
        ),

        const SizedBox(height: 24),

        // Check-in/out section
        _buildSectionTitle(l10n.schedule),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildDateTimePicker(
                label: l10n.checkIn,
                value: formState.checkInTime,
                onChanged: notifier.updateCheckInTime,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildDateTimePicker(
                label: l10n.checkOut,
                value: formState.checkOutTime,
                onChanged: notifier.updateCheckOutTime,
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Confirmation number
        _buildTextField(
          label: l10n.confirmationNumber,
          hint: l10n.enterConfirmationNumber,
          value: formState.confirmationNumber,
          onChanged: notifier.updateConfirmationNumber,
        ),

        const SizedBox(height: 24),

        // Notes
        _buildSectionTitle(l10n.notes),
        const SizedBox(height: 12),
        _buildTextArea(
          hint: l10n.enterNotesHint,
          value: formState.notes,
          onChanged: notifier.updateNotes,
        ),

        const SizedBox(height: 24),

        // Attachments
        _buildAttachmentsSection(formState, l10n),

        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildRentalCarForm(TripModel trip, EditItineraryItemState formState, AppLocalizations l10n) {
    final notifier = ref.read(editItineraryItemProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Day selector
        _buildDaySelector(trip, formState, l10n),

        const SizedBox(height: 24),

        // Basic info section
        _buildSectionTitle(l10n.basicInfo),
        const SizedBox(height: 12),
        _buildDropdownField(
          label: l10n.carCompany,
          hint: l10n.selectCarCompany,
          value: formState.carCompany,
          items: ['Jeju Rent-a-Car', 'Lotte Rent-a-Car', 'SK Rent-a-Car', 'AJ Rent-a-Car'],
          onChanged: (value) => notifier.updateCarCompany(value ?? ''),
        ),
        const SizedBox(height: 12),
        _buildTextField(
          label: l10n.carModel,
          hint: l10n.enterCarModel,
          value: formState.carModel,
          onChanged: notifier.updateCarModel,
        ),

        const SizedBox(height: 24),

        // Pickup section
        _buildSectionTitle(l10n.pickupInfo),
        const SizedBox(height: 12),
        _buildTextField(
          label: l10n.pickupLocation,
          hint: l10n.enterPickupLocation,
          value: formState.pickupLocation,
          onChanged: notifier.updatePickupLocation,
        ),
        const SizedBox(height: 12),
        _buildDateTimePicker(
          label: l10n.pickupTime,
          value: formState.pickupTime,
          onChanged: notifier.updatePickupTime,
        ),

        const SizedBox(height: 24),

        // Dropoff section
        _buildSectionTitle(l10n.dropoffInfo),
        const SizedBox(height: 12),
        _buildTextField(
          label: l10n.dropoffLocation,
          hint: l10n.enterDropoffLocation,
          value: formState.dropoffLocation,
          onChanged: notifier.updateDropoffLocation,
        ),
        const SizedBox(height: 12),
        _buildDateTimePicker(
          label: l10n.dropoffTime,
          value: formState.dropoffTime,
          onChanged: notifier.updateDropoffTime,
        ),

        const SizedBox(height: 24),

        // Notes
        _buildSectionTitle(l10n.notes),
        const SizedBox(height: 12),
        _buildTextArea(
          hint: l10n.enterNotesHint,
          value: formState.notes,
          onChanged: notifier.updateNotes,
        ),

        const SizedBox(height: 24),

        // Attachments
        _buildAttachmentsSection(formState, l10n),

        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildRestaurantForm(TripModel trip, EditItineraryItemState formState, AppLocalizations l10n) {
    final notifier = ref.read(editItineraryItemProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Day selector
        _buildDaySelector(trip, formState, l10n),

        const SizedBox(height: 24),

        // Basic info section
        _buildSectionTitle(l10n.basicInfo),
        const SizedBox(height: 12),
        _buildTextField(
          label: l10n.restaurantName,
          hint: l10n.enterRestaurantName,
          value: formState.restaurantName ?? formState.title,
          onChanged: notifier.updateRestaurantName,
        ),
        const SizedBox(height: 12),
        _buildDropdownField(
          label: l10n.cuisineType,
          hint: l10n.selectCuisineType,
          value: formState.cuisine,
          items: ['Korean', 'Japanese', 'Chinese', 'Western', 'Seafood', 'Cafe'],
          onChanged: (value) => notifier.updateCuisine(value ?? ''),
        ),
        const SizedBox(height: 12),
        _buildPriceRangeSelector(formState, l10n),

        const SizedBox(height: 24),

        // Reservation section
        _buildSectionTitle(l10n.reservationInfo),
        const SizedBox(height: 12),
        _buildDateTimePicker(
          label: l10n.reservationTime,
          value: formState.reservationTime,
          onChanged: notifier.updateReservationTime,
        ),
        const SizedBox(height: 12),
        _buildTextField(
          label: l10n.address,
          hint: l10n.enterAddress,
          value: formState.address,
          onChanged: notifier.updateAddress,
        ),

        const SizedBox(height: 24),

        // Notes
        _buildSectionTitle(l10n.notes),
        const SizedBox(height: 12),
        _buildTextArea(
          hint: l10n.enterNotesHint,
          value: formState.notes,
          onChanged: notifier.updateNotes,
        ),

        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildActivityForm(TripModel trip, EditItineraryItemState formState, AppLocalizations l10n) {
    final notifier = ref.read(editItineraryItemProvider.notifier);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Day selector
        _buildDaySelector(trip, formState, l10n),

        const SizedBox(height: 24),

        // Basic info section
        _buildSectionTitle(l10n.basicInfo),
        const SizedBox(height: 12),
        _buildTextField(
          label: l10n.title,
          hint: l10n.enterTitle,
          value: formState.title,
          onChanged: notifier.updateTitle,
        ),
        const SizedBox(height: 12),
        _buildTextField(
          label: l10n.description,
          hint: l10n.enterDescription,
          value: formState.description,
          onChanged: notifier.updateDescription,
        ),
        const SizedBox(height: 12),
        _buildTextField(
          label: l10n.location,
          hint: l10n.enterLocation,
          value: formState.location,
          onChanged: notifier.updateLocation,
        ),

        const SizedBox(height: 24),

        // Schedule section
        _buildSectionTitle(l10n.schedule),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildDateTimePicker(
                label: l10n.startTime,
                value: formState.departureTime,
                onChanged: notifier.updateDepartureTime,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildDateTimePicker(
                label: l10n.endTime,
                value: formState.arrivalTime,
                onChanged: notifier.updateArrivalTime,
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Notes
        _buildSectionTitle(l10n.notes),
        const SizedBox(height: 12),
        _buildTextArea(
          hint: l10n.enterNotesHint,
          value: formState.notes,
          onChanged: notifier.updateNotes,
        ),

        const SizedBox(height: 24),

        // Attachments
        _buildAttachmentsSection(formState, l10n),

        const SizedBox(height: 40),
      ],
    );
  }

  Widget _buildDaySelector(TripModel trip, EditItineraryItemState formState, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(l10n.selectDay),
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
                  ref.read(editItineraryItemProvider.notifier).setDayNumber(dayNumber);
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

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.bold,
        color: AppColors.textPrimaryLight,
      ),
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
          style: const TextStyle(
            color: AppColors.textPrimaryLight,
            fontSize: 16,
          ),
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
              style: const TextStyle(
                color: AppColors.textPrimaryLight,
                fontSize: 16,
              ),
              dropdownColor: Colors.white,
              icon: const Padding(
                padding: EdgeInsets.only(right: 12),
                child: Icon(Icons.keyboard_arrow_down, color: AppColors.textSecondaryLight),
              ),
              items: items.map((item) {
                return DropdownMenuItem(
                  value: item,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Text(
                      item,
                      style: const TextStyle(color: AppColors.textPrimaryLight),
                    ),
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
      style: const TextStyle(
        color: AppColors.textPrimaryLight,
        fontSize: 16,
      ),
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
                  value != null ? dateFormat.format(value) : 'Select',
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

  Widget _buildPriceRangeSelector(EditItineraryItemState formState, AppLocalizations l10n) {
    final notifier = ref.read(editItineraryItemProvider.notifier);
    final priceRanges = ['\$', '\$\$', '\$\$\$', '\$\$\$\$'];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.priceRange,
          style: const TextStyle(
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

  Widget _buildAttachmentsSection(EditItineraryItemState formState, AppLocalizations l10n) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle(l10n.addAttachments),
        const SizedBox(height: 12),
        GestureDetector(
          onTap: () {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(l10n.filePickerComingSoon)),
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
                const Icon(
                  Icons.attach_file,
                  color: AppColors.textSecondaryLight,
                ),
                const SizedBox(width: 8),
                Text(
                  l10n.attachmentHint,
                  style: const TextStyle(
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
                    ref.read(editItineraryItemProvider.notifier).removeAttachment(url);
                  },
                ),
              )),
        ],
      ],
    );
  }

  String _calculateFlightDuration(DateTime departure, DateTime arrival) {
    final duration = arrival.difference(departure);
    final hours = duration.inHours;
    final minutes = duration.inMinutes.remainder(60);
    return '${hours}h ${minutes}m';
  }

  Future<void> _saveItem() async {
    final l10n = AppLocalizations.of(context)!;
    final success = await ref.read(editItineraryItemProvider.notifier).save();

    if (success) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(l10n.itemUpdatedSuccess),
            backgroundColor: AppColors.success,
          ),
        );
        context.pop();
      }
    } else {
      final errorMessage = ref.read(editItineraryItemProvider).errorMessage;
      if (mounted && errorMessage != null) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${l10n.error}: $errorMessage'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }
}
