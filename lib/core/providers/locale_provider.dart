import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String _localeKey = 'app_locale';

final localeProvider = StateNotifierProvider<LocaleNotifier, Locale?>((ref) {
  return LocaleNotifier();
});

class LocaleNotifier extends StateNotifier<Locale?> {
  LocaleNotifier() : super(null) {
    _loadLocale();
  }

  static const List<Locale> supportedLocales = [
    Locale('en'), // English
    Locale('ko'), // Korean
    Locale('zh'), // Chinese
    Locale('ja'), // Japanese
    Locale('es'), // Spanish
    Locale('fr'), // French
    Locale('de'), // German
    Locale('pt'), // Portuguese
    Locale('ru'), // Russian
    Locale('ar'), // Arabic
    Locale('hi'), // Hindi
    Locale('vi'), // Vietnamese
    Locale('th'), // Thai
    Locale('id'), // Indonesian
    Locale('tr'), // Turkish
    Locale('it'), // Italian
    Locale('nl'), // Dutch
    Locale('pl'), // Polish
    Locale('ms'), // Malay
    Locale('uk'), // Ukrainian
  ];

  static const Map<String, String> localeNames = {
    'en': 'English',
    'ko': '한국어',
    'zh': '中文',
    'ja': '日本語',
    'es': 'Español',
    'fr': 'Français',
    'de': 'Deutsch',
    'pt': 'Português',
    'ru': 'Русский',
    'ar': 'العربية',
    'hi': 'हिन्दी',
    'vi': 'Tiếng Việt',
    'th': 'ไทย',
    'id': 'Bahasa Indonesia',
    'tr': 'Türkçe',
    'it': 'Italiano',
    'nl': 'Nederlands',
    'pl': 'Polski',
    'ms': 'Bahasa Melayu',
    'uk': 'Українська',
  };

  Future<void> _loadLocale() async {
    final prefs = await SharedPreferences.getInstance();
    final localeCode = prefs.getString(_localeKey);
    if (localeCode != null) {
      state = Locale(localeCode);
    }
  }

  Future<void> setLocale(Locale locale) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_localeKey, locale.languageCode);
    state = locale;
  }

  Future<void> clearLocale() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_localeKey);
    state = null;
  }
}
