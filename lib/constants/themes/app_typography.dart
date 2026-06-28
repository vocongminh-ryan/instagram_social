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
