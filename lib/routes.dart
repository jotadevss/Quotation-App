import 'package:routefly/routefly.dart';

import 'app/(public)/currency/currency_page.dart' as a0;
import 'app/(public)/details/details_page.dart' as a1;
import 'app/(public)/home/home_page.dart' as a2;
import 'app/(public)/quotation/quotation_page.dart' as a3;
import 'app/(public)/splash_page.dart' as a4;

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
    key: '/details',
    uri: Uri.parse('/details'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a1.DetailsPage(),
    ),
  ),
  RouteEntity(
    key: '/home',
    uri: Uri.parse('/home'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a2.HomePage(),
    ),
  ),
  RouteEntity(
    key: '/quotation',
    uri: Uri.parse('/quotation'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a3.QuotationPagee(),
    ),
  ),
  RouteEntity(
    key: '/splash',
    uri: Uri.parse('/splash'),
    routeBuilder: (ctx, settings) => Routefly.defaultRouteBuilder(
      ctx,
      settings,
      const a4.SplashPage(),
    ),
  ),
];

const routePaths = (
  path: '/',
  currency: '/currency',
  details: '/details',
  home: '/home',
  quotation: '/quotation',
  splash: '/splash',
);
