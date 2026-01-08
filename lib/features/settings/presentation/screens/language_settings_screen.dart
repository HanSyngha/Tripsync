import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import '../../../../l10n/generated/app_localizations.dart';
import '../../../../core/theme/app_colors.dart';
import '../../../../core/theme/app_theme.dart';
import '../../../../core/providers/locale_provider.dart';

class LanguageSettingsScreen extends ConsumerWidget {
  const LanguageSettingsScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // AppLocalizations.of(context) is available for future use
    final currentLocale = ref.watch(localeProvider);
    final isDarkMode = Theme.of(context).brightness == Brightness.dark;

    // Get current locale or system default
    final activeLocaleCode = currentLocale?.languageCode ??
        Localizations.localeOf(context).languageCode;

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
          _getLocalizedTitle(context),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight,
          ),
        ),
        centerTitle: true,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        itemCount: LocaleNotifier.supportedLocales.length,
        itemBuilder: (context, index) {
          final locale = LocaleNotifier.supportedLocales[index];
          final languageName = LocaleNotifier.localeNames[locale.languageCode] ?? locale.languageCode;
          final isSelected = activeLocaleCode == locale.languageCode;

          return _buildLanguageItem(
            languageName: languageName,
            languageCode: locale.languageCode,
            isSelected: isSelected,
            isDarkMode: isDarkMode,
            onTap: () {
              ref.read(localeProvider.notifier).setLocale(locale);
            },
          );
        },
      ),
    );
  }

  String _getLocalizedTitle(BuildContext context) {
    // Return "Language" in the current locale
    final locale = Localizations.localeOf(context).languageCode;
    switch (locale) {
      case 'ko':
        return '언어';
      case 'zh':
        return '语言';
      case 'ja':
        return '言語';
      case 'es':
        return 'Idioma';
      case 'fr':
        return 'Langue';
      case 'de':
        return 'Sprache';
      case 'pt':
        return 'Idioma';
      case 'ru':
        return 'Язык';
      case 'ar':
        return 'اللغة';
      case 'hi':
        return 'भाषा';
      case 'vi':
        return 'Ngon ngu';
      case 'th':
        return 'ภาษา';
      case 'id':
        return 'Bahasa';
      case 'tr':
        return 'Dil';
      case 'it':
        return 'Lingua';
      case 'nl':
        return 'Taal';
      case 'pl':
        return 'Jezyk';
      case 'ms':
        return 'Bahasa';
      case 'uk':
        return 'Мова';
      default:
        return 'Language';
    }
  }

  Widget _buildLanguageItem({
    required String languageName,
    required String languageCode,
    required bool isSelected,
    required bool isDarkMode,
    required VoidCallback onTap,
  }) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      decoration: BoxDecoration(
        color: isDarkMode ? AppColors.cardDark : Colors.white,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        border: isSelected
            ? Border.all(color: AppColors.primary, width: 2)
            : null,
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.05),
            blurRadius: 4,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: InkWell(
        onTap: onTap,
        borderRadius: BorderRadius.circular(AppTheme.radiusMd),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      languageName,
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: isSelected ? FontWeight.w600 : FontWeight.w500,
                        color: isSelected
                            ? AppColors.primary
                            : (isDarkMode ? AppColors.textPrimaryDark : AppColors.textPrimaryLight),
                      ),
                    ),
                    const SizedBox(height: 2),
                    Text(
                      _getEnglishName(languageCode),
                      style: TextStyle(
                        fontSize: 13,
                        color: isDarkMode ? AppColors.textSecondaryDark : AppColors.textSecondaryLight,
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: isSelected
                        ? AppColors.primary
                        : (isDarkMode ? AppColors.dividerDark : AppColors.divider),
                    width: 2,
                  ),
                  color: isSelected ? AppColors.primary : Colors.transparent,
                ),
                child: isSelected
                    ? const Icon(
                        Icons.check,
                        size: 16,
                        color: Colors.white,
                      )
                    : null,
              ),
            ],
          ),
        ),
      ),
    );
  }

  String _getEnglishName(String languageCode) {
    switch (languageCode) {
      case 'en':
        return 'English';
      case 'ko':
        return 'Korean';
      case 'zh':
        return 'Chinese';
      case 'ja':
        return 'Japanese';
      case 'es':
        return 'Spanish';
      case 'fr':
        return 'French';
      case 'de':
        return 'German';
      case 'pt':
        return 'Portuguese';
      case 'ru':
        return 'Russian';
      case 'ar':
        return 'Arabic';
      case 'hi':
        return 'Hindi';
      case 'vi':
        return 'Vietnamese';
      case 'th':
        return 'Thai';
      case 'id':
        return 'Indonesian';
      case 'tr':
        return 'Turkish';
      case 'it':
        return 'Italian';
      case 'nl':
        return 'Dutch';
      case 'pl':
        return 'Polish';
      case 'ms':
        return 'Malay';
      case 'uk':
        return 'Ukrainian';
      default:
        return languageCode.toUpperCase();
    }
  }
}
