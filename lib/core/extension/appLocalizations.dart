import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsExtensions on AppLocalizations {
  String translate(String key) {
    try {
      return key;
    } catch (e) {
      return 'Key not found';
    }
  }
}
