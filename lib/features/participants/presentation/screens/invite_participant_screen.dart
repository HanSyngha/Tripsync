import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../core/constants/app_constants.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../auth/providers/auth_provider.dart';
import '../../providers/participant_provider.dart';

class InviteParticipantScreen extends ConsumerStatefulWidget {
  final String tripId;

  const InviteParticipantScreen({
    super.key,
    required this.tripId,
  });

  @override
  ConsumerState<InviteParticipantScreen> createState() => _InviteParticipantScreenState();
}

class _InviteParticipantScreenState extends ConsumerState<InviteParticipantScreen> {
  final TextEditingController _emailController = TextEditingController();
  final FocusNode _emailFocusNode = FocusNode();

  @override
  void initState() {
    super.initState();
    _emailController.addListener(_onEmailChanged);
  }

  @override
  void dispose() {
    _emailController.removeListener(_onEmailChanged);
    _emailController.dispose();
    _emailFocusNode.dispose();
    super.dispose();
  }

  void _onEmailChanged() {
    ref.read(inviteFormProvider.notifier).setEmail(_emailController.text);
  }

  @override
  Widget build(BuildContext context) {
    final formState = ref.watch(inviteFormProvider);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      backgroundColor: isDarkMode ? AppColors.backgroundDark : AppColors.backgroundLight,
      body: SafeArea(
        child: Column(
          children: [
            _buildHeader(context, isDarkMode),
            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildEmailSection(formState, isDarkMode),
                    const SizedBox(height: 32),
                    _buildRoleSection(formState, isDarkMode),
                    const SizedBox(height: 32),
                    _buildPermissionsSection(formState, isDarkMode),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
            _buildSendButton(formState, isDarkMode),
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
              '새 멤버 초대',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildEmailSection(InviteFormState formState, bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('이메일 주소', isDarkMode),
        const SizedBox(height: 12),
        Container(
          decoration: BoxDecoration(
            color: isDarkMode ? AppColors.surfaceDark : Colors.white,
            borderRadius: BorderRadius.circular(AppTheme.radiusMd),
            border: Border.all(
              color: formState.emailError != null
                  ? AppColors.error
                  : (isDarkMode ? AppColors.dividerDark : AppColors.divider),
              width: formState.emailError != null ? 1.5 : 1,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.05),
                blurRadius: 8,
                offset: const Offset(0, 2),
              ),
            ],
          ),
          child: TextField(
            controller: _emailController,
            focusNode: _emailFocusNode,
            keyboardType: TextInputType.emailAddress,
            textInputAction: TextInputAction.done,
            decoration: InputDecoration(
              hintText: 'example@email.com',
              hintStyle: TextStyle(
                color: isDarkMode ? AppColors.textMutedDark : AppColors.textMutedLight,
                fontSize: 15,
              ),
              prefixIcon: Icon(
                Icons.mail_outline,
                color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
              border: InputBorder.none,
              contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            ),
            style: TextStyle(
              fontSize: 15,
              color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
            ),
          ),
        ),
        if (formState.emailError != null) ...[
          const SizedBox(height: 8),
          Text(
            formState.emailError!,
            style: const TextStyle(
              fontSize: 12,
              color: AppColors.error,
            ),
          ),
        ],
        const SizedBox(height: 8),
        Text(
          '초대 이메일이 해당 주소로 발송됩니다',
          style: TextStyle(
            fontSize: 12,
            color: isDarkMode ? AppColors.textMutedDark : AppColors.textMutedLight,
          ),
        ),
      ],
    );
  }

  Widget _buildRoleSection(InviteFormState formState, bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('역할 선택', isDarkMode),
        const SizedBox(height: 12),
        Row(
          children: [
            Expanded(
              child: _buildRoleCard(
                title: '참여자',
                subtitle: '일정 보기 및 댓글',
                icon: Icons.person_outline,
                isSelected: formState.role == UserRole.participant,
                onTap: () {
                  ref.read(inviteFormProvider.notifier).setRole(UserRole.participant);
                },
                isDarkMode: isDarkMode,
              ),
            ),
            const SizedBox(width: 12),
            Expanded(
              child: _buildRoleCard(
                title: '공동 운영자',
                subtitle: '일정 관리 및 멤버 초대',
                icon: Icons.admin_panel_settings_outlined,
                isSelected: formState.role == UserRole.coHost,
                onTap: () {
                  ref.read(inviteFormProvider.notifier).setRole(UserRole.coHost);
                },
                isDarkMode: isDarkMode,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRoleCard({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool isSelected,
    required VoidCallback onTap,
    required bool isDarkMode,
  }) {
    return GestureDetector(
      onTap: onTap,
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 200),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: isSelected
              ? AppColors.primary.withOpacity(0.1)
              : (isDarkMode ? AppColors.surfaceDark : Colors.white),
          borderRadius: BorderRadius.circular(AppTheme.radiusMd),
          border: Border.all(
            color: isSelected
                ? AppColors.primary
                : (isDarkMode ? AppColors.dividerDark : AppColors.divider),
            width: isSelected ? 2 : 1,
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 8,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: isSelected
                    ? AppColors.primary.withOpacity(0.2)
                    : (isDarkMode ? AppColors.surfaceLighter : AppColors.backgroundLight),
                shape: BoxShape.circle,
              ),
              child: Icon(
                icon,
                color: isSelected
                    ? AppColors.primary
                    : (isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
                size: 28,
              ),
            ),
            const SizedBox(height: 12),
            Text(
              title,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w600,
                color: isSelected
                    ? AppColors.primary
                    : (isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
              ),
            ),
            const SizedBox(height: 4),
            Text(
              subtitle,
              style: TextStyle(
                fontSize: 11,
                color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPermissionsSection(InviteFormState formState, bool isDarkMode) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildSectionTitle('권한 설정', isDarkMode),
        const SizedBox(height: 12),
        Container(
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
          child: Column(
            children: [
              _buildPermissionToggle(
                title: '일정 편집 가능',
                subtitle: '일정을 추가, 수정, 삭제할 수 있습니다',
                icon: Icons.edit_calendar_outlined,
                value: formState.canEditSchedule,
                onChanged: (value) {
                  ref.read(inviteFormProvider.notifier).setCanEditSchedule(value);
                },
                isDarkMode: isDarkMode,
              ),
              Divider(
                height: 1,
                color: isDarkMode ? AppColors.dividerDark : AppColors.divider,
              ),
              _buildPermissionToggle(
                title: '사진 업로드 가능',
                subtitle: '공유 앨범에 사진을 업로드할 수 있습니다',
                icon: Icons.photo_library_outlined,
                value: formState.canUploadPhotos,
                onChanged: (value) {
                  ref.read(inviteFormProvider.notifier).setCanUploadPhotos(value);
                },
                isDarkMode: isDarkMode,
              ),
            ],
          ),
        ),
        if (formState.role == UserRole.coHost) ...[
          const SizedBox(height: 12),
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: AppColors.info.withOpacity(0.1),
              borderRadius: BorderRadius.circular(AppTheme.radiusSm),
              border: Border.all(
                color: AppColors.info.withOpacity(0.3),
              ),
            ),
            child: Row(
              children: [
                const Icon(
                  Icons.info_outline,
                  color: AppColors.info,
                  size: 20,
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    '공동 운영자는 기본적으로 모든 권한을 가집니다',
                    style: TextStyle(
                      fontSize: 12,
                      color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ],
    );
  }

  Widget _buildPermissionToggle({
    required String title,
    required String subtitle,
    required IconData icon,
    required bool value,
    required ValueChanged<bool> onChanged,
    required bool isDarkMode,
  }) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: value
                  ? AppColors.primary.withOpacity(0.1)
                  : (isDarkMode ? AppColors.surfaceLighter : AppColors.backgroundLight),
              borderRadius: BorderRadius.circular(AppTheme.radiusSm),
            ),
            child: Icon(
              icon,
              color: value
                  ? AppColors.primary
                  : (isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight),
              size: 22,
            ),
          ),
          const SizedBox(width: 14),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
                  ),
                ),
                const SizedBox(height: 2),
                Text(
                  subtitle,
                  style: TextStyle(
                    fontSize: 12,
                    color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                  ),
                ),
              ],
            ),
          ),
          Switch(
            value: value,
            onChanged: onChanged,
            activeColor: AppColors.primary,
          ),
        ],
      ),
    );
  }

  Widget _buildSectionTitle(String title, bool isDarkMode) {
    return Text(
      title,
      style: TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
      ),
    );
  }

  Widget _buildSendButton(InviteFormState formState, bool isDarkMode) {
    final isEnabled = formState.isValid && !formState.isSubmitting;

    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.surfaceDark : Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.08),
            blurRadius: 12,
            offset: const Offset(0, -4),
          ),
        ],
      ),
      child: SafeArea(
        top: false,
        child: GestureDetector(
          onTap: isEnabled ? _sendInvite : null,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 200),
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            decoration: BoxDecoration(
              gradient: isEnabled
                  ? const LinearGradient(
                      colors: AppColors.primaryGradient,
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    )
                  : null,
              color: isEnabled ? null : AppColors.divider,
              borderRadius: BorderRadius.circular(AppTheme.radiusMd),
              boxShadow: isEnabled
                  ? [
                      BoxShadow(
                        color: AppColors.primary.withOpacity(0.3),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ]
                  : null,
            ),
            child: Center(
              child: formState.isSubmitting
                  ? const SizedBox(
                      width: 24,
                      height: 24,
                      child: CircularProgressIndicator(
                        color: Colors.white,
                        strokeWidth: 2,
                      ),
                    )
                  : Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.send_outlined,
                          color: isEnabled ? Colors.white : AppColors.textMutedLight,
                          size: 20,
                        ),
                        const SizedBox(width: 8),
                        Text(
                          '초대 보내기',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                            color: isEnabled ? Colors.white : AppColors.textMutedLight,
                          ),
                        ),
                      ],
                    ),
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _sendInvite() async {
    final formState = ref.read(inviteFormProvider);
    final currentUser = ref.read(currentUserProvider).valueOrNull;

    if (currentUser == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('로그인이 필요합니다'),
          backgroundColor: AppColors.error,
        ),
      );
      return;
    }

    ref.read(inviteFormProvider.notifier).setSubmitting(true);

    final success = await ref
        .read(participantActionsProvider(widget.tripId).notifier)
        .inviteParticipant(
          email: formState.email,
          role: formState.role,
          canEditSchedule: formState.role == UserRole.coHost || formState.canEditSchedule,
          canUploadPhotos: formState.role == UserRole.coHost || formState.canUploadPhotos,
          invitedBy: currentUser.id,
        );

    ref.read(inviteFormProvider.notifier).setSubmitting(false);

    if (mounted) {
      if (success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('${formState.email}님에게 초대를 보냈습니다'),
            backgroundColor: AppColors.success,
          ),
        );
        ref.read(inviteFormProvider.notifier).reset();
        context.pop();
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('초대 전송에 실패했습니다. 다시 시도해주세요'),
            backgroundColor: AppColors.error,
          ),
        );
      }
    }
  }
}
