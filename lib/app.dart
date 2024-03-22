import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:password/presentation/providers/app_provider.dart';
import 'package:password/presentation/route/app_route.dart';
import 'package:password/presentation/theme/dark.dart';
import 'package:password/presentation/theme/light.dart';
import 'package:provider/provider.dart';

class App extends StatelessWidget {
  App({super.key});

  final _routerConfig = $routerConfig;
  final _theme = $lightTheme;
  final _darkTheme = $darkTheme;
  final _appProvider = AppProvider();

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AppProvider>.value(value: _appProvider),
      ],
      builder: (context, _) => ValueListenableBuilder<ThemeMode>(
        valueListenable: context.watch<AppProvider>().themeMode,
        builder: (_, mode, __) => MaterialApp.router(
          debugShowCheckedModeBanner: false,
          theme: _theme,
          darkTheme: _darkTheme,
          routerConfig: _routerConfig,
          themeMode: mode,
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          localeResolutionCallback: localeResolutionCallback,
        ),
      ),
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
