import 'package:flutter/material.dart';

abstract final class AppColorSwatch {
  static const Color instagramBlue = Color(0xFF0095F6);
  static const Color instagramBlueDark = Color(0xFF1877F2);
  static const Color instagramBlueLight = Color(0xFF4CB5F9);
  static const Color instagramPink = Color(0xFFE1306C);
  static const Color instagramRed = Color(0xFFED4956);
  static const Color instagramOrange = Color(0xFFF58529);
  static const Color instagramYellow = Color(0xFFFEDA77);
  static const Color instagramPurple = Color(0xFF8134AF);
  static const Color instagramIndigo = Color(0xFF515BD4);

  static const Color like = instagramRed;
  static const Color error = instagramRed;
  static const Color success = Color(0xFF1DB954);
  static const Color warning = Color(0xFFFCAF45);
  static const Color info = instagramBlue;

  static const Color white = Color(0xFFFFFFFF);
  static const Color black = Color(0xFF000000);
  static const Color lightBackground = white;
  static const Color lightSurface = white;
  static const Color lightInputFill = Color(0xFFFAFAFA);
  static const Color lightText = Color(0xFF262626);
  static const Color lightMutedText = Color(0xFF737373);
  static const Color lightBorder = Color(0xFFDBDBDB);

  static const Color darkBackground = black;
  static const Color darkSurface = Color(0xFF121212);
  static const Color darkInputFill = Color(0xFF1A1A1A);
  static const Color darkText = Color(0xFFF5F5F5);
  static const Color darkMutedText = Color(0xFFA3A3A3);
  static const Color darkBorder = Color(0xFF262626);

  static const List<Color> storyGradient = <Color>[
    instagramOrange,
    instagramYellow,
    instagramPink,
    instagramPurple,
    instagramIndigo,
  ];

  static const LinearGradient storyRingGradient = LinearGradient(
    colors: storyGradient,
    begin: Alignment.bottomLeft,
    end: Alignment.topRight,
  );

  static const MaterialColor primary = MaterialColor(
    0xFF0095F6,
    <int, Color>{
      50: Color(0xFFE6F4FE),
      100: Color(0xFFB0DFFC),
      200: Color(0xFF8ACFFA),
      300: Color(0xFF54BAF8),
      400: Color(0xFF33ADF7),
      500: instagramBlue,
      600: Color(0xFF0088E0),
      700: Color(0xFF006AAF),
      800: Color(0xFF005288),
      900: Color(0xFF003F68),
    },
  );

  static const MaterialColor accent = MaterialColor(
    0xFFE1306C,
    <int, Color>{
      50: Color(0xFFFCEAF0),
      100: Color(0xFFF6BED0),
      200: Color(0xFFF09EB9),
      300: Color(0xFFE97299),
      400: Color(0xFFE55685),
      500: instagramPink,
      600: Color(0xFFCD2C63),
      700: Color(0xFFA0224D),
      800: Color(0xFF7C1A3C),
      900: Color(0xFF5F142E),
    },
  );
}
