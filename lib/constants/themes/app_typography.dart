import 'package:flutter/material.dart';

@immutable
class AppTypography extends ThemeExtension<AppTypography> {
  const AppTypography({
    required this.display,
    required this.title,
    required this.subtitle,
    required this.body,
    required this.caption,
    required this.button,
  });

  final TextStyle display;
  final TextStyle title;
  final TextStyle subtitle;
  final TextStyle body;
  final TextStyle caption;
  final TextStyle button;

  static AppTypography instagram({
    required Color textColor,
    required Color mutedColor,
  }) {
    return AppTypography(
      display: TextStyle(
        color: textColor,
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 1.18,
      ),
      title: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.25,
      ),
      subtitle: TextStyle(
        color: mutedColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.3,
      ),
      body: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.3,
      ),
      caption: TextStyle(
        color: mutedColor,
        fontSize: 12,
        fontWeight: FontWeight.w400,
        height: 1.25,
      ),
      button: const TextStyle(
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.2,
      ),
    );
  }

  static TextTheme instagramTextTheme(Color textColor) {
    return TextTheme(
      displayLarge: TextStyle(
        color: textColor,
        fontSize: 28,
        fontWeight: FontWeight.w700,
        height: 1.18,
      ),
      headlineMedium: TextStyle(
        color: textColor,
        fontSize: 20,
        fontWeight: FontWeight.w700,
        height: 1.25,
      ),
      titleLarge: TextStyle(
        color: textColor,
        fontSize: 18,
        fontWeight: FontWeight.w700,
        height: 1.25,
      ),
      titleMedium: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w600,
        height: 1.25,
      ),
      bodyLarge: TextStyle(
        color: textColor,
        fontSize: 16,
        fontWeight: FontWeight.w400,
        height: 1.35,
      ),
      bodyMedium: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w400,
        height: 1.3,
      ),
      labelLarge: TextStyle(
        color: textColor,
        fontSize: 14,
        fontWeight: FontWeight.w600,
        height: 1.2,
      ),
      labelSmall: TextStyle(
        color: textColor,
        fontSize: 12,
        fontWeight: FontWeight.w500,
        height: 1.2,
      ),
    );
  }

  @override
  AppTypography copyWith({
    TextStyle? display,
    TextStyle? title,
    TextStyle? subtitle,
    TextStyle? body,
    TextStyle? caption,
    TextStyle? button,
  }) {
    return AppTypography(
      display: display ?? this.display,
      title: title ?? this.title,
      subtitle: subtitle ?? this.subtitle,
      body: body ?? this.body,
      caption: caption ?? this.caption,
      button: button ?? this.button,
    );
  }

  @override
  AppTypography lerp(ThemeExtension<AppTypography>? other, double t) {
    if (other is! AppTypography) {
      return this;
    }

    return AppTypography(
      display: TextStyle.lerp(display, other.display, t)!,
      title: TextStyle.lerp(title, other.title, t)!,
      subtitle: TextStyle.lerp(subtitle, other.subtitle, t)!,
      body: TextStyle.lerp(body, other.body, t)!,
      caption: TextStyle.lerp(caption, other.caption, t)!,
      button: TextStyle.lerp(button, other.button, t)!,
    );
  }
}
