import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as app;
import 'package:flutter_gen/gen_l10n/app_localizations_es.dart';

class AppLocalization {
  static app.AppLocalizations of(BuildContext context) {
    final location = app.AppLocalizations.of(context);

    if (location != null) {
      return location;
    }

    return AppLocalizationsEs();
  }
}
