import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../data/models/trip_model.dart';
import '../../../../data/models/airport_model.dart';
import '../../../../data/services/flight_search_service.dart';
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

  // Major airlines list (100+)
  static const List<String> _majorAirlines = [
    // Korean Airlines
    'Korean Air',
    'Asiana Airlines',
    'Jeju Air',
    'Jin Air',
    'T\'way Air',
    'Air Busan',
    'Air Seoul',
    'Eastar Jet',
    // Japanese Airlines
    'All Nippon Airways (ANA)',
    'Japan Airlines (JAL)',
    'Peach Aviation',
    'Jetstar Japan',
    'Skymark Airlines',
    'Solaseed Air',
    'StarFlyer',
    // Chinese Airlines
    'Air China',
    'China Eastern Airlines',
    'China Southern Airlines',
    'Hainan Airlines',
    'Xiamen Airlines',
    'Sichuan Airlines',
    'Shenzhen Airlines',
    'Spring Airlines',
    'Juneyao Airlines',
    // Southeast Asian Airlines
    'Singapore Airlines',
    'Cathay Pacific',
    'Thai Airways',
    'Vietnam Airlines',
    'Malaysia Airlines',
    'Philippine Airlines',
    'Garuda Indonesia',
    'AirAsia',
    'AirAsia X',
    'Scoot',
    'Cebu Pacific',
    'VietJet Air',
    'Bangkok Airways',
    'Lion Air',
    'Batik Air',
    // Middle Eastern Airlines
    'Emirates',
    'Qatar Airways',
    'Etihad Airways',
    'Turkish Airlines',
    'Saudia',
    'Oman Air',
    'Gulf Air',
    'Kuwait Airways',
    'Royal Jordanian',
    'EgyptAir',
    // European Airlines
    'Lufthansa',
    'British Airways',
    'Air France',
    'KLM Royal Dutch Airlines',
    'Swiss International Air Lines',
    'Austrian Airlines',
    'Scandinavian Airlines (SAS)',
    'Finnair',
    'Iberia',
    'TAP Air Portugal',
    'Alitalia',
    'LOT Polish Airlines',
    'Czech Airlines',
    'Aeroflot',
    'Norwegian Air',
    'Vueling',
    'EasyJet',
    'Ryanair',
    'Eurowings',
    'Wizz Air',
    'Transavia',
    'Aegean Airlines',
    'Icelandair',
    'Brussels Airlines',
    'Air Europa',
    'Aer Lingus',
    // North American Airlines
    'United Airlines',
    'American Airlines',
    'Delta Air Lines',
    'Southwest Airlines',
    'JetBlue Airways',
    'Alaska Airlines',
    'Spirit Airlines',
    'Frontier Airlines',
    'Hawaiian Airlines',
    'Air Canada',
    'WestJet',
    'Porter Airlines',
    'Aeromexico',
    'Volaris',
    'Interjet',
    // South American Airlines
    'LATAM Airlines',
    'Avianca',
    'GOL Airlines',
    'Azul Brazilian Airlines',
    'Copa Airlines',
    'Aerolineas Argentinas',
    // Oceania Airlines
    'Qantas',
    'Virgin Australia',
    'Jetstar Airways',
    'Air New Zealand',
    'Fiji Airways',
    // African Airlines
    'Ethiopian Airlines',
    'South African Airways',
    'Kenya Airways',
    'Royal Air Maroc',
    'Air Mauritius',
    // Indian Subcontinent Airlines
    'Air India',
    'IndiGo',
    'SpiceJet',
    'GoAir',
    'Vistara',
    'SriLankan Airlines',
    'Pakistan International Airlines',
    'Biman Bangladesh Airlines',
    // Other Asian Airlines
    'EVA Air',
    'China Airlines',
    'Starlux Airlines',
    'Hong Kong Airlines',
    'Mongolian Airlines',
    // Cargo Airlines (passenger service)
    'Cargolux',
    'Atlas Air',
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
    final departureAirport = formState.departureAirport != null
        ? AirportDatabase.findByCode(formState.departureAirport!)
        : null;
    final arrivalAirport = formState.arrivalAirport != null
        ? AirportDatabase.findByCode(formState.arrivalAirport!)
        : null;

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
        _buildSectionTitle('기본 정보', 'Basic Info'),
        const SizedBox(height: 12),
        _buildDropdownField(
          label: '항공사 (Airline)',
          hint: '항공사 선택',
          value: formState.airline,
          items: _majorAirlines,
          onChanged: (value) => notifier.updateAirline(value ?? ''),
        ),
        const SizedBox(height: 12),
        Row(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Expanded(
              child: _buildTextField(
                label: '항공편명 (Flight Number)',
                hint: 'KE123',
                value: formState.flightNumber,
                onChanged: notifier.updateFlightNumber,
              ),
            ),
            const SizedBox(width: 12),
            SizedBox(
              height: 52,
              child: ElevatedButton.icon(
                onPressed: formState.flightNumber?.isNotEmpty == true
                    ? () => _searchFlight(formState, notifier)
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: AppColors.primary,
                  foregroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                  ),
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                ),
                icon: const Icon(Icons.search, size: 20),
                label: const Text('검색'),
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Terminal section
        if (departureAirport != null && departureAirport.terminals.isNotEmpty) ...[
          _buildSectionTitle('출발 터미널', 'Departure Terminal'),
          const SizedBox(height: 12),
          _buildTerminalSelector(
            terminals: departureAirport.terminals,
            selectedTerminal: formState.departureTerminal,
            onSelect: notifier.updateDepartureTerminal,
          ),
          const SizedBox(height: 24),
        ],

        if (arrivalAirport != null && arrivalAirport.terminals.isNotEmpty) ...[
          _buildSectionTitle('도착 터미널', 'Arrival Terminal'),
          const SizedBox(height: 12),
          _buildTerminalSelector(
            terminals: arrivalAirport.terminals,
            selectedTerminal: formState.arrivalTerminal,
            onSelect: notifier.updateArrivalTerminal,
          ),
          const SizedBox(height: 24),
        ],

        // Schedule section
        _buildSectionTitle('일정', 'Schedule'),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildDateTimePicker(
                label: '출발 (Departure)',
                value: formState.departureTime,
                onChanged: notifier.updateDepartureTime,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildDateTimePicker(
                label: '도착 (Arrival)',
                value: formState.arrivalTime,
                onChanged: notifier.updateArrivalTime,
              ),
            ),
          ],
        ),

        const SizedBox(height: 24),

        // Notes
        _buildSectionTitle('메모', 'Notes'),
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
    final departureAirport = formState.departureAirport != null
        ? AirportDatabase.findByCode(formState.departureAirport!)
        : null;
    final arrivalAirport = formState.arrivalAirport != null
        ? AirportDatabase.findByCode(formState.arrivalAirport!)
        : null;

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
            child: _buildAirportSelector(
              label: 'FROM',
              airport: departureAirport,
              airportCode: formState.departureAirport,
              hint: 'GMP',
              onSelect: (airport) {
                notifier.updateDepartureAirport(airport.iataCode);
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
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
            child: _buildAirportSelector(
              label: 'TO',
              airport: arrivalAirport,
              airportCode: formState.arrivalAirport,
              hint: 'CJU',
              onSelect: (airport) {
                notifier.updateArrivalAirport(airport.iataCode);
              },
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAirportSelector({
    required String label,
    Airport? airport,
    String? airportCode,
    required String hint,
    required Function(Airport) onSelect,
  }) {
    return GestureDetector(
      onTap: () => _showAirportSearchModal(onSelect),
      child: Column(
        children: [
          Text(
            label,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 11,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(height: 4),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.2),
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              children: [
                Text(
                  airportCode?.isNotEmpty == true ? airportCode! : hint,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: airportCode?.isNotEmpty == true
                        ? Colors.white
                        : Colors.white.withOpacity(0.5),
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                if (airport != null) ...[
                  const SizedBox(height: 4),
                  Text(
                    airport.cityKo,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _searchFlight(AddItineraryItemState formState, AddItineraryItemNotifier notifier) async {
    final flightNumber = formState.flightNumber;
    if (flightNumber == null || flightNumber.isEmpty) return;

    // 날짜 선택 다이얼로그
    final selectedDate = await showDatePicker(
      context: context,
      initialDate: formState.departureTime ?? DateTime.now(),
      firstDate: DateTime.now().subtract(const Duration(days: 7)),
      lastDate: DateTime.now().add(const Duration(days: 365)),
      helpText: '비행 날짜를 선택하세요',
    );

    if (selectedDate == null || !mounted) return;

    // 로딩 표시
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (context) => const Center(
        child: Card(
          child: Padding(
            padding: EdgeInsets.all(24),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircularProgressIndicator(),
                SizedBox(height: 16),
                Text('항공편 검색 중...'),
              ],
            ),
          ),
        ),
      ),
    );

    try {
      final service = FlightSearchService();
      final flightInfo = await service.searchFlight(flightNumber, selectedDate);
      service.dispose();

      if (!mounted) return;
      Navigator.of(context).pop(); // 로딩 다이얼로그 닫기

      if (flightInfo != null) {
        // 검색 결과로 폼 자동 채우기
        if (flightInfo.airline.isNotEmpty) {
          notifier.updateAirline(flightInfo.airlineName);
        }
        if (flightInfo.departureAirport.isNotEmpty) {
          notifier.updateDepartureAirport(flightInfo.departureAirport);
        }
        if (flightInfo.arrivalAirport.isNotEmpty) {
          notifier.updateArrivalAirport(flightInfo.arrivalAirport);
        }
        if (flightInfo.departureTime != null) {
          notifier.updateDepartureTime(flightInfo.departureTime!);
        }
        if (flightInfo.arrivalTime != null) {
          notifier.updateArrivalTime(flightInfo.arrivalTime!);
        }
        if (flightInfo.departureTerminal != null) {
          notifier.updateDepartureTerminal(flightInfo.departureTerminal!);
        }
        if (flightInfo.arrivalTerminal != null) {
          notifier.updateArrivalTerminal(flightInfo.arrivalTerminal!);
        }

        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${flightInfo.airlineName} ${flightInfo.flightNumber} 정보를 불러왔습니다'),
            backgroundColor: Colors.green,
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('항공편 정보를 찾을 수 없습니다'),
            backgroundColor: Colors.orange,
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      Navigator.of(context).pop(); // 로딩 다이얼로그 닫기

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('검색 오류: $e'),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  void _showAirportSearchModal(Function(Airport) onSelect) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => _AirportSearchModal(
        onSelect: (airport) {
          onSelect(airport);
          Navigator.pop(context);
        },
      ),
    );
  }

  Widget _buildTerminalSelector({
    required List<String> terminals,
    required String? selectedTerminal,
    required Function(String) onSelect,
  }) {
    return SizedBox(
      height: 44,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: terminals.length,
        itemBuilder: (context, index) {
          final terminal = terminals[index];
          final isSelected = selectedTerminal == terminal;

          return Padding(
            padding: const EdgeInsets.only(right: 8),
            child: GestureDetector(
              onTap: () => onSelect(terminal),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
                decoration: BoxDecoration(
                  color: isSelected ? AppColors.primary : Colors.white,
                  borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                  border: Border.all(
                    color: isSelected ? AppColors.primary : AppColors.divider,
                  ),
                ),
                child: Center(
                  child: Text(
                    terminal,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: isSelected ? Colors.white : AppColors.textPrimaryLight,
                    ),
                  ),
                ),
              ),
            ),
          );
        },
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

// Airport Search Modal
class _AirportSearchModal extends StatefulWidget {
  final Function(Airport) onSelect;

  const _AirportSearchModal({required this.onSelect});

  @override
  State<_AirportSearchModal> createState() => _AirportSearchModalState();
}

class _AirportSearchModalState extends State<_AirportSearchModal> {
  final _searchController = TextEditingController();
  List<Airport> _searchResults = [];
  bool _isSearching = false;

  @override
  void initState() {
    super.initState();
    // Show popular airports initially
    _searchResults = AirportDatabase.airports.take(20).toList();
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  void _onSearchChanged(String query) {
    setState(() {
      _isSearching = query.isNotEmpty;
      if (query.isEmpty) {
        _searchResults = AirportDatabase.airports.take(20).toList();
      } else {
        _searchResults = AirportDatabase.search(query);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.85,
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      child: Column(
        children: [
          // Handle bar
          Container(
            margin: const EdgeInsets.only(top: 12),
            width: 40,
            height: 4,
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(2),
            ),
          ),

          // Title
          const Padding(
            padding: EdgeInsets.all(16),
            child: Text(
              '공항 검색',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: AppColors.textPrimaryLight,
              ),
            ),
          ),

          // Search field
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _searchController,
              onChanged: _onSearchChanged,
              autofocus: true,
              style: const TextStyle(
                color: AppColors.textPrimaryLight,
                fontSize: 16,
              ),
              decoration: InputDecoration(
                hintText: '도시, 공항명, IATA 코드로 검색',
                hintStyle: const TextStyle(color: AppColors.textMutedLight),
                prefixIcon: const Icon(Icons.search, color: AppColors.textSecondaryLight),
                suffixIcon: _searchController.text.isNotEmpty
                    ? IconButton(
                        icon: const Icon(Icons.clear, color: AppColors.textSecondaryLight),
                        onPressed: () {
                          _searchController.clear();
                          _onSearchChanged('');
                        },
                      )
                    : null,
                filled: true,
                fillColor: AppColors.surfaceLight,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: BorderSide.none,
                ),
                contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
              ),
            ),
          ),

          const SizedBox(height: 8),

          // Section header
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                _isSearching ? '검색 결과' : '인기 공항',
                style: const TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w600,
                  color: AppColors.textSecondaryLight,
                ),
              ),
            ),
          ),

          // Results list
          Expanded(
            child: _searchResults.isEmpty
                ? Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.search_off, size: 48, color: Colors.grey[400]),
                        const SizedBox(height: 12),
                        Text(
                          '검색 결과가 없습니다',
                          style: TextStyle(
                            color: Colors.grey[600],
                            fontSize: 14,
                          ),
                        ),
                      ],
                    ),
                  )
                : ListView.builder(
                    itemCount: _searchResults.length,
                    itemBuilder: (context, index) {
                      final airport = _searchResults[index];
                      return _AirportListTile(
                        airport: airport,
                        onTap: () => widget.onSelect(airport),
                      );
                    },
                  ),
          ),
        ],
      ),
    );
  }
}

class _AirportListTile extends StatelessWidget {
  final Airport airport;
  final VoidCallback onTap;

  const _AirportListTile({
    required this.airport,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        child: Row(
          children: [
            // IATA code badge
            Container(
              width: 56,
              height: 40,
              decoration: BoxDecoration(
                color: AppColors.flightColor.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Center(
                child: Text(
                  airport.iataCode,
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.flightColor,
                    letterSpacing: 1,
                  ),
                ),
              ),
            ),
            const SizedBox(width: 12),

            // Airport info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    '${airport.cityKo} (${airport.city})',
                    style: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                      color: AppColors.textPrimaryLight,
                    ),
                  ),
                  const SizedBox(height: 2),
                  Text(
                    airport.nameKo,
                    style: const TextStyle(
                      fontSize: 12,
                      color: AppColors.textSecondaryLight,
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  if (airport.terminals.isNotEmpty) ...[
                    const SizedBox(height: 2),
                    Text(
                      '터미널: ${airport.terminals.join(", ")}',
                      style: const TextStyle(
                        fontSize: 11,
                        color: AppColors.textMutedLight,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ],
              ),
            ),

            // Country flag/code
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(
                  airport.countryKo,
                  style: const TextStyle(
                    fontSize: 11,
                    color: AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
