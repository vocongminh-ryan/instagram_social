import 'package:flutter/material.dart';

@immutable
class AppThemeExtention extends ThemeExtension<AppThemeExtention> {
  const AppThemeExtention({
    required this.success,
    required this.warning,
    required this.info,
    required this.like,
    required this.storyGradient,
    required this.cardBorder,
    required this.inputFill,
  });

  final Color success;
  final Color warning;
  final Color info;
  final Color like;
  final List<Color> storyGradient;
  final Color cardBorder;
  final Color inputFill;

  @override
  AppThemeExtention copyWith({
    Color? success,
    Color? warning,
    Color? info,
    Color? like,
    List<Color>? storyGradient,
    Color? cardBorder,
    Color? inputFill,
  }) {
    return AppThemeExtention(
      success: success ?? this.success,
      warning: warning ?? this.warning,
      info: info ?? this.info,
      like: like ?? this.like,
      storyGradient: storyGradient ?? this.storyGradient,
      cardBorder: cardBorder ?? this.cardBorder,
      inputFill: inputFill ?? this.inputFill,
    );
  }

  @override
  AppThemeExtention lerp(
    covariant ThemeExtension<AppThemeExtention>? other,
    double t,
  ) {
    if (other is! AppThemeExtention) {
      return this;
    }

    return AppThemeExtention(
      success: Color.lerp(success, other.success, t)!,
      warning: Color.lerp(warning, other.warning, t)!,
      info: Color.lerp(info, other.info, t)!,
      like: Color.lerp(like, other.like, t)!,
      storyGradient: List<Color>.generate(
        storyGradient.length,
        (index) => Color.lerp(
          storyGradient[index],
          other.storyGradient[index],
          t,
        )!,
      ),
      cardBorder: Color.lerp(cardBorder, other.cardBorder, t)!,
      inputFill: Color.lerp(inputFill, other.inputFill, t)!,
    );
  }
}
