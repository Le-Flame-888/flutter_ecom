import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Brand Colors
  static const Color voltGreen = Color(0xFFB0FF57);
  static const Color darkBlack = Color(0xFF18181B); // zinc-900 equivalent
  static const Color pureWhite = Color(0xFFFFFFFF);

  // Primary mappings
  static const Color primaryColor = voltGreen;
  static const Color accentColor = darkBlack;

  // Neutrals
  static const Color black = Color(0xFF000000);
  static const Color darkGray = Color(0xFF27272A); // zinc-800
  static const Color mediumGray = Color(0xFF71717A); // zinc-500
  static const Color lightGray = Color(0xFFF4F4F5); // zinc-100
  static const Color backgroundLight = pureWhite;
  static const Color backgroundDark = darkBlack;

  // Aliases for backward compatibility
  static const Color limeGreen = voltGreen;
  static const Color offWhite = backgroundLight;
  static const Color whiteColor = pureWhite;
  static const Color backgroundGray = lightGray;

  // Semantic
  static const Color successColor = Color(0xFF4ADE80);
  static const Color errorColor = Color(0xFFEF4444);
  static const Color warningColor = Color(0xFFF59E0B);
  static const Color infoColor = Color(0xFF3B82F6);

  // Spacing Scale
  static const double spacing4 = 4.0;
  static const double spacing8 = 8.0;
  static const double spacing12 = 12.0;
  static const double spacing16 = 16.0;
  static const double spacing20 = 20.0;
  static const double spacing24 = 24.0;
  static const double spacing32 = 32.0;
  static const double spacing48 = 48.0;
  static const double spacing64 = 64.0;

  // Border Radius
  static const double radiusSmall = 8.0;
  static const double radiusMedium =
      12.0; // rounded-xl often implies 12px or 16px
  static const double radiusLarge = 16.0;
  static const double radiusXLarge = 24.0;
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

  // Key Animations
  static const Duration durationFast = Duration(milliseconds: 200);
  static const Duration durationMedium = Duration(milliseconds: 300);

  // Gradients
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [voltGreen, Color(0xFFCBFF93)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static ThemeData get lightTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundLight,
      colorScheme: const ColorScheme.light(
        primary: primaryColor,
        secondary: accentColor,
        surface: pureWhite,
        error: errorColor,
        onPrimary: black, // Black text on volt green
        onSecondary: pureWhite,
        onSurface: darkBlack,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundLight,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: darkBlack),
        titleTextStyle: TextStyle(
          color: darkBlack,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
      ),
      textTheme: GoogleFonts.epilogueTextTheme().apply(
        bodyColor: darkBlack,
        displayColor: darkBlack,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusFull),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: lightGray,
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

  static ThemeData get darkTheme {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      primaryColor: primaryColor,
      scaffoldBackgroundColor: backgroundDark,
      colorScheme: const ColorScheme.dark(
        primary: primaryColor,
        secondary: pureWhite,
        surface: darkGray,
        error: errorColor,
        onPrimary: black,
        onSecondary: darkBlack,
        onSurface: pureWhite,
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: backgroundDark,
        elevation: 0,
        centerTitle: true,
        iconTheme: IconThemeData(color: pureWhite),
        titleTextStyle: TextStyle(
          color: pureWhite,
          fontSize: 18,
          fontWeight: FontWeight.w700,
          letterSpacing: -0.5,
        ),
      ),
      textTheme: GoogleFonts.epilogueTextTheme(
        ThemeData.dark().textTheme,
      ).apply(bodyColor: pureWhite, displayColor: pureWhite),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primaryColor,
          foregroundColor: black,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(radiusFull),
          ),
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
          textStyle: const TextStyle(fontWeight: FontWeight.w700, fontSize: 16),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: darkGray,
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
