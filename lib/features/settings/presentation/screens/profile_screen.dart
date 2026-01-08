import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/generated/app_localizations.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/models/user_model.dart';
import '../../../../data/services/user_service.dart';
import '../../../auth/providers/auth_provider.dart';

/// Provider for profile editing state
final profileEditingProvider = StateNotifierProvider<ProfileEditingNotifier, ProfileEditingState>((ref) {
  final userService = ref.read(userServiceProvider);
  return ProfileEditingNotifier(userService);
});

class ProfileEditingState {
  final bool isLoading;
  final String? error;
  final File? selectedImage;

  const ProfileEditingState({
    this.isLoading = false,
    this.error,
    this.selectedImage,
  });

  ProfileEditingState copyWith({
    bool? isLoading,
    String? error,
    File? selectedImage,
  }) {
    return ProfileEditingState(
      isLoading: isLoading ?? this.isLoading,
      error: error,
      selectedImage: selectedImage ?? this.selectedImage,
    );
  }
}

class ProfileEditingNotifier extends StateNotifier<ProfileEditingState> {
  final UserService _userService;

  ProfileEditingNotifier(this._userService) : super(const ProfileEditingState());

  void setSelectedImage(File image) {
    state = state.copyWith(selectedImage: image);
  }

  void clearSelectedImage() {
    state = const ProfileEditingState();
  }

  Future<bool> updateProfile({
    required String userId,
    required String displayName,
    String? phoneNumber,
    File? imageFile,
  }) async {
    state = state.copyWith(isLoading: true, error: null);

    try {
      await _userService.updateUserProfile(
        userId: userId,
        displayName: displayName,
        phoneNumber: phoneNumber,
        imageFile: imageFile,
      );
      state = state.copyWith(isLoading: false);
      return true;
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      return false;
    }
  }
}

class ProfileScreen extends ConsumerStatefulWidget {
  const ProfileScreen({super.key});

