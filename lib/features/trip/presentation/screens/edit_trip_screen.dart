import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/generated/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import '../../../../core/theme/app_colors.dart';
import '../../../../data/models/trip_model.dart';
import '../../providers/trip_provider.dart';

/// Provider for managing edit trip form state
final editTripStepProvider = StateProvider.autoDispose<int>((ref) => 0);

final editTripFormProvider = StateNotifierProvider.autoDispose
    .family<EditTripFormNotifier, EditTripFormState, TripModel?>((ref, trip) {
  return EditTripFormNotifier(trip);
});

class EditTripFormState {
  final String tripName;
  final String destination;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? coverImagePath;
  final String? existingCoverImageUrl;
  final String tripGoal;
  final List<String> tags;
  final bool isLoading;
  final String? error;
  final bool hasChanges;

  EditTripFormState({
    this.tripName = '',
    this.destination = '',
    this.startDate,
    this.endDate,
    this.coverImagePath,
    this.existingCoverImageUrl,
    this.tripGoal = '',
    this.tags = const [],
    this.isLoading = false,
    this.error,
    this.hasChanges = false,
  });

  EditTripFormState copyWith({
    String? tripName,
    String? destination,
    DateTime? startDate,
    DateTime? endDate,
    String? coverImagePath,
    String? existingCoverImageUrl,
    String? tripGoal,
    List<String>? tags,
    bool? isLoading,
    String? error,
    bool? hasChanges,
  }) {
    return EditTripFormState(
      tripName: tripName ?? this.tripName,
      destination: destination ?? this.destination,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      coverImagePath: coverImagePath ?? this.coverImagePath,
      existingCoverImageUrl: existingCoverImageUrl ?? this.existingCoverImageUrl,
      tripGoal: tripGoal ?? this.tripGoal,
      tags: tags ?? this.tags,
      isLoading: isLoading ?? this.isLoading,
      error: error,
      hasChanges: hasChanges ?? true,
    );
  }

  bool get isValid => tripName.isNotEmpty && destination.isNotEmpty && startDate != null && endDate != null;
}

class EditTripFormNotifier extends StateNotifier<EditTripFormState> {
  EditTripFormNotifier(TripModel? trip)
      : super(EditTripFormState(
          tripName: trip?.name ?? '',
          destination: trip?.destination ?? '',
          startDate: trip?.startDate,
          endDate: trip?.endDate,
          existingCoverImageUrl: trip?.coverImageUrl,
          tripGoal: trip?.description ?? '',
          tags: trip?.tags ?? [],
          hasChanges: false,
        ));

  void updateTripName(String value) => state = state.copyWith(tripName: value);
  void updateDestination(String value) => state = state.copyWith(destination: value);
  void updateStartDate(DateTime value) => state = state.copyWith(startDate: value);
  void updateEndDate(DateTime value) => state = state.copyWith(endDate: value);
  void updateCoverImage(String? path) => state = state.copyWith(coverImagePath: path);
  void updateTripGoal(String value) => state = state.copyWith(tripGoal: value);
  void updateTags(List<String> tags) => state = state.copyWith(tags: tags);
  void setLoading(bool value) => state = state.copyWith(isLoading: value, hasChanges: state.hasChanges);
  void setError(String? error) => state = state.copyWith(error: error, hasChanges: state.hasChanges);
}

class EditTripScreen extends ConsumerStatefulWidget {
  final String tripId;

  const EditTripScreen({
    super.key,
    required this.tripId,
  });

  @override
  ConsumerState<EditTripScreen> createState() => _EditTripScreenState();
}

class _EditTripScreenState extends ConsumerState<EditTripScreen> {
  late TextEditingController _tripNameController;
  late TextEditingController _destinationController;
  late TextEditingController _tripGoalController;
  final ImagePicker _imagePicker = ImagePicker();
  bool _controllersInitialized = false;

  static const int _totalSteps = 3;

  @override
  void initState() {
    super.initState();
    _tripNameController = TextEditingController();
    _destinationController = TextEditingController();
    _tripGoalController = TextEditingController();
  }

  @override
  void dispose() {
    _tripNameController.dispose();
    _destinationController.dispose();
    _tripGoalController.dispose();
    super.dispose();
  }

