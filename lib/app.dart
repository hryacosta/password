import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:password/core/route/app_route.dart';

class App extends StatelessWidget {
  App({super.key});

  final GoRouter _routerConfig = GoRouter(routes: $appRoutes);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: _routerConfig,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      localeResolutionCallback: localeResolutionCallback,
      supportedLocales: const [
        Locale('es'),
        Locale('en'),
      ],
    );
  }

  Locale localeResolutionCallback(
    Locale? locale,
    Iterable<Locale> supportedLocales,
  ) {
    if (locale != null && supportedLocales.contains(locale)) {
      return locale;
    }

    return supportedLocales
        .firstWhere((element) => element.languageCode == 'en');
  }
}
