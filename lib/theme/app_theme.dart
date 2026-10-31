import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  // Leon Signature Brand Colors
  static const Color primary = Color(0xFFE5192D); // Leon Signature Crimson Red
  static const Color primaryDark = Color(0xFFB80E1E);
  static const Color primaryLight = Color(0xFFFF2B3F);
  static const Color secondary = Color(0xFFFFFFFF); // Leon Pure White
  static const Color accentPurple = Color(0xFF9C27B0);
  static const Color accentGold = Color(0xFFFFB800); // Leon Trophy Gold
  static const Color accentRose = Color(0xFFE5192D);
  static const Color accentOrange = Color(0xFFFF6D00);
  static const Color accentGreen = Color(0xFF00C853); // Leon Pitch Green

  // Background Surfaces (Leon Obsidian Carbon & Pure Stealth Black)
  static const Color background = Color(0xFF0C0C0E); // Deep Obsidian Black
  static const Color surface = Color(0xFF141418); // Dark Stealth Surface
  static const Color surfaceCard = Color(0xFF1C1C22); // Matte Carbon Card
  static const Color surfaceElevated = Color(0xFF26262E);
  static const Color surfaceBorder = Color(0xFF2C2C36); // Crisp Card Border

  // Text Colors
  static const Color textPrimary = Color(0xFFFFFFFF);
  static const Color textSecondary = Color(0xFF9E9EB0);
  static const Color textMuted = Color(0xFF666675);

  // Leon Signature Brand Gradients
  static const LinearGradient heroGradient = LinearGradient(
    colors: [Color(0xFF2B0A0E), Color(0xFF141318)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient streakGradient = LinearGradient(
    colors: [Color(0xFF2D1606), Color(0xFF161318)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient rewardsGradient = LinearGradient(
    colors: [Color(0xFF2E0A0E), Color(0xFF151419)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  static const LinearGradient profileGradient = LinearGradient(
    colors: [Color(0xFF1E1E26), Color(0xFF101014)],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );

  // Box Shadows
  static List<BoxShadow> get neonGlow => [
        BoxShadow(
          color: primary.withAlpha(60),
          blurRadius: 20,
          spreadRadius: 1,
        ),
      ];

  static ThemeData get darkTheme {
    return ThemeData(
      brightness: Brightness.dark,
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      colorScheme: const ColorScheme.dark(
        primary: primary,
        secondary: secondary,
        surface: surface,
        error: accentRose,
      ),
      textTheme: GoogleFonts.interTextTheme(
        ThemeData.dark().textTheme,
      ).apply(
        bodyColor: textPrimary,
        displayColor: textPrimary,
      ),
      appBarTheme: AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: GoogleFonts.outfit(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textPrimary,
          letterSpacing: 0.5,
        ),
        iconTheme: const IconThemeData(color: textPrimary),
      ),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: surface,
        selectedItemColor: primary,
        unselectedItemColor: textMuted,
        elevation: 8,
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: GoogleFonts.outfit(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
