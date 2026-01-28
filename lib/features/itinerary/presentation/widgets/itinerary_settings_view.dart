import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/models/trip_model.dart';
import '../../../trip/providers/trip_provider.dart';
import '../../../../l10n/generated/app_localizations.dart';

class ItinerarySettingsView extends ConsumerWidget {
  final String tripId;

  const ItinerarySettingsView({
    super.key,
    required this.tripId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final tripAsync = ref.watch(tripProvider(tripId));
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final isHostAsync = ref.watch(isHostProvider(tripId));

    return tripAsync.when(
      data: (trip) {
        if (trip == null) return const SizedBox.shrink();

        final isHost = isHostAsync.valueOrNull ?? false;
        final dateFormat = DateFormat('yyyy.MM.dd');

        return CustomScrollView(
          slivers: [
            const SliverToBoxAdapter(child: SizedBox(height: 20)),
            // Header
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text(
                  l10n.settings,
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w700,
                    color: isDark
                        ? AppColors.textPrimaryDark
                        : AppColors.textPrimaryLight,
                  ),
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 20)),

            // Trip Info Card
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildSectionCard(
                  isDark: isDark,
                  children: [
                    _buildSectionHeader(
                      icon: Icons.info_outline,
                      title: l10n.tripDetails,
                      isDark: isDark,
                    ),
                    const SizedBox(height: 14),
                    _buildInfoRow(
                      icon: Icons.flight_takeoff,
                      label: l10n.tripName,
                      value: trip.name,
                      isDark: isDark,
                    ),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                      icon: Icons.location_on_outlined,
                      label: l10n.destination,
                      value: trip.destination,
                      isDark: isDark,
                    ),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                      icon: Icons.calendar_today_outlined,
                      label: '${l10n.startDate} - ${l10n.endDate}',
                      value:
                          '${dateFormat.format(trip.startDate)} ~ ${dateFormat.format(trip.endDate)}',
                      isDark: isDark,
                    ),
                    const SizedBox(height: 12),
                    _buildInfoRow(
                      icon: Icons.people_outline,
                      label: l10n.participant,
                      value: '${trip.participantCount}',
                      isDark: isDark,
                    ),
                    if (trip.description != null &&
                        trip.description!.isNotEmpty) ...[
                      const SizedBox(height: 12),
                      _buildInfoRow(
                        icon: Icons.notes,
                        label: l10n.description,
                        value: trip.description!,
                        isDark: isDark,
                      ),
                    ],
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),

            // Invite Section
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildSectionCard(
                  isDark: isDark,
                  children: [
                    _buildSectionHeader(
                      icon: Icons.person_add_outlined,
                      title: l10n.inviteNewMember,
                      isDark: isDark,
                    ),
                    const SizedBox(height: 14),
                    SizedBox(
                      width: double.infinity,
                      child: OutlinedButton.icon(
                        onPressed: () {
                          Clipboard.setData(
                            ClipboardData(text: 'tripsync://join/$tripId'),
                          );
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(l10n.inviteLinkCopied),
                              behavior: SnackBarBehavior.floating,
                            ),
                          );
                        },
                        icon: const Icon(Icons.link, size: 18),
                        label: Text(l10n.inviteLinkCopied.replaceAll('copied', '').trim().isEmpty
                            ? 'Copy Invite Link'
                            : l10n.share),
                        style: OutlinedButton.styleFrom(
                          foregroundColor: AppColors.primary,
                          side: const BorderSide(color: AppColors.primary),
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.circular(AppTheme.radiusMd),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),

            // Notification Settings
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildSectionCard(
                  isDark: isDark,
                  children: [
                    _buildSectionHeader(
                      icon: Icons.notifications_outlined,
                      title: l10n.notifications,
                      isDark: isDark,
                    ),
                    const SizedBox(height: 10),
                    _buildActionItem(
                      icon: Icons.notifications_active_outlined,
                      title: l10n.notificationSettings,
                      isDark: isDark,
                      onTap: () => context.push('/settings'),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 16)),

            // Manage Section (Host only)
            if (isHost)
              SliverToBoxAdapter(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: _buildSectionCard(
                    isDark: isDark,
                    children: [
                      _buildSectionHeader(
                        icon: Icons.admin_panel_settings_outlined,
                        title: l10n.manage,
                        isDark: isDark,
                      ),
                      const SizedBox(height: 10),
                      _buildActionItem(
                        icon: Icons.campaign_outlined,
                        title: l10n.sendAnnouncement,
                        isDark: isDark,
                        onTap: () =>
                            context.push('/trip/$tripId/announcement'),
                      ),
                      _buildActionItem(
                        icon: Icons.edit_outlined,
                        title: l10n.edit,
                        isDark: isDark,
                        onTap: () =>
                            context.push('/trip/$tripId/edit'),
                      ),
                      _buildActionItem(
                        icon: Icons.people_outline,
                        title: l10n.people,
                        isDark: isDark,
                        onTap: () =>
                            context.push('/trip/$tripId/participants'),
                      ),
                    ],
                  ),
                ),
              ),
            if (isHost)
              const SliverToBoxAdapter(child: SizedBox(height: 16)),

            // Danger Zone
            SliverToBoxAdapter(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: _buildSectionCard(
                  isDark: isDark,
                  children: [
                    _buildActionItem(
                      icon: Icons.logout,
                      title: isHost ? l10n.delete : l10n.cancel,
                      isDark: isDark,
                      isDestructive: true,
                      onTap: () => _showLeaveConfirmation(
                          context, trip, isHost, l10n, isDark),
                    ),
                  ],
                ),
              ),
            ),
            const SliverToBoxAdapter(child: SizedBox(height: 40)),
          ],
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (error, _) => Center(
        child: Text(
          l10n.error,
          style: TextStyle(
            color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
          ),
        ),
      ),
    );
  }

  Widget _buildSectionCard({
    required bool isDark,
    required List<Widget> children,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusLg),
        border: Border.all(
          color: isDark
              ? Colors.white.withValues(alpha: 0.06)
              : Colors.black.withValues(alpha: 0.05),
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: isDark ? 0.15 : 0.04),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }

  Widget _buildSectionHeader({
    required IconData icon,
    required String title,
    required bool isDark,
  }) {
    return Row(
      children: [
        Icon(icon, size: 20, color: AppColors.primary),
        const SizedBox(width: 8),
        Text(
          title,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w700,
            color: isDark
                ? AppColors.textPrimaryDark
                : AppColors.textPrimaryLight,
          ),
        ),
      ],
    );
  }

