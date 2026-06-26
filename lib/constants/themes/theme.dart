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

class AppTheme {}
