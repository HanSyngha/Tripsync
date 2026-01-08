import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/providers/theme_provider.dart';
import '../../../../data/models/user_model.dart';
import '../../../auth/providers/auth_provider.dart';

class SettingsScreen extends ConsumerStatefulWidget {
  const SettingsScreen({super.key});

  @override
  ConsumerState<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends ConsumerState<SettingsScreen> {
  double _fontSizeValue = 1.0;

  @override
  Widget build(BuildContext context) {
    final l10n = AppLocalizations.of(context)!;
    final currentUser = ref.watch(currentUserStreamProvider);
    final themeMode = ref.watch(themeModeProvider);
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
          l10n.settings,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Card
            currentUser.when(
              data: (user) => user != null
                  ? _buildProfileCard(user, l10n, isDarkMode)
                  : const SizedBox.shrink(),
              loading: () => _buildProfileCardSkeleton(isDarkMode),
              error: (_, __) => const SizedBox.shrink(),
            ),

            const SizedBox(height: 24),

            // Account & Permissions Section
            _buildSectionHeader(l10n.accountAndPermissions, isDarkMode),
            const SizedBox(height: 8),
            _buildSettingsCard(
              isDarkMode: isDarkMode,
              children: [
                _buildArrowItem(
                  icon: Icons.visibility_outlined,
                  title: l10n.profileVisibility,
                  isDarkMode: isDarkMode,
                  onTap: () {
                    // Navigate to profile visibility settings
                  },
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Display Settings Section
            _buildSectionHeader(l10n.displaySettings, isDarkMode),
            const SizedBox(height: 8),
            _buildSettingsCard(
              isDarkMode: isDarkMode,
              children: [
                _buildToggleItem(
                  icon: Icons.dark_mode_outlined,
                  title: l10n.darkMode,
                  value: themeMode == ThemeMode.dark,
                  isDarkMode: isDarkMode,
                  onChanged: (value) {
                    ref.read(themeModeProvider.notifier).setThemeMode(
                      value ? ThemeMode.dark : ThemeMode.light,
                    );
                  },
                ),
                _buildDivider(isDarkMode),
                _buildFontSizeSlider(l10n, isDarkMode),
              ],
            ),

            const SizedBox(height: 24),

            // Notification Settings Section
            _buildSectionHeader(l10n.notificationSettings, isDarkMode),
            const SizedBox(height: 8),
            _buildSettingsCard(
              isDarkMode: isDarkMode,
              children: [
                _buildToggleItem(
                  icon: Icons.calendar_today_outlined,
                  title: l10n.tripScheduleNotifications,
                  subtitle: l10n.importantChangesPush,
                  value: currentUser.valueOrNull?.settings.tripScheduleNotifications ?? true,
                  isDarkMode: isDarkMode,
                  onChanged: (value) {
                    // Update user settings
                  },
                ),
                _buildDivider(isDarkMode),
                _buildToggleItem(
                  icon: Icons.chat_bubble_outline,
                  title: l10n.newMessageNotifications,
                  value: currentUser.valueOrNull?.settings.newMessageNotifications ?? true,
                  isDarkMode: isDarkMode,
                  onChanged: (value) {
                    // Update user settings
                  },
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Help & Support
            _buildSettingsCard(
              isDarkMode: isDarkMode,
              children: [
                _buildArrowItem(
                  icon: Icons.help_outline,
                  title: l10n.helpAndSupport,
                  isDarkMode: isDarkMode,
                  trailing: Icon(
                    Icons.open_in_new,
                    size: 18,
                    color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                  onTap: () {
                    // Open help & support URL
                  },
                ),
              ],
            ),

            const SizedBox(height: 16),

            // App Version
            _buildSettingsCard(
              isDarkMode: isDarkMode,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  child: Row(
                    children: [
                      Icon(
                        Icons.info_outline,
                        size: 22,
                        color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                      const SizedBox(width: 12),
                      Text(
                        l10n.appVersion,
                        style: TextStyle(
                          fontSize: 15,
                          color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                        ),
                      ),
                      const Spacer(),
                      Text(
                        'v2.4.0',
                        style: TextStyle(
                          fontSize: 15,
                          color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Account Section
            _buildSectionHeader(l10n.account, isDarkMode),
            const SizedBox(height: 8),
            _buildSettingsCard(
              isDarkMode: isDarkMode,
              children: [
                _buildArrowItem(
                  icon: Icons.delete_outline,
                  title: l10n.deleteAccount,
                  isDarkMode: isDarkMode,
                  trailing: Icon(
                    Icons.chevron_right,
                    size: 22,
                    color: AppColors.error,
                  ),
                  onTap: () => _showDeleteAccountDialog(context, l10n, isDarkMode),
                ),
              ],
            ),

            const SizedBox(height: 24),

            // Logout Button
            SizedBox(
              width: double.infinity,
              child: TextButton(
                onPressed: () async {
                  final confirmed = await _showLogoutConfirmation(context, l10n, isDarkMode);
                  if (confirmed == true) {
                    await ref.read(authNotifierProvider.notifier).signOut();
                    if (mounted) context.go('/login');
                  }
                },
                style: TextButton.styleFrom(
                  padding: const EdgeInsets.symmetric(vertical: 16),
                ),
                child: Text(
                  l10n.logout,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppColors.coral,
                  ),
                ),
              ),
            ),

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  Widget _buildProfileCard(UserModel user, AppLocalizations l10n, bool isDarkMode) {
    // Determine role badge
    final isHost = true; // This should come from the user's trips/role
    final roleText = isHost ? l10n.host : l10n.participant;
    final roleColor = isHost ? AppColors.primary : AppColors.coral;

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          CircleAvatar(
            radius: 32,
            backgroundColor: isDarkMode ? AppColors.surfaceLighter : Colors.grey[200],
            backgroundImage: user.photoUrl != null ? NetworkImage(user.photoUrl!) : null,
            child: user.photoUrl == null
                ? Text(
                    user.displayName.isNotEmpty ? user.displayName[0].toUpperCase() : '?',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: AppColors.primary,
                    ),
                  )
                : null,
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      user.displayName,
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: roleColor.withValues(alpha: 0.1),
                        borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                      ),
                      child: Text(
                        roleText,
                        style: TextStyle(
                          fontSize: 11,
                          fontWeight: FontWeight.w600,
                          color: roleColor,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  user.email,
                  style: TextStyle(
                    fontSize: 14,
                    color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => context.push('/settings/profile'),
            icon: Icon(
              Icons.edit_outlined,
              color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildProfileCardSkeleton(bool isDarkMode) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
      ),
      child: Row(
        children: [
          Container(
            width: 64,
            height: 64,
            decoration: BoxDecoration(
              color: isDarkMode ? AppColors.surfaceLighter : Colors.grey[200],
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  width: 120,
                  height: 18,
                  decoration: BoxDecoration(
                    color: isDarkMode ? AppColors.surfaceLighter : Colors.grey[200],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: 180,
                  height: 14,
                  decoration: BoxDecoration(
                    color: isDarkMode ? AppColors.surfaceLighter : Colors.grey[200],
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String title, bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.only(left: 4),
      child: Text(
        title,
        style: TextStyle(
          fontSize: 13,
          fontWeight: FontWeight.w600,
          color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
        ),
      ),
    );
  }

  Widget _buildSettingsCard({
    required bool isDarkMode,
    required List<Widget> children,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        children: children,
      ),
    );
  }

  Widget _buildToggleItem({
    required IconData icon,
    required String title,
    String? subtitle,
    required bool value,
    required bool isDarkMode,
    required ValueChanged<bool> onChanged,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          Icon(
            icon,
            size: 22,
            color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),
                if (subtitle != null) ...[
                  const SizedBox(height: 2),
                  Text(
                    subtitle,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDarkMode ? AppColors.textMutedDark : AppColors.textMutedLight,
                    ),
                  ),
                ],
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeTrackColor: AppColors.primary,
            activeThumbColor: Colors.white,
          ),
        ],
      ),
    );
  }

  Widget _buildArrowItem({
    required IconData icon,
    required String title,
    required bool isDarkMode,
    Widget? trailing,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            Icon(
              icon,
              size: 22,
              color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
            ),
            trailing ??
                Icon(
                  Icons.chevron_right,
                  size: 22,
                  color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
          ],
        ),
      ),
    );
  }

  Widget _buildFontSizeSlider(AppLocalizations l10n, bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Icon(
                Icons.text_fields,
                size: 22,
                color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
              const SizedBox(width: 12),
              Text(
                l10n.fontSize,
                style: TextStyle(
                  fontSize: 15,
                  color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(
                'A',
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
              ),
              Expanded(
                child: SliderTheme(
                  data: SliderThemeData(
                    activeTrackColor: AppColors.primary,
                    inactiveTrackColor: isDarkMode ? AppColors.surfaceLighter : Colors.grey[300],
                    thumbColor: AppColors.primary,
                    overlayColor: AppColors.primary.withValues(alpha: 0.1),
                    trackHeight: 4,
                  ),
                  child: Slider(
                    value: _fontSizeValue,
                    min: 0.8,
                    max: 1.4,
                    divisions: 3,
                    onChanged: (value) {
                      setState(() {
                        _fontSizeValue = value;
                      });
                      // Save font size preference
                    },
                  ),
                ),
              ),
              Text(
                'A',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildDivider(bool isDarkMode) {
    return Divider(
      height: 1,
      thickness: 1,
      indent: 50,
      color: isDarkMode ? AppColors.dividerDark : AppColors.divider,
    );
  }

  Future<bool?> _showLogoutConfirmation(
    BuildContext context,
    AppLocalizations l10n,
    bool isDarkMode,
  ) {
    return showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        backgroundColor: isDarkMode ? AppColors.cardDark : Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        ),
        title: Text(
          l10n.logout,
          style: TextStyle(
            color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        content: Text(
          l10n.logoutConfirmation,
          style: TextStyle(
            color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
          ),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context, false),
            child: Text(
              l10n.cancel,
              style: TextStyle(
                color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
            ),
          ),
          TextButton(
            onPressed: () => Navigator.pop(context, true),
            child: Text(
              l10n.logout,
              style: TextStyle(
                color: AppColors.coral,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void _showDeleteAccountDialog(
    BuildContext context,
    AppLocalizations l10n,
    bool isDarkMode,
  ) {
    final TextEditingController confirmController = TextEditingController();
    bool isDeleting = false;

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (dialogContext) => StatefulBuilder(
        builder: (context, setState) => AlertDialog(
          backgroundColor: isDarkMode ? AppColors.cardDark : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          ),
          title: Row(
            children: [
              Icon(
                Icons.warning_amber_rounded,
                color: AppColors.error,
                size: 28,
              ),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  l10n.deleteAccountTitle,
                  style: TextStyle(
                    color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                l10n.deleteAccountMessage,
                style: TextStyle(
                  color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                padding: const EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: AppColors.error.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(8),
                  border: Border.all(color: AppColors.error.withValues(alpha: 0.3)),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.info_outline,
                      color: AppColors.error,
                      size: 20,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        l10n.deleteAccountWarning,
                        style: TextStyle(
                          fontSize: 12,
                          color: AppColors.error,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              Text(
                l10n.deleteAccountConfirmation,
                style: TextStyle(
                  fontSize: 13,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                controller: confirmController,
                enabled: !isDeleting,
                style: TextStyle(
                  color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
                decoration: InputDecoration(
                  hintText: 'DELETE',
                  hintStyle: TextStyle(
                    color: isDarkMode ? AppColors.textMutedDark : AppColors.textMutedLight,
                  ),
                  filled: true,
                  fillColor: isDarkMode ? AppColors.surfaceDark : Colors.grey[100],
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                ),
                onChanged: (_) => setState(() {}),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: isDeleting ? null : () => Navigator.pop(dialogContext),
              child: Text(
                l10n.cancel,
                style: TextStyle(
                  color: isDeleting
                      ? (isDarkMode ? AppColors.textMutedDark : AppColors.textMutedLight)
                      : (isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                ),
              ),
            ),
            TextButton(
              onPressed: isDeleting || confirmController.text != 'DELETE'
                  ? null
                  : () async {
                      setState(() => isDeleting = true);
                      try {
                        await ref.read(authNotifierProvider.notifier).deleteAccount();
                        if (mounted) {
                          Navigator.pop(dialogContext);
                          ScaffoldMessenger.of(this.context).showSnackBar(
                            SnackBar(content: Text(l10n.accountDeleted)),
                          );
                          this.context.go('/login');
                        }
                      } catch (e) {
                        setState(() => isDeleting = false);
                        if (mounted) {
                          ScaffoldMessenger.of(this.context).showSnackBar(
                            SnackBar(content: Text('${l10n.deleteAccountFailed}: $e')),
                          );
                        }
                      }
                    },
              child: isDeleting
                  ? SizedBox(
                      width: 20,
                      height: 20,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        color: AppColors.error,
                      ),
                    )
                  : Text(
                      l10n.deleteAccount,
                      style: TextStyle(
                        color: confirmController.text == 'DELETE'
                            ? AppColors.error
                            : (isDarkMode ? AppColors.textMutedDark : AppColors.textMutedLight),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