  Widget _buildInfoRow({
    required IconData icon,
    required String label,
    required String value,
    required bool isDark,
  }) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Icon(
          icon,
          size: 18,
          color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
        ),
        const SizedBox(width: 10),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: isDark
                      ? AppColors.textMutedDark
                      : AppColors.textMutedLight,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w500,
                  color: isDark
                      ? AppColors.textPrimaryDark
                      : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildActionItem({
    required IconData icon,
    required String title,
    required bool isDark,
    bool isDestructive = false,
    VoidCallback? onTap,
  }) {
    final color = isDestructive
        ? Colors.red
        : (isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight);

    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppTheme.radiusMd),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Row(
          children: [
            Icon(icon, size: 20, color: color),
            const SizedBox(width: 12),
            Expanded(
              child: Text(
                title,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.w500,
                  color: color,
                ),
              ),
            ),
            Icon(
              Icons.chevron_right,
              size: 20,
              color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
            ),
          ],
        ),
      ),
    );
  }

  void _showLeaveConfirmation(
    BuildContext context,
    TripModel trip,
    bool isHost,
    AppLocalizations l10n,
    bool isDark,
  ) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(isHost ? l10n.delete : l10n.cancel),
        content: Text(
          isHost
              ? '${l10n.delete} "${trip.name}"?'
              : '${l10n.cancel} "${trip.name}"?',
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: Text(l10n.cancel),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
              // TODO: Implement leave/delete trip
              context.go('/');
            },
            style: TextButton.styleFrom(foregroundColor: Colors.red),
            child: Text(l10n.confirm),
          ),
        ],
      ),
    );
  }
}
