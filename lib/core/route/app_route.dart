import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:password/presentation/pages/app/app_page.dart';
import 'package:password/presentation/pages/home/home_page.dart';
import 'package:password/presentation/pages/settings/settings_page.dart';

part 'app_route.g.dart';

@TypedGoRoute<AppRoute>(
  path: '/',
  name: 'app',
)
class AppRoute extends GoRouteData {
  const AppRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AppPage();
}

@TypedGoRoute<HomeRoute>(path: '/home', name: 'home')
class HomeRoute extends GoRouteData {
  const HomeRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const HomePage();
}

@TypedGoRoute<SettingsRoute>(path: '/settings', name: 'settings')
class SettingsRoute extends GoRouteData {
  const SettingsRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) =>
      const SettingsPage();
}

final $routerConfig = GoRouter(routes: $appRoutes);
