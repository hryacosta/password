import 'dart:async';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:password/core/services/authentication_service.dart';
import 'package:password/presentation/views/app/app_page.dart';
import 'package:password/presentation/views/home/home_page.dart';
import 'package:password/presentation/views/login/login_page.dart';
import 'package:password/presentation/views/settings/settings_page.dart';

part 'app_route.g.dart';

@TypedGoRoute<AppRoute>(
  path: '/',
  name: 'app',
)
class AppRoute extends GoRouteData {
  const AppRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const AppPage();

  @override
  FutureOr<String?> redirect(BuildContext context, GoRouterState state) {
    if (!AuthenticationService.getInstance().isSignedIn) {
      return '/login';
    }

    return super.redirect(context, state);
  }
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

@TypedGoRoute<LoginRoute>(path: '/login', name: 'login')
class LoginRoute extends GoRouteData {
  const LoginRoute();

  @override
  Widget build(BuildContext context, GoRouterState state) => const LoginPage();
}

final $routerConfig = GoRouter(routes: $appRoutes);