  @override
  ConsumerState<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends ConsumerState<ProfileScreen> {
  final _formKey = GlobalKey<FormState>();
  final _displayNameController = TextEditingController();
  final _phoneNumberController = TextEditingController();
  final _imagePicker = ImagePicker();
  File? _selectedImage;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _initializeFormFields();
    });
  }

  void _initializeFormFields() {
    final user = ref.read(currentUserProvider).valueOrNull;
    if (user != null) {
      _displayNameController.text = user.displayName;
      _phoneNumberController.text = user.phoneNumber ?? '';
    }
  }

  @override
  void dispose() {
    _displayNameController.dispose();
    _phoneNumberController.dispose();
    super.dispose();
  }

  Future<void> _pickImage(ImageSource source) async {
    try {
      final pickedFile = await _imagePicker.pickImage(
        source: source,
        maxWidth: 512,
        maxHeight: 512,
        imageQuality: 80,
      );

      if (pickedFile != null) {
        setState(() {
          _selectedImage = File(pickedFile.path);
        });
      }
    } catch (e) {
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to pick image: $e')),
        );
      }
    }
  }

  void _showImagePickerBottomSheet(bool isDarkMode) {
    showModalBottomSheet(
      context: context,
      backgroundColor: isDarkMode ? AppColors.cardDark : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: isDarkMode ? AppColors.surfaceLighter : Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              const SizedBox(height: 24),
              ListTile(
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.primary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.camera_alt, color: AppColors.primary),
                ),
                title: Text(
                  'Take Photo',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.camera);
                },
              ),
              ListTile(
                leading: Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.secondary.withValues(alpha: 0.1),
                    shape: BoxShape.circle,
                  ),
                  child: const Icon(Icons.photo_library, color: AppColors.secondary),
                ),
                title: Text(
                  'Choose from Gallery',
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),
                onTap: () {
                  Navigator.pop(context);
                  _pickImage(ImageSource.gallery);
                },
              ),
              if (_selectedImage != null)
                ListTile(
                  leading: Container(
                    width: 48,
                    height: 48,
                    decoration: BoxDecoration(
                      color: AppColors.error.withValues(alpha: 0.1),
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(Icons.delete, color: AppColors.error),
                  ),
                  title: Text(
                    'Remove Photo',
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppColors.error,
                    ),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                    setState(() {
                      _selectedImage = null;
                    });
                  },
                ),
              const SizedBox(height: 8),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _saveProfile() async {
    if (!_formKey.currentState!.validate()) return;

    final user = ref.read(currentUserProvider).valueOrNull;
    if (user == null) return;

    final success = await ref.read(profileEditingProvider.notifier).updateProfile(
      userId: user.id,
      displayName: _displayNameController.text.trim(),
      phoneNumber: _phoneNumberController.text.trim().isNotEmpty
          ? _phoneNumberController.text.trim()
          : null,
      imageFile: _selectedImage,
    );

    if (mounted) {
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Profile updated successfully')),
        );
        context.pop();
      } else {
        final error = ref.read(profileEditingProvider).error;
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text(error ?? 'Failed to update profile')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final currentUser = ref.watch(currentUserProvider);
    final editingState = ref.watch(profileEditingProvider);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.backgroundDark : AppColors.backgroundLight,
      appBar: AppBar(
        backgroundColor: isDarkMode ? AppColors.backgroundDark : AppColors.backgroundLight,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
          onPressed: () => context.pop(),
        ),
        title: Text(
          l10n.profile,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        centerTitle: true,
        actions: [
          TextButton(
            onPressed: editingState.isLoading ? null : _saveProfile,
            child: editingState.isLoading
                ? const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(strokeWidth: 2),
                  )
                : Text(
                    l10n.save,
                    style: TextStyle(
                      color: AppColors.primary,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
          ),
        ],
      ),
      body: currentUser.when(
        data: (user) => user != null
            ? _buildProfileForm(user, l10n, isDarkMode)
            : const Center(child: Text('User not found')),
        loading: () => const Center(
          child: CircularProgressIndicator(color: AppColors.primary),
        ),
        error: (error, _) => Center(
          child: Text('Error: $error'),
        ),
      ),
    );
  }

  Widget _buildProfileForm(UserModel user, AppLocalizations l10n, bool isDarkMode) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 16),

            // Profile Photo
            GestureDetector(
              onTap: () => _showImagePickerBottomSheet(isDarkMode),
              child: Stack(
                children: [
                  CircleAvatar(
                    radius: 56,
                    backgroundColor: isDarkMode ? AppColors.surfaceLighter : Colors.grey[200],
                    backgroundImage: _selectedImage != null
                        ? FileImage(_selectedImage!)
                        : (user.photoUrl != null ? NetworkImage(user.photoUrl!) : null),
                    child: _selectedImage == null && user.photoUrl == null
                        ? Text(
                            user.displayName.isNotEmpty
                                ? user.displayName[0].toUpperCase()
                                : '?',
                            style: TextStyle(
                              fontSize: 40,
                              fontWeight: FontWeight.bold,
                              color: AppColors.primary,
                            ),
                          )
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      width: 36,
                      height: 36,
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: isDarkMode ? AppColors.backgroundDark : Colors.white,
                          width: 3,
                        ),
                      ),
                      child: const Icon(
                        Icons.camera_alt,
                        size: 18,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 12),

            // Change Photo Text
            TextButton(
              onPressed: () => _showImagePickerBottomSheet(isDarkMode),
              child: Text(
                'Change Photo',
                style: TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),

            const SizedBox(height: 32),

            // Display Name Field
            _buildInputField(
              controller: _displayNameController,
              label: 'Display Name',
              hint: 'Enter your display name',
              isDarkMode: isDarkMode,
              validator: (value) {
                if (value == null || value.trim().isEmpty) {
                  return 'Display name is required';
                }
                if (value.trim().length < 2) {
                  return 'Display name must be at least 2 characters';
                }
                return null;
              },
            ),

            const SizedBox(height: 16),

            // Phone Number Field
            _buildInputField(
              controller: _phoneNumberController,
              label: l10n.phone,
              hint: 'Enter your phone number',
              isDarkMode: isDarkMode,
              keyboardType: TextInputType.phone,
            ),

            const SizedBox(height: 16),

            // Email (Read-only)
            _buildReadOnlyField(
              label: l10n.email,
              value: user.email,
              isDarkMode: isDarkMode,
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildInputField({
    required TextEditingController controller,
    required String label,
    required String hint,
    required bool isDarkMode,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: keyboardType,
          validator: validator,
          style: TextStyle(
            fontSize: 16,
            color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
          decoration: InputDecoration(
            hintText: hint,
            hintStyle: TextStyle(
              color: isDarkMode ? AppColors.textMutedDark : AppColors.textMutedLight,
            ),
            filled: true,
            fillColor: isDarkMode ? AppColors.cardDark : Colors.white,
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              borderSide: BorderSide.none,
            ),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              borderSide: BorderSide(
                color: isDarkMode ? AppColors.dividerDark : AppColors.divider,
              ),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              borderSide: BorderSide(
                color: AppColors.primary,
                width: 2,
              ),
            ),
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              borderSide: BorderSide(
                color: AppColors.error,
              ),
            ),
            focusedErrorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              borderSide: BorderSide(
                color: AppColors.error,
                width: 2,
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildReadOnlyField({
    required String label,
    required String value,
    required bool isDarkMode,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.w600,
            color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          decoration: BoxDecoration(
            color: isDarkMode ? AppColors.surfaceDark : Colors.grey[100],
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            border: Border.all(
              color: isDarkMode ? AppColors.dividerDark : AppColors.divider,
            ),
          ),
          child: Row(
            children: [
              Expanded(
                child: Text(
                  value,
                  style: TextStyle(
                    fontSize: 16,
                    color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
              ),
              Icon(
                Icons.lock_outline,
                size: 18,
                color: isDarkMode ? AppColors.textMutedDark : AppColors.textMutedLight,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
