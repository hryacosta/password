import 'dart:nativewrappers/_internal/vm/lib/mirrors_patch.dart';

import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsExtensions on AppLocalizations {
  String translate(String attr) {
    try {
      final field = reflect(this).getField(Symbol(attr));

      return field.reflectee.toString();
    } catch (e) {
      return attr;
    }
  }
}
