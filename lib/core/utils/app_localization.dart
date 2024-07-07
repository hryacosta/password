import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart' as c;
import 'package:flutter_gen/gen_l10n/app_localizations_es.dart';

class AppLocalization {
  static c.AppLocalizations of(BuildContext context) {
    final localtion = c.AppLocalizations.of(context);
    if (localtion != null) {
      return localtion;
    }

    return AppLocalizationsEs();
  }
}
