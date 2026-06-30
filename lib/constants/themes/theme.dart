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
  static const _primary = Color(0xFF0095F6);
  static const _secondary = Color(0xFFE1306C);
  static const _tertiary = Color(0xFFFCAF45);
  static const _lightBackground = Color(0xFFFFFFFF);
  static const _lightSurface = Color(0xFFFFFFFF);
  static const _darkBackground = Color(0xFF000000);
  static const _darkSurface = Color(0xFF121212);

  static ThemeData lightTheme() {
    const colorScheme = ColorScheme.light(
      primary: _primary,
      secondary: _secondary,
      tertiary: _tertiary,
      inversePrimary: Color(0xFF1877F2),
      surface: _lightSurface,
      error: Color(0xFFED4956),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Color(0xFF262626),
      outline: Color(0xFFDBDBDB),
    );

    return _buildTheme(
      brightness: Brightness.light,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: _lightBackground,
      dividerColor: const Color(0xFFDBDBDB),
      appExtension: const AppThemeExtention(
        success: Color(0xFF22C55E),
        warning: Color(0xFFF59E0B),
        info: Color(0xFF0095F6),
        like: Color(0xFFED4956),
        storyGradient: [
          Color(0xFFFCAF45),
          Color(0xFFFFDC80),
          Color(0xFFE1306C),
          Color(0xFFC13584),
          Color(0xFF833AB4),
        ],
        cardBorder: Color(0xFFDBDBDB),
        inputFill: Color(0xFFFAFAFA),
      ),
      typography: _typography(const Color(0xFF262626), const Color(0xFF737373)),
    );
  }

  static ThemeData darkTheme() {
    const colorScheme = ColorScheme.dark(
      primary: _primary,
      secondary: _secondary,
      tertiary: _tertiary,
      inversePrimary: Color(0xFF4CB5F9),
      surface: _darkSurface,
      error: Color(0xFFFF6B7A),
      onPrimary: Colors.white,
      onSecondary: Colors.white,
      onSurface: Color(0xFFF5F5F5),
      outline: Color(0xFF262626),
    );

    return _buildTheme(
      brightness: Brightness.dark,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: _darkBackground,
      dividerColor: const Color(0xFF262626),
      appExtension: const AppThemeExtention(
        success: Color(0xFF4ADE80),
        warning: Color(0xFFFBBF24),
        info: Color(0xFF4CB5F9),
        like: Color(0xFFFF3040),
        storyGradient: [
          Color(0xFFFCAF45),
          Color(0xFFFFDC80),
          Color(0xFFE1306C),
          Color(0xFFC13584),
          Color(0xFF833AB4),
        ],
        cardBorder: Color(0xFF262626),
        inputFill: Color(0xFF1A1A1A),
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
    final textTheme = AppTypography.instagramTextTheme(colorScheme.onSurface);

    return ThemeData(
      useMaterial3: true,
      brightness: brightness,
      colorScheme: colorScheme,
      scaffoldBackgroundColor: scaffoldBackgroundColor,
      dividerColor: dividerColor,
      fontFamily: 'Roboto',
      textTheme: textTheme,
      iconTheme: IconThemeData(
        color: colorScheme.onSurface,
        size: 26,
      ),
      primaryIconTheme: IconThemeData(
        color: colorScheme.onSurface,
        size: 26,
      ),
      appBarTheme: AppBarTheme(
        centerTitle: false,
        elevation: 0,
        scrolledUnderElevation: 0,
        backgroundColor: scaffoldBackgroundColor,
        foregroundColor: colorScheme.onSurface,
        titleTextStyle: textTheme.titleLarge,
        iconTheme: IconThemeData(color: colorScheme.onSurface, size: 26),
        actionsIconTheme: IconThemeData(color: colorScheme.onSurface, size: 26),
      ),
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: colorScheme.surface,
        elevation: 0,
        selectedIconTheme: IconThemeData(color: colorScheme.onSurface, size: 27),
        unselectedIconTheme: IconThemeData(
          color: colorScheme.onSurface,
          size: 27,
        ),
        selectedItemColor: colorScheme.onSurface,
        unselectedItemColor: colorScheme.onSurface,
        type: BottomNavigationBarType.fixed,
        showSelectedLabels: false,
        showUnselectedLabels: false,
      ),
      navigationBarTheme: NavigationBarThemeData(
        height: 52,
        elevation: 0,
        backgroundColor: colorScheme.surface,
        indicatorColor: Colors.transparent,
        iconTheme: WidgetStatePropertyAll(
          IconThemeData(color: colorScheme.onSurface, size: 27),
        ),
        labelBehavior: NavigationDestinationLabelBehavior.alwaysHide,
      ),
      cardTheme: CardThemeData(
        color: colorScheme.surface,
        elevation: 0,
        margin: EdgeInsets.zero,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(4),
          side: BorderSide(color: appExtension.cardBorder),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: appExtension.inputFill,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 10,
        ),
        hintStyle: typography.body.copyWith(color: typography.caption.color),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: appExtension.cardBorder),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: appExtension.cardBorder),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(6),
          borderSide: BorderSide(color: colorScheme.onSurface),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          elevation: 0,
          backgroundColor: colorScheme.primary,
          foregroundColor: colorScheme.onPrimary,
          disabledBackgroundColor: colorScheme.primary.withValues(alpha: 0.35),
          disabledForegroundColor: colorScheme.onPrimary.withValues(alpha: 0.75),
          minimumSize: const Size.fromHeight(44),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
          textStyle: typography.button,
        ),
      ),
      outlinedButtonTheme: OutlinedButtonThemeData(
        style: OutlinedButton.styleFrom(
          foregroundColor: colorScheme.onSurface,
          minimumSize: const Size.fromHeight(44),
          side: BorderSide(color: appExtension.cardBorder),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
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
        selectedColor: colorScheme.primary.withValues(alpha: 0.12),
        labelStyle: textTheme.labelLarge,
        side: BorderSide(color: appExtension.cardBorder),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: colorScheme.primary,
        selectionColor: colorScheme.primary.withValues(alpha: 0.22),
        selectionHandleColor: colorScheme.primary,
      ),
      snackBarTheme: SnackBarThemeData(
        behavior: SnackBarBehavior.floating,
        backgroundColor: colorScheme.onSurface,
        contentTextStyle: typography.body.copyWith(color: colorScheme.surface),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      ),
      extensions: <ThemeExtension<dynamic>>[
        appExtension,
        typography,
      ],
    );
  }

  static AppTypography _typography(Color textColor, Color mutedColor) {
    return AppTypography.instagram(
      textColor: textColor,
      mutedColor: mutedColor,
    );
  }
}
