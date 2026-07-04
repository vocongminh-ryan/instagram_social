import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_social/app/observers/analytics_router_observer.dart';
import 'package:instagram_social/app/router/router_app_name.dart';

class RouterAppConfig {
  factory RouterAppConfig() {
    return _instance;
  }
  RouterAppConfig._internal();
  static final RouterAppConfig _instance = RouterAppConfig._internal();

  final rootNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter? goRouter;

  bool get canPop => goRouter?.canPop() ?? false;

  final routerObservers = RouteObserver<ModalRoute<void>>();
  RouteObserver get routeObserverInstance => routerObservers;

  // Returns the current URI path from the active router delegate.
  String get currentPath {
    if (_instance.goRouter == null) {
      return '';
    }
    final lastMatch =
        _instance.goRouter!.routerDelegate.currentConfiguration.last;
    final matchList = lastMatch is ImperativeRouteMatch
        ? lastMatch.matches
        : _instance.goRouter!.routerDelegate.currentConfiguration;
    return matchList.uri.toString();
  }

  String getCurrentRouterName() {
    if (_instance.goRouter == null) return '';
    final lastMatch =
        _instance.goRouter!.routerDelegate.currentConfiguration.last;
    return lastMatch.route.name ?? '';
  }

  Future<void> initializeRouter({
    String initialLocation = '/${RouterAppName.home}',
  }) async {
    if (goRouter != null) {
      goRouter!.dispose();
      goRouter = null;
    }

    goRouter = GoRouter(
      navigatorKey: rootNavigatorKey,
      initialLocation: initialLocation,
      observers: [routerObservers, AnalyticsRouterObserver()],
      redirect: (context, state) {
        return null;
      },
      routes: [],
    );
  }
}
