import 'dart:async';

import 'package:flutter/material.dart';
import 'package:password/app.dart';
import 'package:password/config/firebase.dart';
import 'package:password/config/google_fonts.dart';
import 'package:password/config/injectable.dart';
import 'package:password/core/utils/logger.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Future.wait([injectableInit(), googleFonts(), firebaseCofig()]);

      runApp(App());
    },
    (error, stack) {
      logger.e(
        'runZonedGuarded un-handled async error',
        error: error,
        stackTrace: stack,
        time: DateTime.now(),
      );

      // FirebaseCrashlytics.instance.recordError(error, stack);
    },
  );
}
