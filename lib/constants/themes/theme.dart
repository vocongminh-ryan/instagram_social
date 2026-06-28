import 'package:flutter/material.dart';
import 'package:instagram_social/constants/themes/app_theme_extention.dart';
import 'package:instagram_social/constants/themes/app_typography.dart';

extension ThemeContext on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => theme.textTheme;
  AppThemeExtention get themeExt =>
      Theme.of(this).extension<AppThemeExtention>()!;
  AppTypography get typo => Theme.of(this).extension<AppTypography>()!;
}

class AppTheme {
  static const _primary = Color(0xFFE1306C);
  static const _secondary = Color(0xFF5851DB);
  static const _tertiary = Color(0xFFF77737);
  static const _darkBackground = Color(0xFF0B0F14);
  static const _darkSurface = Color(0xFF151A21);
  static const _lightBackground = Color(0xFFFAFAFA);
  static const _lightSurface = Color(0xFFFFFFFF);

  static ThemeData lightTheme() {
    const colorScheme = ColorScheme.light(
      primary: _primary,
      secondary: _secondary,
      tertiary: _tertiary,
      surface: _lightSurface,
      error: Color(0xFFE5484D),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Color(0xFF151515),
    );

    return _buildTheme(
      brightness: Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: _lightBackground,
      dividerColor: const Color(0xFFE6E6E6),
      appExtension: const AppThemeExtention(
        success: Color(0xFF22C55E),
        warning: Color(0xFFF59E0B),
        info: Color(0xFF0EA5E9),
        like: Color(0xFFFF3040),
        storyGradient: [
          Color(0xFFF58529),
          Color(0xFFDD2A7B),
          Color(0xFF8134AF),
          Color(0xFF515BD4),
        ],
        cardBorder: Color(0xFFE7E7E7),
        inputFill: Color(0xFFF4F5F7),
      ),
      typography: _typography(const Color(0xFF151515), const Color(0xFF737373)),
    );
  }

  static ThemeData darkTheme() {
    const colorScheme = ColorScheme.dark(
      primary: _primary,
      secondary: _secondary,
      tertiary: _tertiary,
      surface: _darkSurface,
      error: Color(0xFFFF6B6B),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Color(0xFFF5F5F5),
    );

    return _buildTheme(
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: _darkBackground,
      dividerColor: const Color(0xFF262D36),
      appExtension: const AppThemeExtention(
        success: Color(0xFF4ADE80),
        warning: Color(0xFFFBBF24),
        info: Color(0xFF38BDF8),
        like: Color(0xFFFF4D67),
        storyGradient: [
          Color(0xFFF58529),
          Color(0xFFDD2A7B),
          Color(0xFF8134AF),
          Color(0xFF515BD4),
        ],
        cardBorder: Color(0xFF27303A),
        inputFill: Color(0xFF202832),
      ),
      typography: _typography(const Color(0xFFF5F5F5), const Color(0xFFA3A3A3)),
    );
  }

  static ThemeData _buildTheme({
    required Brightness brightness,
    required ColorScheme colorScheme,
    required Color scaffoldBackgroundColor,
    required Color dividerColor,
    required AppThemeExtention appExtension,
    required AppTypography typography,
  }) {
    final textTheme = _textTheme(colorScheme.onSurface);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      dividerColor: dividerColor,
      fontFamily: 'Roboto',
      textTheme: textTheme,
      appBarTheme: AppBarTheme(
        centerTitle: true,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: scaffoldBackgroundColor,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: textTheme.titleLarge,
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        selectedItemColor: colorScheme.primary,
        unselectedItemColor: colorScheme.onSurface.withValues(alpha: 0.55),
        type: BottomNavigationBarType.fixed,
        showUnselectedLabels: true,
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: BorderSide(color: appExtension.cardBorder),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: appExtension.inputFill,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide(color: colorScheme.primary),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          minimumSize: const Size.fromHeight(48),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: typography.button,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.primary,
          minimumSize: const Size.fromHeight(48),
          side: BorderSide(color: colorScheme.primary),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          textStyle: typography.button,
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          foregroundColor: colorScheme.primary,
          textStyle: typography.button,
        ),
      ),
      chipTheme: ChipThemeData(
        backgroundColor: appExtension.inputFill,
        selectedColor: colorScheme.primary.withValues(alpha: 0.14),
        labelStyle: textTheme.labelLarge,
        side: BorderSide(color: appExtension.cardBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      extensions: <ThemeExtension<dynamic>>[
        appExtension,
        typography,
      ],
    );
  }

  static TextTheme _textTheme(Color textColor) {
    return TextTheme(
      displayLarge: TextStyle(
        color: textColor,
        fontSize: 34,
        fontWeight: FontWeight.w700,
        height: 1.18,
      ),
      headlineMedium: TextStyle(
        color: textColor,
        fontSize: 24,
        fontWeight: FontWeight.w700,
        height: 1.25,
      ),
      titleLarge: TextStyle(
        color: textColor,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 1.3,
      ),
      titleMedium: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.35,
      ),
      bodyLarge: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.5,
      ),
      bodyMedium: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.45,
      ),
      labelLarge: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.2,
      ),
      labelSmall: TextStyle(
        color: textColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.25,
      ),
    );
  }

  static AppTypography _typography(Color textColor, Color mutedColor) {
    return AppTypography(
      display: TextStyle(
        color: textColor,
        fontSize: 34,
        fontWeight: FontWeight.w700,
        height: 1.18,
      ),
      title: TextStyle(
        color: textColor,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 1.3,
      ),
      subtitle: TextStyle(
        color: mutedColor,
        fontSize: 15,
        fontWeight: FontWeight.w500,
        height: 1.4,
      ),
      body: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.45,
      ),
      caption: TextStyle(
        color: mutedColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.25,
      ),
      button: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w700,
        height: 1.2,
      ),
    );
  }
}