  void _initializeControllers(TripModel trip) {
    if (!_controllersInitialized) {
      _tripNameController.text = trip.name;
      _destinationController.text = trip.destination;
      _tripGoalController.text = trip.description ?? '';
      _controllersInitialized = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final tripAsync = ref.watch(tripProvider(widget.tripId));

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
          backgroundColor: AppColors.backgroundLight,
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
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 8),
              Text(
                error.toString(),
                style: TextStyle(color: Colors.grey[600]),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () => ref.refresh(tripProvider(widget.tripId)),
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
              backgroundColor: AppColors.backgroundLight,
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
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        }

        _initializeControllers(trip);
        return _buildEditForm(context, l10n, trip);
      },
    );
  }

  Widget _buildEditForm(BuildContext context, AppLocalizations l10n, TripModel trip) {
    final currentStep = ref.watch(editTripStepProvider);
    final formState = ref.watch(editTripFormProvider(trip));

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        elevation: 0,
        leading: TextButton(
          onPressed: formState.isLoading ? null : () => _handleCancel(formState),
          child: Text(
            l10n.cancel,
            style: TextStyle(
              color: formState.isLoading ? Colors.grey : AppColors.textSecondaryLight,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leadingWidth: 80,
        title: Text(
          l10n.edit,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimaryLight,
          ),
        ),
        centerTitle: true,
        actions: currentStep < _totalSteps - 1
            ? [
                TextButton(
                  onPressed: formState.isLoading || !formState.hasChanges
                      ? null
                      : () => _handleSave(trip, formState),
                  child: Text(
                    l10n.save,
                    style: TextStyle(
                      color: formState.isLoading || !formState.hasChanges
                          ? Colors.grey
                          : AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ]
            : null,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Step indicator dots
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(_totalSteps, (index) {
                  return Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: index == currentStep ? 24 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                      color: index <= currentStep ? AppColors.primary : Colors.grey[300],
                      borderRadius: BorderRadius.circular(4),
                    ),
                  );
                }),
              ),
            ),

            // Form content
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: AnimatedSwitcher(
                  duration: const Duration(milliseconds: 300),
                  child: _buildStepContent(currentStep, l10n, trip),
                ),
              ),
            ),

            // Error message
            if (formState.error != null)
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24),
                child: Container(
                  padding: const EdgeInsets.all(12),
                  decoration: BoxDecoration(
                    color: AppColors.errorLight,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Row(
                    children: [
                      const Icon(Icons.error_outline, color: AppColors.error, size: 20),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Text(
                          formState.error!,
                          style: const TextStyle(color: AppColors.error, fontSize: 13),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

            // Navigation buttons
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                children: [
                  if (currentStep > 0)
                    Expanded(
                      child: OutlinedButton(
                        onPressed: formState.isLoading
                            ? null
                            : () => ref.read(editTripStepProvider.notifier).state = currentStep - 1,
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          side: const BorderSide(color: AppColors.primary),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          padding: const EdgeInsets.symmetric(vertical: 14),
                        ),
                        child: Text(l10n.back),
                      ),
                    ),
                  if (currentStep > 0) const SizedBox(width: 12),
                  Expanded(
                    flex: currentStep > 0 ? 2 : 1,
                    child: ElevatedButton(
                      onPressed: formState.isLoading
                          ? null
                          : () => _handleNextStep(currentStep, formState, trip),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.coral,
                        foregroundColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        padding: const EdgeInsets.symmetric(vertical: 14),
                        disabledBackgroundColor: Colors.grey[300],
                      ),
                      child: formState.isLoading
                          ? const SizedBox(
                              width: 24,
                              height: 24,
                              child: CircularProgressIndicator(
                                strokeWidth: 2,
                                valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                              ),
                            )
                          : Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  currentStep < _totalSteps - 1 ? l10n.nextStep : l10n.save,
                                  style: const TextStyle(
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                const SizedBox(width: 8),
                                Icon(
                                  currentStep < _totalSteps - 1 ? Icons.arrow_forward : Icons.check,
                                  size: 20,
                                ),
                              ],
                            ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent(int step, AppLocalizations l10n, TripModel trip) {
    switch (step) {
      case 0:
        return _buildStep1BasicInfo(l10n, trip);
      case 1:
        return _buildStep2OptionalDetails(l10n, trip);
      case 2:
        return _buildStep3Review(l10n, trip);
      default:
        return _buildStep1BasicInfo(l10n, trip);
    }
  }

  Widget _buildStep1BasicInfo(AppLocalizations l10n, TripModel trip) {
    final formState = ref.watch(editTripFormProvider(trip));

    return Column(
      key: const ValueKey('step1'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              l10n.basicInfo,
              style: const TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: AppColors.error.withOpacity(0.1),
                borderRadius: BorderRadius.circular(4),
              ),
              child: Text(
                l10n.required,
                style: const TextStyle(
                  fontSize: 10,
                  fontWeight: FontWeight.w600,
                  color: AppColors.error,
                ),
              ),
            ),
          ],
        ),
        const SizedBox(height: 20),

        // Trip Name
        Text(
          l10n.tripName,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _tripNameController,
          onChanged: (value) => ref.read(editTripFormProvider(trip).notifier).updateTripName(value),
          decoration: InputDecoration(
            hintText: l10n.tripNameHint,
            hintStyle: TextStyle(color: Colors.grey[400]),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
        const SizedBox(height: 20),

        // Destination
        Text(
          l10n.destination,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _destinationController,
          onChanged: (value) => ref.read(editTripFormProvider(trip).notifier).updateDestination(value),
          decoration: InputDecoration(
            hintText: l10n.destinationHint,
            hintStyle: TextStyle(color: Colors.grey[400]),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(Icons.location_on_outlined, color: Colors.grey[500]),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
          ),
        ),
        const SizedBox(height: 20),

        // Dates
        Text(
          l10n.dates,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 8),
        Row(
          children: [
            Expanded(
              child: _buildDatePicker(
                label: l10n.startDate,
                date: formState.startDate,
                onTap: () => _selectDate(isStartDate: true, trip: trip),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildDatePicker(
                label: l10n.endDate,
                date: formState.endDate,
                onTap: () => _selectDate(isStartDate: false, trip: trip),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildStep2OptionalDetails(AppLocalizations l10n, TripModel trip) {
    final formState = ref.watch(editTripFormProvider(trip));

    return Column(
      key: const ValueKey('step2'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          l10n.optionalDetails,
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 20),

        // Cover Photo
        Text(
          l10n.coverPhoto,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () => _pickCoverImage(trip),
          child: Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!, style: BorderStyle.solid),
            ),
            child: _buildCoverImageContent(formState),
          ),
        ),
        const SizedBox(height: 24),

        // Trip Goal/Memo
        Text(
          l10n.tripGoalMemo,
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w500,
            color: AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: _tripGoalController,
          onChanged: (value) => ref.read(editTripFormProvider(trip).notifier).updateTripGoal(value),
          maxLines: 4,
          decoration: InputDecoration(
            hintText: l10n.tripGoalHint,
            hintStyle: TextStyle(color: Colors.grey[400]),
            filled: true,
            fillColor: Colors.white,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: BorderSide(color: Colors.grey[300]!),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(12),
              borderSide: const BorderSide(color: AppColors.primary, width: 2),
            ),
            contentPadding: const EdgeInsets.all(16),
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildCoverImageContent(EditTripFormState formState) {
    if (formState.coverImagePath != null) {
      return Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: Image.file(
              File(formState.coverImagePath!),
              fit: BoxFit.cover,
            ),
          ),
          _buildRemoveButton(() {
            // This will be handled in the parent
          }),
        ],
      );
    } else if (formState.existingCoverImageUrl != null) {
      return Stack(
        fit: StackFit.expand,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(11),
            child: Image.network(
              formState.existingCoverImageUrl!,
              fit: BoxFit.cover,
              loadingBuilder: (context, child, loadingProgress) {
                if (loadingProgress == null) return child;
                return Center(
                  child: CircularProgressIndicator(
                    value: loadingProgress.expectedTotalBytes != null
                        ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        : null,
                    color: AppColors.primary,
                  ),
                );
              },
              errorBuilder: (context, error, stackTrace) {
                return _buildPlaceholder();
              },
            ),
          ),
        ],
      );
    } else {
      return _buildPlaceholder();
    }
  }

  Widget _buildPlaceholder() {
    final l10n = AppLocalizations.of(context)!;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(
          Icons.add_photo_alternate_outlined,
          size: 48,
          color: Colors.grey[400],
        ),
        const SizedBox(height: 8),
        Text(
          l10n.tapToUploadCover,
          style: TextStyle(
            fontSize: 14,
            color: Colors.grey[500],
          ),
        ),
      ],
    );
  }

  Widget _buildRemoveButton(VoidCallback onTap) {
    return Positioned(
      top: 8,
      right: 8,
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
            color: Colors.black.withOpacity(0.5),
            shape: BoxShape.circle,
          ),
          child: const Icon(
            Icons.close,
            color: Colors.white,
            size: 16,
          ),
        ),
      ),
    );
  }

  Widget _buildStep3Review(AppLocalizations l10n, TripModel trip) {
    final formState = ref.watch(editTripFormProvider(trip));
    final dateFormat = DateFormat('MMM d, yyyy');

    return Column(
      key: const ValueKey('step3'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Review Changes',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w600,
            color: AppColors.textPrimaryLight,
          ),
        ),
        const SizedBox(height: 20),

        // Preview card
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(16),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.08),
                blurRadius: 16,
                offset: const Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Container(
                  height: 160,
                  width: double.infinity,
                  color: AppColors.primary.withOpacity(0.2),
                  child: _buildPreviewImage(formState),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      formState.tripName.isEmpty ? 'Untitled Trip' : formState.tripName,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.textPrimaryLight,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.location_on_outlined, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          formState.destination.isEmpty ? 'No destination' : formState.destination,
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.calendar_today_outlined, size: 16, color: Colors.grey[600]),
                        const SizedBox(width: 4),
                        Text(
                          formState.startDate != null && formState.endDate != null
                              ? '${dateFormat.format(formState.startDate!)} - ${dateFormat.format(formState.endDate!)}'
                              : 'No dates selected',
                          style: TextStyle(fontSize: 14, color: Colors.grey[600]),
                        ),
                      ],
                    ),
                    if (formState.tripGoal.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      const Divider(),
                      const SizedBox(height: 12),
                      Text(
                        formState.tripGoal,
                        style: TextStyle(fontSize: 13, color: Colors.grey[700]),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ],
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildPreviewImage(EditTripFormState formState) {
    if (formState.coverImagePath != null) {
      return Image.file(File(formState.coverImagePath!), fit: BoxFit.cover);
    } else if (formState.existingCoverImageUrl != null) {
      return Image.network(
        formState.existingCoverImageUrl!,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return Center(
            child: Icon(
              Icons.landscape_outlined,
              size: 48,
              color: AppColors.primary.withOpacity(0.5),
            ),
          );
        },
      );
    } else {
      return Center(
        child: Icon(
          Icons.landscape_outlined,
          size: 48,
          color: AppColors.primary.withOpacity(0.5),
        ),
      );
    }
  }

  Widget _buildDatePicker({
    required String label,
    required DateTime? date,
    required VoidCallback onTap,
  }) {
    final dateFormat = DateFormat('MMM d, yyyy');
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
          border: Border.all(color: Colors.grey[300]!),
        ),
        child: Row(
          children: [
            Icon(Icons.calendar_today_outlined, size: 18, color: Colors.grey[500]),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                date != null ? dateFormat.format(date) : label,
                style: TextStyle(
                  fontSize: 14,
                  color: date != null ? AppColors.textPrimaryLight : Colors.grey[400],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate({required bool isStartDate, required TripModel trip}) async {
    final formState = ref.read(editTripFormProvider(trip));
    final initialDate = isStartDate
        ? formState.startDate ?? DateTime.now()
        : formState.endDate ?? (formState.startDate?.add(const Duration(days: 1)) ?? DateTime.now().add(const Duration(days: 1)));

    final firstDate = isStartDate ? DateTime(2020) : (formState.startDate ?? DateTime(2020));

    final picked = await showDatePicker(
      context: context,
      initialDate: initialDate.isBefore(firstDate) ? firstDate : initialDate,
      firstDate: firstDate,
      lastDate: DateTime.now().add(const Duration(days: 365 * 2)),
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: AppColors.primary,
              onPrimary: Colors.white,
              surface: Colors.white,
              onSurface: AppColors.textPrimaryLight,
            ),
          ),
          child: child!,
        );
      },
    );

    if (picked != null) {
      if (isStartDate) {
        ref.read(editTripFormProvider(trip).notifier).updateStartDate(picked);
        if (formState.endDate != null && formState.endDate!.isBefore(picked)) {
          ref.read(editTripFormProvider(trip).notifier).updateEndDate(picked.add(const Duration(days: 1)));
        }
      } else {
        ref.read(editTripFormProvider(trip).notifier).updateEndDate(picked);
      }
    }
  }

  Future<void> _pickCoverImage(TripModel trip) async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );
      if (image != null) {
        ref.read(editTripFormProvider(trip).notifier).updateCoverImage(image.path);
      }
    } catch (e) {
      ref.read(editTripFormProvider(trip).notifier).setError('Failed to pick image');
    }
  }

  void _handleCancel(EditTripFormState formState) {
    if (formState.hasChanges) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Discard Changes?'),
          content: const Text('Are you sure you want to discard your changes?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Keep Editing'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                context.pop();
              },
              child: const Text('Discard', style: TextStyle(color: AppColors.error)),
            ),
          ],
        ),
      );
    } else {
      context.pop();
    }
  }

  Future<void> _handleSave(TripModel trip, EditTripFormState formState) async {
    if (!formState.isValid) {
      ref.read(editTripFormProvider(trip).notifier).setError('Please fill in all required fields');
      return;
    }
    await _updateTrip(trip, formState);
  }

  void _handleNextStep(int currentStep, EditTripFormState formState, TripModel trip) {
    ref.read(editTripFormProvider(trip).notifier).setError(null);

    if (currentStep == 0 && !formState.isValid) {
      ref.read(editTripFormProvider(trip).notifier).setError('Please fill in all required fields');
      return;
    }

    if (currentStep < _totalSteps - 1) {
      ref.read(editTripStepProvider.notifier).state = currentStep + 1;
    } else {
      _updateTrip(trip, formState);
    }
  }

  Future<void> _updateTrip(TripModel trip, EditTripFormState formState) async {
    ref.read(editTripFormProvider(trip).notifier).setLoading(true);

    try {
      final tripService = ref.read(tripServiceProvider);

      // Upload new cover image if changed
      String? coverImageUrl = formState.existingCoverImageUrl;
      print('[EditTrip] existingCoverImageUrl: $coverImageUrl');
      print('[EditTrip] coverImagePath: ${formState.coverImagePath}');

      if (formState.coverImagePath != null) {
        final imageFile = File(formState.coverImagePath!);
        final fileName = 'trip_cover_${trip.id}_${DateTime.now().millisecondsSinceEpoch}.jpg';
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('trip_covers')
            .child(fileName);

        print('[EditTrip] Uploading image to: ${storageRef.fullPath}');
        await storageRef.putFile(imageFile);
        coverImageUrl = await storageRef.getDownloadURL();
        print('[EditTrip] Upload success! URL: $coverImageUrl');
      }

      final updates = <String, dynamic>{
        'name': formState.tripName,
        'destination': formState.destination,
        'startDate': formState.startDate,
        'endDate': formState.endDate,
        'description': formState.tripGoal.isNotEmpty ? formState.tripGoal : null,
      };

      if (coverImageUrl != formState.existingCoverImageUrl) {
        updates['coverImageUrl'] = coverImageUrl;
        print('[EditTrip] Adding coverImageUrl to updates');
      }

      print('[EditTrip] Updates: $updates');
      await tripService.updateTrip(trip.id, updates);
      print('[EditTrip] Trip updated successfully');

      if (mounted) {
        // Invalidate providers to refresh data
        ref.invalidate(userTripsProvider);
        ref.invalidate(tripProvider(trip.id));

        context.pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Trip updated successfully!'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      ref.read(editTripFormProvider(trip).notifier).setError('Failed to update trip: ${e.toString()}');
    } finally {
      ref.read(editTripFormProvider(trip).notifier).setLoading(false);
    }
  }
}
