import 'dart:async';

import 'package:flutter/material.dart';
import 'package:password/app.dart';
import 'package:password/core/config/dependencies_config.dart';
import 'package:password/core/config/google_fonts_config.dart';
import 'package:password/core/utils/logger.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

      await Future.wait([dependenciesConfig(), googleFontsConfig()]);

      runApp(App());
    },
    (error, stack) async {
      logger.e(
        'runZonedGuarded un-handled async error',
        error: error,
        stackTrace: stack,
        time: DateTime.now(),
      );
    },
  );
}
