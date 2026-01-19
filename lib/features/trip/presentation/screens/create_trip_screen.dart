import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/generated/app_localizations.dart';
import 'package:intl/intl.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'dart:io';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/services/ad_service.dart';
import '../../providers/trip_provider.dart';
import '../../../auth/providers/auth_provider.dart';

/// Provider for managing create trip form state
final createTripStepProvider = StateProvider<int>((ref) => 0);

final createTripFormProvider = StateNotifierProvider<CreateTripFormNotifier, CreateTripFormState>((ref) {
  return CreateTripFormNotifier();
});

class CreateTripFormState {
  final String tripName;
  final String destination;
  final DateTime? startDate;
  final DateTime? endDate;
  final String? coverImagePath;
  final String tripGoal;
  final bool isLoading;
  final String? error;

  CreateTripFormState({
    this.tripName = '',
    this.destination = '',
    this.startDate,
    this.endDate,
    this.coverImagePath,
    this.tripGoal = '',
    this.isLoading = false,
    this.error,
  });

  CreateTripFormState copyWith({
    String? tripName,
    String? destination,
    DateTime? startDate,
    DateTime? endDate,
    String? coverImagePath,
    String? tripGoal,
    bool? isLoading,
    String? error,
  }) {
    return CreateTripFormState(
      tripName: tripName ?? this.tripName,
      destination: destination ?? this.destination,
      startDate: startDate ?? this.startDate,
      endDate: endDate ?? this.endDate,
      coverImagePath: coverImagePath ?? this.coverImagePath,
      tripGoal: tripGoal ?? this.tripGoal,
      isLoading: isLoading ?? this.isLoading,
      error: error,
    );
  }

  bool get isStep1Valid => tripName.isNotEmpty && destination.isNotEmpty && startDate != null && endDate != null;
}

class CreateTripFormNotifier extends StateNotifier<CreateTripFormState> {
  CreateTripFormNotifier() : super(CreateTripFormState());

  void updateTripName(String value) => state = state.copyWith(tripName: value);
  void updateDestination(String value) => state = state.copyWith(destination: value);
  void updateStartDate(DateTime value) => state = state.copyWith(startDate: value);
  void updateEndDate(DateTime value) => state = state.copyWith(endDate: value);
  void updateCoverImage(String? path) => state = state.copyWith(coverImagePath: path);
  void updateTripGoal(String value) => state = state.copyWith(tripGoal: value);
  void setLoading(bool value) => state = state.copyWith(isLoading: value);
  void setError(String? error) => state = state.copyWith(error: error);
  void reset() => state = CreateTripFormState();
}

class CreateTripScreen extends ConsumerStatefulWidget {
  const CreateTripScreen({super.key});

  @override
  ConsumerState<CreateTripScreen> createState() => _CreateTripScreenState();
}

class _CreateTripScreenState extends ConsumerState<CreateTripScreen> {
  late TextEditingController _tripNameController;
  late TextEditingController _destinationController;
  late TextEditingController _tripGoalController;
  final ImagePicker _imagePicker = ImagePicker();

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

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final currentStep = ref.watch(createTripStepProvider);
    final formState = ref.watch(createTripFormProvider);

    return Scaffold(
      backgroundColor: AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: AppColors.backgroundLight,
        elevation: 0,
        leading: TextButton(
          onPressed: formState.isLoading ? null : _handleCancel,
          child: Text(
            l10n.cancel,
            style: TextStyle(
              color: formState.isLoading ? Colors.grey : AppColors.textSecondaryLight,
              fontWeight: FontWeight.w500,
            ),
          ),
        ),
        leadingWidth: 80,
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Header with suitcase icon and title
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 8, 24, 16),
              child: Row(
                children: [
                  Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.primary.withOpacity(0.1),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.luggage_outlined,
                      color: AppColors.primary,
                      size: 24,
                    ),
                  ),
                  const SizedBox(width: 16),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          l10n.letsplanYourJourney,
                          style: const TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: AppColors.textPrimaryLight,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          l10n.hostCanEditLater,
                          style: TextStyle(
                            fontSize: 12,
                            color: AppColors.textSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),

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
                  child: _buildStepContent(currentStep, l10n),
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

