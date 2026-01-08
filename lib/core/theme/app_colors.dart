import 'package:flutter/material.dart';

/// TripSync App Color Palette
/// Based on the design system from Designs.txt
class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primary = Color(0xFF247D8F);
  static const Color primaryDark = Color(0xFF1B5E6B);
  static const Color primaryLight = Color(0xFF2A9AAF);

  // Secondary Colors
  static const Color secondary = Color(0xFFCC9933);
  static const Color secondaryDark = Color(0xFFA37A29);
  static const Color coral = Color(0xFFB8734A);
  static const Color coralDark = Color(0xFF996040);
  static const Color coralLight = Color(0xFFCC6F57);

  // Background Colors - Light Mode
  static const Color backgroundLight = Color(0xFFF7F8F8);
  static const Color surfaceLight = Color(0xFFFFFFFF);
  static const Color cardLight = Color(0xFFFFFFFF);

  // Background Colors - Dark Mode
  static const Color backgroundDark = Color(0xFF1A2023);
  static const Color surfaceDark = Color(0xFF242A2D);
  static const Color surfaceLighter = Color(0xFF2F3639);
  static const Color cardDark = Color(0xFF2C353B);

  // Text Colors - Light Mode
  static const Color textPrimaryLight = Color(0xFF121617);
  static const Color textSecondaryLight = Color(0xFF677F83);
  static const Color textMutedLight = Color(0xFF837167);

  // Text Colors - Dark Mode
  static const Color textPrimaryDark = Color(0xFFE0E2E1);
  static const Color textSecondaryDark = Color(0xFFA0B1B5);
  static const Color textMutedDark = Color(0xFFA8A29E);

  // Social Login Colors
  static const Color kakao = Color(0xFFFEE500);
  static const Color kakaoText = Color(0xFF3C1E1E);
  static const Color naver = Color(0xFF03C75A);
  static const Color google = Color(0xFF4285F4);
  static const Color apple = Color(0xFF000000);

  // Status Colors
  static const Color success = Color(0xFF059669);
  static const Color successLight = Color(0xFFECFDF5);
  static const Color warning = Color(0xFFD97706);
  static const Color warningLight = Color(0xFFFFFBEB);
  static const Color error = Color(0xFFDC2626);
  static const Color errorLight = Color(0xFFFEF2F2);
  static const Color info = Color(0xFF3B6CFF);
  static const Color infoLight = Color(0xFFEBF1FF);

  // Additional Colors
  static const Color divider = Color(0xFFE5E7EB);
  static const Color dividerDark = Color(0xFF374151);
  static const Color shimmerBase = Color(0xFFE0E0E0);
  static const Color shimmerHighlight = Color(0xFFF5F5F5);
  static const Color shimmerBaseDark = Color(0xFF303030);
  static const Color shimmerHighlightDark = Color(0xFF404040);

  // Gradient Colors
  static const List<Color> primaryGradient = [
    Color(0xFF247D8F),
    Color(0xFF1D6371),
  ];

  static const List<Color> cardGradient = [
    Color(0x00000000),
    Color(0x99000000),
  ];

  // Activity Category Colors
  static const Color flightColor = Color(0xFF3B6CFF);
  static const Color accommodationColor = Color(0xFF8B5CF6);
  static const Color rentalCarColor = Color(0xFFEAB308);
  static const Color restaurantColor = Color(0xFFF97316);
  static const Color attractionColor = Color(0xFF22C55E);
  static const Color activityColor = Color(0xFF06B6D4);
  static const Color transportationColor = Color(0xFF6366F1);
}
