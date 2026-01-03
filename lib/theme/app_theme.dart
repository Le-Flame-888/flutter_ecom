import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Mockup Colors
  static const Color limeGreen = Color(0xFFD4E883);
  static const Color darkBlack = Color(0xFF1B1B1B);
  static const Color offWhite = Color(0xFFF8F8F8);
  static const Color pureWhite = Color(0xFFFFFFFF);

  // Primary mappings
  static const Color primaryColor = limeGreen;
  static const Color primaryDark = Color(0xFFA8BD60);
  static const Color primaryLight = Color(0xFFE6F0B0);
  static const Color accentColor = darkBlack;

  // Neutrals
  static const Color black = darkBlack;
  static const Color darkGray = Color(0xFF4A4A4A);
  static const Color mediumGray = Color(0xFF9E9E9E);
  static const Color lightGray = Color(0xFFE0E0E0);
  static const Color backgroundGray = offWhite; // Mapping for legacy
  static const Color whiteColor = pureWhite; // Mapping for legacy

  // Semantic
  static const Color successColor = Color(0xFF77EF67);
  static const Color errorColor = Color(0xFFFF4444);
  static const Color warningColor = Color(0xFFFFB84D);
  static const Color infoColor = Color(0xFF4ECDC4);

  // Spacing Scale
  static const double spacing4 = 4.0;
  static const double spacing8 = 8.0;
  static const double spacing12 = 12.0;
  static const double spacing16 = 16.0;
  static const double spacing24 = 24.0;
  static const double spacing32 = 32.0;
  static const double spacing48 = 48.0;
  static const double spacing64 = 64.0;

  // Border Radius
  static const double radiusSmall = 8.0;
  static const double radiusMedium = 16.0;
  static const double radiusLarge = 24.0;
  static const double radiusXLarge = 32.0;
  static const double radiusFull = 999.0;

  // Shadows
  static List<BoxShadow> shadowSm = [
    BoxShadow(
      color: Colors.black.withOpacity(0.05),
      blurRadius: 10,
      offset: const Offset(0, 4),
    ),
  ];

  static List<BoxShadow> shadowMd = [
    BoxShadow(
      color: Colors.black.withOpacity(0.08),
      blurRadius: 16,
      offset: const Offset(0, 8),
    ),
  ];

  static List<BoxShadow> shadowLg = [
    BoxShadow(
      color: Colors.black.withOpacity(0.12),
      blurRadius: 24,
      offset: const Offset(0, 12),
    ),
  ];

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [limeGreen, Color(0xFFA8BD60)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient accentGradient = LinearGradient(
    colors: [darkBlack, Color(0xFF333333)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: primaryColor,
      scaffoldBackgroundColor: offWhite,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: accentColor,
        surface: pureWhite,
        error: errorColor,
        onPrimary: darkBlack,
        onSecondary: pureWhite,
        onSurface: darkBlack,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: offWhite,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: darkBlack),
        titleTextStyle: TextStyle(
          color: darkBlack,
          fontSize: 18,
          fontWeight: FontWeight.w600,
          letterSpacing: -0.5,
        ),
      ),
      textTheme: GoogleFonts.interTextTheme().apply(
        bodyColor: darkBlack,
        displayColor: darkBlack,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: darkBlack,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusFull),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: const TextStyle(fontWeight: FontWeight.w600, fontSize: 16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: pureWhite,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 20,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(radiusMedium),
          borderSide: const BorderSide(color: primaryColor, width: 2),
        ),
        hintStyle: const TextStyle(color: mediumGray, fontSize: 14),
      ),
    );
  }
}