            // Next Step button
            Padding(
              padding: const EdgeInsets.all(24),
              child: SizedBox(
                width: double.infinity,
                height: 52,
                child: ElevatedButton(
                  onPressed: formState.isLoading ? null : () => _handleNextStep(currentStep, formState),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.coral,
                    foregroundColor: Colors.white,
                    elevation: 0,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
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
                              currentStep < _totalSteps - 1 ? l10n.nextStep : l10n.createTrip,
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
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildStepContent(int step, AppLocalizations l10n) {
    switch (step) {
      case 0:
        return _buildStep1BasicInfo(l10n);
      case 1:
        return _buildStep2OptionalDetails(l10n);
      case 2:
        return _buildStep3Review(l10n);
      default:
        return _buildStep1BasicInfo(l10n);
    }
  }

  Widget _buildStep1BasicInfo(AppLocalizations l10n) {
    final formState = ref.watch(createTripFormProvider);

    return Column(
      key: const ValueKey('step1'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
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
          onChanged: (value) => ref.read(createTripFormProvider.notifier).updateTripName(value),
          style: const TextStyle(
            color: AppColors.textPrimaryLight,
            fontSize: 15,
          ),
          decoration: InputDecoration(
            hintText: l10n.tripNameHint,
            hintStyle: TextStyle(color: AppColors.textMutedLight),
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
          onChanged: (value) => ref.read(createTripFormProvider.notifier).updateDestination(value),
          style: const TextStyle(
            color: AppColors.textPrimaryLight,
            fontSize: 15,
          ),
          decoration: InputDecoration(
            hintText: l10n.destinationHint,
            hintStyle: TextStyle(color: AppColors.textMutedLight),
            filled: true,
            fillColor: Colors.white,
            prefixIcon: Icon(Icons.location_on_outlined, color: AppColors.textSecondaryLight),
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
                onTap: () => _selectDate(isStartDate: true),
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildDatePicker(
                label: l10n.endDate,
                date: formState.endDate,
                onTap: () => _selectDate(isStartDate: false),
              ),
            ),
          ],
        ),
        const SizedBox(height: 32),
      ],
    );
  }

  Widget _buildStep2OptionalDetails(AppLocalizations l10n) {
    final formState = ref.watch(createTripFormProvider);

    return Column(
      key: const ValueKey('step2'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Section header
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
          onTap: _pickCoverImage,
          child: Container(
            height: 180,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(12),
              border: Border.all(color: Colors.grey[300]!, style: BorderStyle.solid),
            ),
            child: formState.coverImagePath != null
                ? Stack(
                    fit: StackFit.expand,
                    children: [
                      ClipRRect(
                        borderRadius: BorderRadius.circular(11),
                        child: Image.file(
                          File(formState.coverImagePath!),
                          fit: BoxFit.cover,
                        ),
                      ),
                      Positioned(
                        top: 8,
                        right: 8,
                        child: GestureDetector(
                          onTap: () => ref.read(createTripFormProvider.notifier).updateCoverImage(null),
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
                      ),
                    ],
                  )
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.add_photo_alternate_outlined,
                        size: 48,
                        color: AppColors.textMutedLight,
                      ),
                      const SizedBox(height: 8),
                      Text(
                        l10n.tapToUploadCover,
                        style: TextStyle(
                          fontSize: 14,
                          color: AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
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
          onChanged: (value) => ref.read(createTripFormProvider.notifier).updateTripGoal(value),
          maxLines: 4,
          style: const TextStyle(
            color: AppColors.textPrimaryLight,
            fontSize: 15,
          ),
          decoration: InputDecoration(
            hintText: l10n.tripGoalHint,
            hintStyle: TextStyle(color: AppColors.textMutedLight),
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

  Widget _buildStep3Review(AppLocalizations l10n) {
    final formState = ref.watch(createTripFormProvider);
    final dateFormat = DateFormat('MMM d, yyyy');

    return Column(
      key: const ValueKey('step3'),
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Review Your Trip',
          style: const TextStyle(
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
              // Cover image
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Container(
                  height: 160,
                  width: double.infinity,
                  color: AppColors.primary.withOpacity(0.2),
                  child: formState.coverImagePath != null
                      ? Image.file(
                          File(formState.coverImagePath!),
                          fit: BoxFit.cover,
                        )
                      : Center(
                          child: Icon(
                            Icons.landscape_outlined,
                            size: 48,
                            color: AppColors.primary.withOpacity(0.5),
                          ),
                        ),
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
                        Icon(Icons.location_on_outlined, size: 16, color: AppColors.textSecondaryLight),
                        const SizedBox(width: 4),
                        Text(
                          formState.destination.isEmpty ? 'No destination' : formState.destination,
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Icon(Icons.calendar_today_outlined, size: 16, color: AppColors.textSecondaryLight),
                        const SizedBox(width: 4),
                        Text(
                          formState.startDate != null && formState.endDate != null
                              ? '${dateFormat.format(formState.startDate!)} - ${dateFormat.format(formState.endDate!)}'
                              : 'No dates selected',
                          style: TextStyle(
                            fontSize: 14,
                            color: AppColors.textSecondaryLight,
                          ),
                        ),
                      ],
                    ),
                    if (formState.tripGoal.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      const Divider(),
                      const SizedBox(height: 12),
                      Text(
                        formState.tripGoal,
                        style: TextStyle(
                          fontSize: 13,
                          color: AppColors.textSecondaryLight,
                        ),
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
            Icon(Icons.calendar_today_outlined, size: 18, color: AppColors.textSecondaryLight),
            const SizedBox(width: 8),
            Expanded(
              child: Text(
                date != null ? dateFormat.format(date) : label,
                style: TextStyle(
                  fontSize: 14,
                  color: date != null ? AppColors.textPrimaryLight : AppColors.textMutedLight,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _selectDate({required bool isStartDate}) async {
    final formState = ref.read(createTripFormProvider);
    final initialDate = isStartDate
        ? formState.startDate ?? DateTime.now()
        : formState.endDate ?? (formState.startDate?.add(const Duration(days: 1)) ?? DateTime.now().add(const Duration(days: 1)));

    final firstDate = isStartDate ? DateTime.now() : (formState.startDate ?? DateTime.now());

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
        ref.read(createTripFormProvider.notifier).updateStartDate(picked);
        // If end date is before new start date, clear it
        if (formState.endDate != null && formState.endDate!.isBefore(picked)) {
          ref.read(createTripFormProvider.notifier).updateEndDate(picked.add(const Duration(days: 1)));
        }
      } else {
        ref.read(createTripFormProvider.notifier).updateEndDate(picked);
      }
    }
  }

  Future<void> _pickCoverImage() async {
    try {
      final XFile? image = await _imagePicker.pickImage(
        source: ImageSource.gallery,
        maxWidth: 1920,
        maxHeight: 1080,
        imageQuality: 85,
      );
      if (image != null) {
        ref.read(createTripFormProvider.notifier).updateCoverImage(image.path);
      }
    } catch (e) {
      ref.read(createTripFormProvider.notifier).setError('Failed to pick image');
    }
  }

  void _handleCancel() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Discard Trip?'),
        content: const Text('Are you sure you want to discard this trip? All changes will be lost.'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Keep Editing'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ref.read(createTripFormProvider.notifier).reset();
              ref.read(createTripStepProvider.notifier).state = 0;
              context.pop();
            },
            child: const Text('Discard', style: TextStyle(color: AppColors.error)),
          ),
        ],
      ),
    );
  }

  void _handleNextStep(int currentStep, CreateTripFormState formState) {
    // Clear any previous error
    ref.read(createTripFormProvider.notifier).setError(null);

    if (currentStep == 0 && !formState.isStep1Valid) {
      ref.read(createTripFormProvider.notifier).setError('Please fill in all required fields');
      return;
    }

    if (currentStep < _totalSteps - 1) {
      ref.read(createTripStepProvider.notifier).state = currentStep + 1;
    } else {
      _createTrip();
    }
  }

  Future<void> _createTrip() async {
    final formState = ref.read(createTripFormProvider);
    final currentUser = await ref.read(currentUserProvider.future);

    if (currentUser == null) {
      ref.read(createTripFormProvider.notifier).setError('User not authenticated');
      return;
    }

    ref.read(createTripFormProvider.notifier).setLoading(true);

    try {
      final tripService = ref.read(tripServiceProvider);

      // Upload cover image to Firebase Storage
      String? coverImageUrl;
      if (formState.coverImagePath != null) {
        final imageFile = File(formState.coverImagePath!);
        final fileName = 'trip_cover_${DateTime.now().millisecondsSinceEpoch}.jpg';
        final storageRef = FirebaseStorage.instance
            .ref()
            .child('trip_covers')
            .child(fileName);

        await storageRef.putFile(imageFile);
        coverImageUrl = await storageRef.getDownloadURL();
      }

      await tripService.createTrip(
        name: formState.tripName,
        description: formState.tripGoal.isNotEmpty ? formState.tripGoal : null,
        coverImageUrl: coverImageUrl,
        destination: formState.destination,
        startDate: formState.startDate!,
        endDate: formState.endDate!,
        hostId: currentUser.id,
        hostName: currentUser.displayName,
        hostPhotoUrl: currentUser.photoUrl,
      );

      if (mounted) {
        // Show interstitial ad after successful trip creation
        await AdService().showInterstitialAd();

        ref.read(createTripFormProvider.notifier).reset();
        ref.read(createTripStepProvider.notifier).state = 0;
        context.pop();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Trip created successfully!'),
            backgroundColor: AppColors.success,
          ),
        );
      }
    } catch (e) {
      ref.read(createTripFormProvider.notifier).setError('Failed to create trip: ${e.toString()}');
    } finally {
      ref.read(createTripFormProvider.notifier).setLoading(false);
    }
  }
}
