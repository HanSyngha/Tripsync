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

    return Column(
      children: [
        // Header
        Container(
          padding: const EdgeInsets.all(16),
          color: isDark ? AppColors.surfaceDark : Colors.white,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    l10n.people,
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${allParticipants.length} ${l10n.participant}${allParticipants.length > 1 ? 's' : ''}',
                    style: TextStyle(
                      fontSize: 14,
                      color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
                    ),
                  ),
                ],
              ),
              canManageAsync.when(
                data: (canManage) => canManage
                    ? TextButton.icon(
                        onPressed: () => context.push('/trip/$tripId/participants'),
                        icon: const Icon(Icons.settings),
                        label: Text(l10n.manage),
                        style: TextButton.styleFrom(
                          foregroundColor: AppColors.primary,
                        ),
                      )
                    : const SizedBox.shrink(),
                loading: () => const SizedBox.shrink(),
                error: (_, __) => const SizedBox.shrink(),
              ),
            ],
          ),
        ),
        const Divider(height: 1),
        // Participants list
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: allParticipants.length,
            itemBuilder: (context, index) {
              final participant = allParticipants[index];
              return _buildParticipantCard(context, participant, l10n, isDark);
            },
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
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isDark ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        leading: CircleAvatar(
          radius: 24,
          backgroundColor: _getRoleColor(participant.role).withValues(alpha: 0.2),
          backgroundImage: participant.photoUrl != null
              ? NetworkImage(participant.photoUrl!)
              : null,
          child: participant.photoUrl == null
              ? Text(
                  participant.displayName.isNotEmpty
                      ? participant.displayName[0].toUpperCase()
                      : '?',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: _getRoleColor(participant.role),
                  ),
                )
              : null,
        ),
        title: Row(
          children: [
            Flexible(
              child: Text(
                participant.displayName,
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                  color: isDark ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
                overflow: TextOverflow.ellipsis,
              ),
            ),
            const SizedBox(width: 8),
            _buildRoleBadge(participant.role, l10n, isDark),
          ],
        ),
        subtitle: Padding(
          padding: const EdgeInsets.only(top: 4),
          child: Text(
            participant.email,
            style: TextStyle(
              fontSize: 13,
              color: isDark ? AppColors.textMutedDark : AppColors.textMutedLight,
            ),
            overflow: TextOverflow.ellipsis,
          ),
        ),
        trailing: _buildPermissionIcons(participant, isDark),
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
        color: color.withValues(alpha: 0.15),
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
