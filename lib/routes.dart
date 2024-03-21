import 'package:routefly/routefly.dart';

import 'app/(public)/currency/currency_page.dart' as a0;
import 'app/(public)/splash_page.dart' as a1;

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
    key: '/splash',
    uri: Uri.parse('/splash'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.SplashPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  currency: '/currency',
  splash: '/splash',
);
