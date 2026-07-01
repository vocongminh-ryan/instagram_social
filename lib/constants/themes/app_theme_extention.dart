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

  static const AppThemeExtention instagramLight = AppThemeExtention(
    success: Color(0xFF1DB954),
    warning: Color(0xFFFCAF45),
    info: Color(0xFF0095F6),
    like: Color(0xFFED4956),
    storyGradient: [
      Color(0xFFF58529),
      Color(0xFFFEDA77),
      Color(0xFFDD2A7B),
      Color(0xFF8134AF),
      Color(0xFF515BD4),
    ],
    cardBorder: Color(0xFFDBDBDB),
    inputFill: Color(0xFFFAFAFA),
  );

  static const AppThemeExtention instagramDark = AppThemeExtention(
    success: Color(0xFF32D74B),
    warning: Color(0xFFFCAF45),
    info: Color(0xFF4CB5F9),
    like: Color(0xFFFF3040),
    storyGradient: [
      Color(0xFFF58529),
      Color(0xFFFEDA77),
      Color(0xFFDD2A7B),
      Color(0xFF8134AF),
      Color(0xFF515BD4),
    ],
    cardBorder: Color(0xFF262626),
    inputFill: Color(0xFF1A1A1A),
  );

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
        storyGradient.length < other.storyGradient.length
            ? storyGradient.length
            : other.storyGradient.length,
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
