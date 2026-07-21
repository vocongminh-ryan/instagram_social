import 'package:flutter/material.dart';

class AppGlobalKeys {
  AppGlobalKeys._();

  static final GlobalKey<NavigatorState> rootNavigator =
      GlobalKey<NavigatorState>();

  static final GlobalKey<NavigatorState> shellNavigator =
      GlobalKey<NavigatorState>();
}
