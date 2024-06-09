import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:password/presentation/theme/light.dart';

class TestWidget extends StatelessWidget {
  const TestWidget({
    required this.child,
    super.key,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    final theme = $lightTheme;

    return MaterialApp(
      theme: theme,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: const [
        Locale('es'),
        Locale('en'),
      ],
      home: child,
    );
  }
}
