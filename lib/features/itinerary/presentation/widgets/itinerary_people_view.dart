import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../data/models/participant_model.dart';
import '../../../participants/providers/participant_provider.dart';
import '../../../../l10n/generated/app_localizations.dart';

class ItineraryPeopleView extends ConsumerWidget {
  final String tripId;

  const ItineraryPeopleView({
    super.key,
    required this.tripId,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final participantState = ref.watch(participantManagementProvider(tripId));
    final l10n = AppLocalizations.of(context)!;
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final canManageAsync = ref.watch(canManageParticipantsProvider(tripId));

    final allParticipants = [
      ...participantState.hosts,
      ...participantState.participants,
    ];

    if (participantState.isLoading) {
      return const Center(child: CircularProgressIndicator());
    }

    if (allParticipants.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.people_outline,
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
          ],
        ),
      );
    }

    // Separate hosts and participants
    final hosts = participantState.hosts;
    final participants = participantState.participants;

    return CustomScrollView(
      slivers: [
        // Top spacing
        const SliverToBoxAdapter(
          child: SizedBox(height: 20),
        ),
        // Header
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      l10n.people,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w700,
                        color: isDark
                            ? AppColors.textPrimaryDark
                            : AppColors.textPrimaryLight,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      '${allParticipants.length} ${l10n.participant}${allParticipants.length > 1 ? 's' : ''}',
                      style: TextStyle(
                        fontSize: 14,
                        color: isDark
                            ? AppColors.textMutedDark
                            : AppColors.textMutedLight,
                      ),
                    ),
                  ],
                ),
                canManageAsync.when(
                  data: (canManage) => canManage
                      ? Container(
                          decoration: BoxDecoration(
                            color: AppColors.primary.withValues(alpha: 0.1),
                            borderRadius: BorderRadius.circular(20),
                          ),
                          child: TextButton.icon(
                            onPressed: () =>
                                context.push('/trip/$tripId/participants'),
                            icon: const Icon(Icons.tune, size: 18),
                            label: Text(l10n.manage),
                            style: TextButton.styleFrom(
                              foregroundColor: AppColors.primary,
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 14, vertical: 6),
                              textStyle: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        )
                      : const SizedBox.shrink(),
                  loading: () => const SizedBox.shrink(),
                  error: (_, __) => const SizedBox.shrink(),
                ),
              ],
            ),
          ),
        ),
        const SliverToBoxAdapter(child: SizedBox(height: 20)),
        // Hosts section
        if (hosts.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildSectionLabel(
                Icons.star_rounded,
                l10n.host,
                AppColors.primary,
                isDark,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildParticipantCard(
                    context, hosts[index], l10n, isDark),
                childCount: hosts.length,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 20)),
        ],
        // Participants section
        if (participants.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: _buildSectionLabel(
                Icons.people_rounded,
                l10n.participant,
                AppColors.info,
                isDark,
              ),
            ),
          ),
          const SliverToBoxAdapter(child: SizedBox(height: 10)),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            sliver: SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) => _buildParticipantCard(
                    context, participants[index], l10n, isDark),
                childCount: participants.length,
              ),
            ),
          ),
        ],
        const SliverToBoxAdapter(child: SizedBox(height: 24)),
      ],
    );
  }

  Widget _buildSectionLabel(
      IconData icon, String label, Color color, bool isDark) {
    return Row(
      children: [
        Icon(icon, size: 18, color: color),
        const SizedBox(width: 6),
        Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w700,
            color: isDark ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            letterSpacing: 0.5,
          ),
        ),
      ],
    );
  }

  Widget _buildParticipantCard(
    BuildContext context,
    ParticipantModel participant,
    AppLocalizations l10n,
    bool isDark,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
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
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        child: Row(
          children: [
            // Avatar
            Container(
              width: 48,
              height: 48,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                gradient: participant.photoUrl == null
                    ? LinearGradient(
                        colors: [
                          _getRoleColor(participant.role),
                          _getRoleColor(participant.role).withValues(alpha: 0.7),
                        ],
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                      )
                    : null,
                image: participant.photoUrl != null
                    ? DecorationImage(
                        image: NetworkImage(participant.photoUrl!),
                        fit: BoxFit.cover,
                      )
                    : null,
              ),
              child: participant.photoUrl == null
                  ? Center(
                      child: Text(
                        participant.displayName.isNotEmpty
                            ? participant.displayName[0].toUpperCase()
                            : '?',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    )
                  : null,
            ),
            const SizedBox(width: 14),
            // Info
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Flexible(
                        child: Text(
                          participant.displayName,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: isDark
                                ? AppColors.textPrimaryDark
                                : AppColors.textPrimaryLight,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      const SizedBox(width: 8),
                      _buildRoleBadge(participant.role, l10n, isDark),
                    ],
                  ),
                  const SizedBox(height: 3),
                  Text(
                    participant.email,
                    style: TextStyle(
                      fontSize: 12,
                      color: isDark
                          ? AppColors.textMutedDark
                          : AppColors.textMutedLight,
                    ),
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
            _buildPermissionIcons(participant, isDark),
          ],
        ),
      ),
    );
  }

  Widget _buildRoleBadge(UserRole role, AppLocalizations l10n, bool isDark) {
    String label;
    Color color;

    switch (role) {
      case UserRole.host:
        label = l10n.host;
        color = AppColors.primary;
        break;
      case UserRole.coHost:
        label = l10n.coHost;
        color = AppColors.coral;
        break;
      case UserRole.participant:
        label = l10n.participant;
        color = AppColors.info;
        break;
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
      decoration: BoxDecoration(
        color: color.withValues(alpha: 0.12),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Text(
        label,
        style: TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w600,
          color: color,
        ),
      ),
    );
  }

  Widget _buildPermissionIcons(ParticipantModel participant, bool isDark) {
    if (participant.canManage) {
      return Icon(
        Icons.admin_panel_settings,
        size: 20,
        color: AppColors.primary,
      );
    }

    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (participant.canEditSchedule)
          Padding(
            padding: const EdgeInsets.only(right: 4),
            child: Icon(
              Icons.edit_note,
              size: 18,
              color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
            ),
          ),
        if (participant.canUploadPhotos)
          Icon(
            Icons.photo_camera,
            size: 18,
            color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
          ),
      ],
    );
  }

  Color _getRoleColor(UserRole role) {
    switch (role) {
      case UserRole.host:
        return AppColors.primary;
      case UserRole.coHost:
        return AppColors.coral;
      case UserRole.participant:
        return AppColors.info;
    }
  }
}
