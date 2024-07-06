import 'package:flutter/cupertino.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as app;
import 'package:flutter_gen/gen_l10n/app_localizations_es.dart';

class AppLocalization {
  factory AppLocalization() {
    return _instance;
  }

  factory AppLocalization.getInstance() {
    return _instance;
  }

  AppLocalization._internal();

  static final AppLocalization _instance = AppLocalization._internal();

  static app.AppLocalizations of(BuildContext context) {
    final location = app.AppLocalizations.of(context);

    if (location != null) {
      return location;
    }

    return AppLocalizationsEs();
  }
}
