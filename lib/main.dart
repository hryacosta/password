import 'dart:async';

import 'package:flutter/material.dart';
import 'package:password/app.dart';
import 'package:password/core/config/firebase.dart';
import 'package:password/core/config/google_fonts.dart';
import 'package:password/core/config/injectable.dart';
import 'package:password/core/utils/logger.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Future.wait([injectableInit(), googleFonts(), firebaseConfig()]);

      runApp(App());
    },
    (error, stack) {
      logger.e(
        'runZonedGuarded un-handled async error',
        error: error,
        stackTrace: stack,
        time: DateTime.now(),
      );
    },
  );
}
