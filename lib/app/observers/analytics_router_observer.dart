import 'dart:developer';

import 'package:flutter/widgets.dart';

typedef AnalyticsRouteChanged = void Function({
  required String action,
  required String screenName,
  String? previousScreenName,
});

class AnalyticsRouterObserver extends NavigatorObserver {
  AnalyticsRouterObserver({this.onRouteChanged});

  final AnalyticsRouteChanged? onRouteChanged;

  @override
  void didPush(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPush(route, previousRoute);
    _trackRouteChange(
      action: 'push',
      route: route,
      previousRoute: previousRoute,
    );
  }

  @override
  void didPop(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didPop(route, previousRoute);
    _trackRouteChange(
      action: 'pop',
      route: previousRoute,
      previousRoute: route,
    );
  }

  @override
  void didReplace({Route<dynamic>? newRoute, Route<dynamic>? oldRoute}) {
    super.didReplace(newRoute: newRoute, oldRoute: oldRoute);
    _trackRouteChange(
      action: 'replace',
      route: newRoute,
      previousRoute: oldRoute,
    );
  }

  @override
  void didRemove(Route<dynamic> route, Route<dynamic>? previousRoute) {
    super.didRemove(route, previousRoute);
    _trackRouteChange(
      action: 'remove',
      route: previousRoute,
      previousRoute: route,
    );
  }

  void _trackRouteChange({
    required String action,
    required Route<dynamic>? route,
    required Route<dynamic>? previousRoute,
  }) {
    final screenName = _screenName(route);

    if (screenName == null) {
      return;
    }

    final previousScreenName = _screenName(previousRoute);

    if (onRouteChanged != null) {
      onRouteChanged!(
        action: action,
        screenName: screenName,
        previousScreenName: previousScreenName,
      );
      return;
    }

    log(
      '$action: $screenName'
      '${previousScreenName == null ? '' : ', previous: $previousScreenName'}',
      name: 'AnalyticsRouterObserver',
    );
  }

  String? _screenName(Route<dynamic>? route) {
    if (route == null) {
      return null;
    }

    final name = route.settings.name;
    if (name != null && name.isNotEmpty) {
      return name;
    }

    if (route is PageRoute<dynamic>) {
      return route.runtimeType.toString();
    }

    return null;
  }
}
