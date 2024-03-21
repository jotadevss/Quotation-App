import 'package:flutter/material.dart';
import 'package:quotation_currency_app/routes.dart';
import 'package:routefly/routefly.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      theme: ThemeData(
        fontFamily: 'Qanelas',
      ),
      routerConfig: Routefly.routerConfig(
        routes: routes,
        initialPath: routePaths.splash,
      ),
    );
  }
}
