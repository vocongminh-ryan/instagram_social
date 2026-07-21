import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:instagram_social/app/router/router_app_config.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  void initState() {
    super.initState();
    _initializeApp();
  }

  void _initializeApp() async {
    await RouterAppConfig().initializeRouter();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: RouterAppConfig().goRouter,
      builder: (context, child) {
        return child ?? const SizedBox.shrink();
      },
    );
  }
}
