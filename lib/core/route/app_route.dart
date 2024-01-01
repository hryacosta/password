import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:password/presentation/pages/home/home_page.dart';

part 'app_route.g.dart';

@TypedGoRoute<AppRoute>(
  path: '/',
  routes: <TypedGoRoute<GoRouteData>>[],
)
class AppRoute extends GoRouteData {
  const AppRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}
