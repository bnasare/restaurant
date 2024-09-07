import 'package:flutter/material.dart';

class AppColors {
  AppColors._();

  // Primary Colors
  static const Color primaryDark = Color(0xFF033A2C);
  static const Color primaryLight = Color(0xFFC6D8FB);
  static const Color primaryLighter = Color(0xFFEEF5FC);

  static const Color gradientShade1 = Color(0xFF5A82F9);
  static const Color gradientShade2 = Color(0xFF3367FF);

  static const Color accentLight = Color(0xFFFDF4E2);

  // Primary Colors
  static const int _primaryHex = 0xFF0050E5;
  static const MaterialColor primary = MaterialColor(_primaryHex, {
    50: Color(0xFFF3F7FE),
    100: Color(0xFFE6EEFD),
    200: Color(0xFFC0D4F9),
    300: Color(0xFF97B8F5),
    400: Color(0xFF4D85ED),
    500: Color(0xFF0050E5),
    600: Color(0xFF0048CC),
    700: Color(0xFF00308A),
    800: Color(0xFF002468),
    900: Color(0xFF001843),
  });

  // Primary Alt Colors
  static const int _primaryAltHex = 0xFF014C83;
  static const MaterialColor primaryAlt =
      MaterialColor(_primaryAltHex, <int, Color>{
    50: Color(0xFFE1EAF0),
    100: Color(0xFFB3C9DA),
    200: Color(0xFF80A6C1),
    300: Color(0xFF4D82A8),
    400: Color(0xFF276796),
    500: Color(_primaryAltHex),
    600: Color(0xFF01457B),
    700: Color(0xFF013C70),
    800: Color(0xFF013366),
    900: Color(0xFF002453),
  });

  // Gray Colors
  static const int grayHex = 0xFF667185;
  static const MaterialColor grey = MaterialColor(grayHex, {
    50: Color(0xFFF9FAFB),
    75: Color(0xFFF7F9FC),
    100: Color(0xFFF0F2F5),
    200: Color(0xFFE4E7EC),
    300: Color(0xFFD0D5DD),
    400: Color(0xFF98A2B3),
    500: Color(grayHex),
    600: Color(0xFF334155),
  });

  // Success Colors
  static const int _successHex = 0xFF16A34A;
  static const MaterialColor success = MaterialColor(_successHex, {
    50: Color(0xFFF0FDF4),
    75: Color(0xFFBBF7D0),
    100: Color(0xFFBBF7D0),
    200: Color(0xFF86EFAC),
    300: Color(0xFF4ADE80),
    400: Color(0xFF22C55E),
    500: Color(_successHex),
    600: Color(0xFF16A34A),
  });

  // Warning Colors
  static const int _warningHex = 0xFFD97706;
  static const MaterialColor warning = MaterialColor(_warningHex, {
    50: Color(0xFFFFFBEB),
    75: Color(0xFFFEF3C7),
    100: Color(0xFFFDE68A),
    200: Color(0xFFFCD34D),
    300: Color(0xFFFBBF24),
    400: Color(0xFFF59E0B),
    500: Color(_warningHex),
    600: Color(0xFFB45309),
  });

  // Danger Colors
  static const int _dangerHex = 0xFFDC2626;
  static const MaterialColor danger = MaterialColor(_dangerHex, {
    50: Color(0xFFFEF2F2),
    75: Color(0xFFFEE2E2),
    100: Color(0xFFFECACA),
    200: Color(0xFFFCA5A5),
    300: Color(0xFFF87171),
    400: Color(0xFFEF4444),
    500: Color(_dangerHex),
    600: Color(0xFFB91C1C),
  });

  static const int _accentHex = 0xFF6F3500;
  static const MaterialColor accent = MaterialColor(_accentHex, <int, Color>{
    50: Color(0xFFEEE7E0),
    100: Color(0xFFD4C2B3),
    200: Color(0xFFB79A80),
    300: Color(0xFF9A724D),
    400: Color(0xFF855326),
    500: Color(_accentHex),
    600: Color(0xFF673000),
    700: Color(0xFF5C2800),
    800: Color(0xFF522200),
    900: Color(0xFF401600),
  });

  static const int _servicesHex = 0xFFFEF3C7;
  static const MaterialColor services = MaterialColor(_servicesHex, {
    100: Color(0xFFFEF3C7),
    200: Color(0xFFE5D1FD),
    300: Color(0xFFFFDFD0),
    400: Color(0xFFF0FDF4),
    500: Color(_servicesHex),
    600: Color(0xFFEDFAE1),
  });
}

// #EDFAE1