import 'dart:async';

import 'package:flutter/material.dart';
import 'package:password/app.dart';
import 'package:password/core/utils/logger.dart';

void main() {
  runZonedGuarded(
    () async {
      WidgetsFlutterBinding.ensureInitialized();

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
