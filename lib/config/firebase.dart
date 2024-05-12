import 'dart:isolate';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:password/core/utils/crashlytics.dart';
import 'package:password/firebase_options.dart';

Future<void> firebaseCofig() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  if (kIsWeb) {
    return;
  }
  if (defaultTargetPlatform
      case TargetPlatform.android ||
          TargetPlatform.iOS ||
          TargetPlatform.macOS) {
    final crashlytics = Crashlytics();

    await crashlytics.setCrashlyticsCollectionEnabled(enabled: !kDebugMode);

    FlutterError.onError = crashlytics.recordFlutterFatalError;
    PlatformDispatcher.instance.onError = (error, stack) {
      crashlytics.recordError(
        error,
        stack,
        fatal: true,
        printDetails: true,
      );
      return true;
    };

    Isolate.current.addErrorListener(
      RawReceivePort((List<dynamic> pair) async {
        final errorAndStacktrace = pair;
        await crashlytics.recordError(
          errorAndStacktrace.first,
          errorAndStacktrace.last,
          fatal: true,
        );
      }).sendPort,
    );
  }
}
