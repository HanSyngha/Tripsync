import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../data/models/participant_model.dart';
import '../../providers/participant_provider.dart';

class ParticipantsScreen extends ConsumerStatefulWidget {
  final String tripId;

  const ParticipantsScreen({
    super.key,
    required this.tripId,
  });

  @override
  ConsumerState<ParticipantsScreen> createState() => _ParticipantsScreenState();
}

class _ParticipantsScreenState extends ConsumerState<ParticipantsScreen> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final participantState = ref.watch(participantManagementProvider(widget.tripId));
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context, isDarkMode),
            Expanded(
              child: participantState.isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : participantState.error != null
                      ? _buildErrorState(participantState.error!)
                      : _buildContent(context, participantState, isDarkMode),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildHeader(BuildContext context, bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 16, 8, 0),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => context.pop(),
            child: Container(
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                color: isDarkMode ? AppColors.surfaceDark : Colors.white,
                borderRadius: BorderRadius.circular(AppTheme.radiusMd),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 8,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Icon(
                Icons.arrow_back_ios_new,
                size: 20,
                color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
          ),
          const SizedBox(width: 16),
          Expanded(
            child: Text(
              '참여자 관리',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
          ),
          IconButton(
            onPressed: () => _showSettingsBottomSheet(context),
            icon: Icon(
              Icons.settings_outlined,
              color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildContent(
    BuildContext context,
    ParticipantManagementState state,
    bool isDarkMode,
  ) {
    return CustomScrollView(
      slivers: [
        // Stats Cards
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              children: [
                Expanded(
                  child: _buildStatCard(
                    context,
                    '참여 중',
                    '${state.totalParticipating}명',
                    AppColors.primary,
                    isDarkMode,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: _buildStatCard(
                    context,
                    '초대 대기',
                    '${state.totalPending}명',
                    AppColors.coral,
                    isDarkMode,
                  ),
                ),
              ],
            ),
          ),
        ),

        // Invite Button
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: _buildInviteButton(context),
          ),
        ),

        // Search Field
        SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: _buildSearchField(isDarkMode),
          ),
        ),

        // Hosts Section
        if (state.filteredHosts.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: _buildSectionHeader('운영진', null, isDarkMode),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final host = state.filteredHosts[index];
                return _buildHostItem(context, host, isDarkMode);
              },
              childCount: state.filteredHosts.length,
            ),
          ),
        ],

        // Participants Section
        SliverToBoxAdapter(
          child: _buildSectionHeader(
            '참여자',
            '${state.filteredParticipants.length}명',
            isDarkMode,
          ),
        ),
        if (state.filteredParticipants.isEmpty)
          SliverToBoxAdapter(
            child: _buildEmptyParticipantsState(isDarkMode),
          )
        else
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final participant = state.filteredParticipants[index];
                return _buildParticipantItem(context, participant, isDarkMode);
              },
              childCount: state.filteredParticipants.length,
            ),
          ),

        // Pending Invites Section
        if (state.filteredPendingInvites.isNotEmpty) ...[
          SliverToBoxAdapter(
            child: _buildSectionHeader(
              '초대 대기 중',
              '${state.filteredPendingInvites.length}명',
              isDarkMode,
            ),
          ),
          SliverList(
            delegate: SliverChildBuilderDelegate(
              (context, index) {
                final pending = state.filteredPendingInvites[index];
                return _buildPendingInviteItem(context, pending, isDarkMode);
              },
              childCount: state.filteredPendingInvites.length,
            ),
          ),
        ],

        // Bottom Padding
        const SliverToBoxAdapter(
          child: SizedBox(height: 100),
        ),
      ],
    );
  }

  Widget _buildStatCard(
    BuildContext context,
    String label,
    String value,
    Color accentColor,
    bool isDarkMode,
  ) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          Container(
            width: 8,
            height: 40,
            decoration: BoxDecoration(
              color: accentColor,
              borderRadius: BorderRadius.circular(4),
            ),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(
                  fontSize: 12,
                  color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                value,
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildInviteButton(BuildContext context) {
    return GestureDetector(
      onTap: () => _navigateToInviteScreen(context),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: AppColors.primaryGradient,
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          boxShadow: [
            BoxShadow(
              color: AppColors.primary.withOpacity(0.3),
              blurRadius: 12,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.person_add_outlined,
              color: Colors.white,
              size: 22,
            ),
            SizedBox(width: 8),
            Text(
              '+ 새 멤버 초대하기',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w600,
                color: Colors.white,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSearchField(bool isDarkMode) {
    return Container(
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.surfaceDark : Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: TextField(
        controller: _searchController,
        onChanged: (value) {
          ref.read(participantSearchQueryProvider.notifier).state = value;
        },
        decoration: InputDecoration(
          hintText: '이름 또는 이메일로 검색',
          hintStyle: TextStyle(
            color: isDarkMode ? AppColors.textMutedDark : AppColors.textMutedLight,
            fontSize: 14,
          ),
          prefixIcon: Icon(
            Icons.search,
            color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
          ),
          border: InputBorder.none,
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
        ),
        style: TextStyle(
          color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
        ),
      ),
    );
  }

  Widget _buildSectionHeader(String title, String? count, bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(20, 8, 20, 12),
      child: Row(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
              color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
          if (count != null) ...[
            const SizedBox(width: 8),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
              decoration: BoxDecoration(
                color: isDarkMode ? AppColors.surfaceLighter : AppColors.backgroundLight,
                borderRadius: BorderRadius.circular(AppTheme.radiusFull),
              ),
              child: Text(
                count,
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w500,
                  color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
              ),
            ),
          ],
        ],
      ),
    );
  }

  Widget _buildHostItem(BuildContext context, ParticipantModel host, bool isDarkMode) {
    final isHost = host.role == UserRole.host;
    final roleLabel = isHost ? 'HOST' : 'CO-HOST';
    final permissions = _getPermissionText(host);

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildAvatar(host.photoUrl, host.displayName, 48),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Flexible(
                      child: Text(
                        host.displayName,
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                        ),
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                      decoration: BoxDecoration(
                        color: AppColors.primary,
                        borderRadius: BorderRadius.circular(AppTheme.radiusSm),
                      ),
                      child: Text(
                        roleLabel,
                        style: const TextStyle(
                          fontSize: 10,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 4),
                Text(
                  permissions,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _showParticipantOptions(context, host),
            icon: Icon(
              Icons.more_vert,
              color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildParticipantItem(
    BuildContext context,
    ParticipantModel participant,
    bool isDarkMode,
  ) {
    final statusColor = participant.canEditSchedule ? AppColors.success : Colors.grey;
    final statusText = participant.canEditSchedule ? '일정 편집 가능' : '읽기 전용';

    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 8,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          _buildAvatar(participant.photoUrl, participant.displayName, 44),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  participant.displayName,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w600,
                    color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Container(
                      width: 8,
                      height: 8,
                      decoration: BoxDecoration(
                        color: statusColor,
                        shape: BoxShape.circle,
                      ),
                    ),
                    const SizedBox(width: 6),
                    Text(
                      statusText,
                      style: TextStyle(
                        fontSize: 12,
                        color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          IconButton(
            onPressed: () => _showParticipantOptions(context, participant),
            icon: Icon(
              Icons.more_vert,
              color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPendingInviteItem(
    BuildContext context,
    ParticipantModel pending,
    bool isDarkMode,
  ) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 6),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: Border.all(
          color: isDarkMode ? AppColors.dividerDark : AppColors.divider,
          width: 1,
          style: BorderStyle.solid,
        ),
      ),
      child: Row(
        children: [
          _buildAvatar(null, pending.email, 44, isPlaceholder: true),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  pending.email,
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 4),
                Text(
                  '초대 대기 중',
                  style: TextStyle(
                    fontSize: 12,
                    color: isDarkMode ? AppColors.textMutedDark : AppColors.textMutedLight,
                  ),
                ),
              ],
            ),
          ),
          TextButton(
            onPressed: () => _resendInvite(pending.id),
            style: TextButton.styleFrom(
              foregroundColor: AppColors.coral,
              padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            ),
            child: const Text(
              '재전송',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildAvatar(
    String? photoUrl,
    String name,
    double size, {
    bool isPlaceholder = false,
  }) {
    final initials = name.isNotEmpty ? name[0].toUpperCase() : '?';

    if (photoUrl != null && photoUrl.isNotEmpty && !isPlaceholder) {
      return Container(
        width: size,
        height: size,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: NetworkImage(photoUrl),
            fit: BoxFit.cover,
          ),
        ),
      );
    }

    return Container(
      width: size,
      height: size,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: isPlaceholder
            ? AppColors.divider
            : AppColors.primary.withOpacity(0.1),
      ),
      child: Center(
        child: isPlaceholder
            ? Icon(
                Icons.mail_outline,
                size: size * 0.4,
                color: AppColors.textSecondaryLight,
              )
            : Text(
                initials,
                style: TextStyle(
                  fontSize: size * 0.4,
                  fontWeight: FontWeight.bold,
                  color: AppColors.primary,
                ),
              ),
      ),
    );
  }

  Widget _buildEmptyParticipantsState(bool isDarkMode) {
    return Padding(
      padding: const EdgeInsets.all(40),
      child: Column(
        children: [
          Icon(
            Icons.group_outlined,
            size: 64,
            color: isDarkMode ? AppColors.textMutedDark : AppColors.textMutedLight,
          ),
          const SizedBox(height: 16),
          Text(
            '아직 참여자가 없습니다',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            '새 멤버를 초대해보세요',
            style: TextStyle(
              fontSize: 14,
              color: isDarkMode ? AppColors.textMutedDark : AppColors.textMutedLight,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildErrorState(String error) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.error_outline,
              size: 64,
              color: AppColors.error.withOpacity(0.7),
            ),
            const SizedBox(height: 16),
            Text(
              '오류가 발생했습니다',
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.textPrimaryDark
                    : AppColors.textPrimaryLight,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              error,
              style: TextStyle(
                fontSize: 14,
                color: Theme.of(context).brightness == Brightness.dark
                    ? AppColors.textSecondaryDark
                    : AppColors.textSecondaryLight,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  String _getPermissionText(ParticipantModel participant) {
    final permissions = <String>[];
    if (participant.canManage) permissions.add('관리');
    if (participant.canEditSchedule) permissions.add('일정 편집');
    if (participant.canUploadPhotos) permissions.add('사진 업로드');

    if (permissions.isEmpty) return '읽기 전용';
    return permissions.join(', ') + ' 가능';
  }

  void _navigateToInviteScreen(BuildContext context) {
    context.push('/trip/${widget.tripId}/participants/invite');
  }

  void _showSettingsBottomSheet(BuildContext context) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: isDarkMode ? AppColors.surfaceDark : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '참여자 관리 설정',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),
                const SizedBox(height: 20),
                _buildSettingsTile(
                  icon: Icons.person_add,
                  title: '새 멤버 초대',
                  subtitle: '이메일로 사용자를 검색하여 초대',
                  onTap: () {
                    Navigator.pop(context);
                    _navigateToInviteScreen(context);
                  },
                  isDarkMode: isDarkMode,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildSettingsTile({
    required IconData icon,
    required String title,
    required String subtitle,
    Widget? trailing,
    VoidCallback? onTap,
    required bool isDarkMode,
  }) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: AppColors.primary.withOpacity(0.1),
          borderRadius: BorderRadius.circular(AppTheme.radiusSm),
        ),
        child: Icon(icon, color: AppColors.primary, size: 22),
      ),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w600,
          color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: TextStyle(
          fontSize: 12,
          color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
        ),
      ),
      trailing: trailing,
      onTap: onTap,
    );
  }

  void _showParticipantOptions(BuildContext context, ParticipantModel participant) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    showModalBottomSheet(
      context: context,
      backgroundColor: isDarkMode ? AppColors.surfaceDark : Colors.white,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) {
        return SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    _buildAvatar(participant.photoUrl, participant.displayName, 48),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            participant.displayName,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                            ),
                          ),
                          Text(
                            participant.email,
                            style: TextStyle(
                              fontSize: 13,
                              color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),
                const Divider(),
                _buildOptionTile(
                  icon: Icons.edit_outlined,
                  title: '권한 변경',
                  onTap: () {
                    Navigator.pop(context);
                    _showPermissionsDialog(context, participant);
                  },
                  isDarkMode: isDarkMode,
                ),
                if (!participant.isHost)
                  _buildOptionTile(
                    icon: Icons.admin_panel_settings_outlined,
                    title: participant.isCoHost ? '공동 운영자 해제' : '공동 운영자로 지정',
                    onTap: () {
                      Navigator.pop(context);
                      _toggleCoHostRole(participant);
                    },
                    isDarkMode: isDarkMode,
                  ),
                if (!participant.isHost)
                  _buildOptionTile(
                    icon: Icons.person_remove_outlined,
                    title: '참여자 삭제',
                    isDestructive: true,
                    onTap: () {
                      Navigator.pop(context);
                      _confirmRemoveParticipant(context, participant);
                    },
                    isDarkMode: isDarkMode,
                  ),
                const SizedBox(height: 8),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildOptionTile({
    required IconData icon,
    required String title,
    required VoidCallback onTap,
    bool isDestructive = false,
    required bool isDarkMode,
  }) {
    final color = isDestructive
        ? AppColors.error
        : (isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight);

    return ListTile(
      contentPadding: EdgeInsets.zero,
      leading: Icon(icon, color: color),
      title: Text(
        title,
        style: TextStyle(
          fontSize: 15,
          fontWeight: FontWeight.w500,
          color: color,
        ),
      ),
      onTap: onTap,
    );
  }

  void _showPermissionsDialog(BuildContext context, ParticipantModel participant) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;
    bool canEdit = participant.canEditSchedule;
    bool canUpload = participant.canUploadPhotos;

    showDialog(
      context: context,
      builder: (context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              backgroundColor: isDarkMode ? AppColors.surfaceDark : Colors.white,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppTheme.radiusLg),
              ),
              title: Text(
                '권한 설정',
                style: TextStyle(
                  color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                ),
              ),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SwitchListTile(
                    title: Text(
                      '일정 편집',
                      style: TextStyle(
                        color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      ),
                    ),
                    subtitle: Text(
                      '일정을 추가, 수정, 삭제할 수 있습니다',
                      style: TextStyle(
                        fontSize: 12,
                        color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                    ),
                    value: canEdit,
                    onChanged: (value) => setState(() => canEdit = value),
                    activeColor: AppColors.primary,
                  ),
                  SwitchListTile(
                    title: Text(
                      '사진 업로드',
                      style: TextStyle(
                        color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                      ),
                    ),
                    subtitle: Text(
                      '공유 앨범에 사진을 업로드할 수 있습니다',
                      style: TextStyle(
                        fontSize: 12,
                        color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                    ),
                    value: canUpload,
                    onChanged: (value) => setState(() => canUpload = value),
                    activeColor: AppColors.primary,
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed: () => Navigator.pop(context),
                  child: Text(
                    AppLocalizations.of(context)!.cancel,
                    style: TextStyle(
                      color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ),
                ),
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    _updatePermissions(participant.id, canEdit, canUpload);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.primary,
                    foregroundColor: Colors.white,
                  ),
                  child: Text(AppLocalizations.of(context)!.save),
                ),
              ],
            );
          },
        );
      },
    );
  }

  void _confirmRemoveParticipant(BuildContext context, ParticipantModel participant) {
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: isDarkMode ? AppColors.surfaceDark : Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(AppTheme.radiusLg),
          ),
          title: Text(
            AppLocalizations.of(context)!.removeFromTrip,
            style: TextStyle(
              color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
          content: Text(
            AppLocalizations.of(context)!.deleteConfirmMessage,
            style: TextStyle(
              color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: Text(
                AppLocalizations.of(context)!.cancel,
                style: TextStyle(
                  color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                ),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
                _removeParticipant(participant.id);
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.error,
                foregroundColor: Colors.white,
              ),
              child: Text(AppLocalizations.of(context)!.delete),
            ),
          ],
        );
      },
    );
  }

  Future<void> _resendInvite(String participantId) async {
    final success = await ref
        .read(participantActionsProvider(widget.tripId).notifier)
        .resendInvite(participantId);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(success ? '초대를 다시 보냈습니다' : '초대 재전송에 실패했습니다'),
          backgroundColor: success ? AppColors.success : AppColors.error,
        ),
      );
    }
  }

  Future<void> _removeParticipant(String participantId) async {
    final success = await ref
        .read(participantActionsProvider(widget.tripId).notifier)
        .removeParticipant(participantId);

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(success ? '참여자를 삭제했습니다' : '참여자 삭제에 실패했습니다'),
          backgroundColor: success ? AppColors.success : AppColors.error,
        ),
      );
    }
  }

  Future<void> _updatePermissions(
    String participantId,
    bool canEdit,
    bool canUpload,
  ) async {
    final success = await ref
        .read(participantActionsProvider(widget.tripId).notifier)
        .updatePermissions(
          participantId: participantId,
          canEditSchedule: canEdit,
          canUploadPhotos: canUpload,
        );

    if (mounted) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(success ? '권한을 변경했습니다' : '권한 변경에 실패했습니다'),
          backgroundColor: success ? AppColors.success : AppColors.error,
        ),
      );
    }
  }

  Future<void> _toggleCoHostRole(ParticipantModel participant) async {
    final newRole = participant.isCoHost ? UserRole.participant : UserRole.coHost;
    final success = await ref
        .read(participantActionsProvider(widget.tripId).notifier)
        .updateRole(
          participantId: participant.id,
          newRole: newRole,
        );

    if (mounted) {
      final message = participant.isCoHost
          ? '공동 운영자 권한을 해제했습니다'
          : '공동 운영자로 지정했습니다';
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(success ? message : '역할 변경에 실패했습니다'),
          backgroundColor: success ? AppColors.success : AppColors.error,
        ),
      );
    }
  }

}
