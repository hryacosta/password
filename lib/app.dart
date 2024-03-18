import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:password/presentation/route/app_route.dart';
import 'package:password/presentation/theme/light.dart';

class App extends StatelessWidget {
  App({super.key});

  final _routerConfig = $routerConfig;
  final _theme = $lightTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: _theme,
      routerConfig: _routerConfig,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
      localeResolutionCallback: localeResolutionCallback,
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
        .firstWhere((element) => element.languageCode == 'es');
  }
}
