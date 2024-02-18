import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:password/config/route/app_route.dart';
import 'package:password/config/theme/dark.dart';
import 'package:password/config/theme/light.dart';

class App extends StatelessWidget {
  App({super.key});

  final _routerConfig = $routerConfig;
  final _theme = $lightTheme;
  final _darkTheme = $darkTheme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: _theme,
      darkTheme: _darkTheme,
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
