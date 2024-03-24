import 'package:routefly/routefly.dart';

import 'app/(public)/currency/currency_page.dart' as a0;
import 'app/(public)/home/home_page.dart' as a1;
import 'app/(public)/splash_page.dart' as a2;

List<RouteEntity> get routes => [
  RouteEntity(
    key: '/currency',
    uri: Uri.parse('/currency'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a0.CurrencyPage(),
    ),
  ),
  RouteEntity(
    key: '/home',
    uri: Uri.parse('/home'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.HomePage(),
    ),
  ),
  RouteEntity(
    key: '/splash',
    uri: Uri.parse('/splash'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.SplashPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  currency: '/currency',
  home: '/home',
  splash: '/splash',
);
