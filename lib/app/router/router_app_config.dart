import 'package:flutter/widgets.dart';
import 'package:go_router/go_router.dart';
import 'package:instagram_social/app/router/navigation_screen.dart';
import 'package:instagram_social/app/router/router_app_name.dart';
import 'package:instagram_social/constants/app_global_keys.dart';
import 'package:instagram_social/presentation/home/home_screen.dart';
import 'package:instagram_social/presentation/reels/reels_screen.dart';

class RouterAppConfig {
  factory RouterAppConfig() {
    return _instance;
  }
  RouterAppConfig._internal();
  static final RouterAppConfig _instance = RouterAppConfig._internal();

  final rootNavigatorKey = GlobalKey<NavigatorState>();

  GoRouter? goRouter;

  Future<void> initializeRouter({
    String initialLocation = '/${RouterAppName.home}',
  }) async {
    if (goRouter != null) {
      goRouter!.dispose();
      goRouter = null;
    }

    goRouter = GoRouter(
      navigatorKey: AppGlobalKeys.rootNavigator,
      initialLocation: initialLocation,
      redirect: (context, state) {
        return null;
      },
      routes: [
        ShellRoute(
          navigatorKey: AppGlobalKeys.shellNavigator,
          builder: (context, state, child) {
            return NavigationScreen(child: child);
          },
          routes: [
            GoRoute(
              path: '/${RouterAppName.home}',
              builder: (context, state) {
                return const HomeScreen();
              },
            ),
            GoRoute(
              path: '/${RouterAppName.reel}',
              builder: (context, state) {
                return const ReelsScreen();
              },
            ),
          ],
        ),
      ],
    );
  }
}
