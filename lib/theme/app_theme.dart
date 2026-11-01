import 'package:flutter/material.dart';

class AppTheme {
  // ПАЛИТРА ПО ТЗ (Leo / Леон):
  // • #F1F2F4 — основной светло-серый фон.
  // • #FFFFFF — карточки статей, матчей и достижений.
  // • #1C1F20 — верхняя панель и нижняя навигация.
  // • #E0E2E5 — фон фильтров и заголовков групп.
  // • #EEF0F2 — поля поиска и второстепенные кнопки.
  // • #109E59 — основной зелёный акцент: кнопки, активные элементы, прогресс.
  // • #087A43 — текстовые акценты на светлом фоне, кнопки с белым текстом.
  // • #ED0028 — дополнительный красный акцент для информационного баннера и декоративных деталей.
  // • #1D2123 — основной текст.
  // • #626B75 — второстепенные подписи.
  // • #E5E7EB — разделители и контуры.
  // • #FFFFFF — текст на тёмных поверхностях.

  static const Color background = Color(0xFFF1F2F4);
  static const Color surfaceCard = Color(0xFFFFFFFF);
  static const Color darkNav = Color(0xFF1C1F20);
  static const Color filterBg = Color(0xFFE0E2E5);
  static const Color surfaceSecondary = Color(0xFFEEF0F2);
  static const Color primary = Color(0xFF087A43); // Тёмно-зеленый для кнопок с белым текстом
  static const Color greenLight = Color(0xFF109E59); // Светло-зеленый акцент
  static const Color accentRed = Color(0xFFED0028); // Красный акцент для баннера
  static const Color textMain = Color(0xFF1D2123);
  static const Color textSecondary = Color(0xFF626B75);
  static const Color border = Color(0xFFE5E7EB);
  static const Color onPrimary = Color(0xFFFFFFFF);

  // Совместимость
  static const Color surface = surfaceCard;
  static const Color surfaceElevated = surfaceSecondary;
  static const Color surfaceBorder = border;
  static const Color textPrimary = textMain;
  static const Color textMuted = textSecondary;
  static const Color secondary = darkNav;
  static const Color accentRose = accentRed;
  static const Color accentGold = Color(0xFFFFB800);
  static const Color accentPurple = Color(0xFF9C27B0);
  static const Color accentOrange = Color(0xFFFF6D00);
  static const Color accentGreen = greenLight;

  static const double cardRadius = 16.0;
  static const double buttonRadius = 12.0;
  static const double screenPadding = 16.0;
  static const double buttonHeight = 48.0;

  static List<BoxShadow> get cardShadow => [
        BoxShadow(
          color: Colors.black.withAlpha(12),
          blurRadius: 8,
          offset: const Offset(0, 2),
        ),
      ];

  static List<BoxShadow> get neonGlow => [
        BoxShadow(
          color: greenLight.withAlpha(50),
          blurRadius: 16,
          spreadRadius: 1,
        ),
      ];

  static const LinearGradient heroGradient = LinearGradient(
    colors: [primary, greenLight],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
  static const LinearGradient streakGradient = heroGradient;
  static const LinearGradient profileGradient = heroGradient;
  static const LinearGradient rewardsGradient = heroGradient;

  static ThemeData get lightTheme {
    return ThemeData(
      brightness: Brightness.light,
      scaffoldBackgroundColor: background,
      primaryColor: primary,
      colorScheme: const ColorScheme.light(
        primary: primary,
        secondary: greenLight,
        surface: surfaceCard,
        error: accentRed,
        onPrimary: onPrimary,
        onSurface: textMain,
      ),
      fontFamily: null, // Системный шрифт
      textTheme: const TextTheme(
        headlineLarge: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: textMain),
        headlineMedium: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textMain),
        titleLarge: TextStyle(fontSize: 20, fontWeight: FontWeight.bold, color: textMain),
        titleMedium: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: textMain),
        bodyLarge: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: textMain),
        bodyMedium: TextStyle(fontSize: 14, fontWeight: FontWeight.normal, color: textSecondary),
        bodySmall: TextStyle(fontSize: 12, fontWeight: FontWeight.normal, color: textSecondary),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          backgroundColor: primary,
          foregroundColor: onPrimary,
          minimumSize: const Size(0, buttonHeight),
          textStyle: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(buttonRadius)),
          elevation: 0,
        ),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: background,
        elevation: 0,
        centerTitle: false,
        titleTextStyle: TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: textMain),
        iconTheme: IconThemeData(color: textMain),
      ),
    );
  }

  static ThemeData get darkTheme => lightTheme;
}
