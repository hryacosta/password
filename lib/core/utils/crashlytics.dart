import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';

class Crashlytics {
  factory Crashlytics() {
    return _instance;
  }

  factory Crashlytics.getInstance() {
    return _instance;
  }

  Crashlytics._internal();

  static final Crashlytics _instance = Crashlytics._internal();

  final _delegate = FirebaseCrashlytics.instance;

  Future<void> recordFlutterFatalError(
    FlutterErrorDetails flutterErrorDetails,
  ) {
    return _delegate.recordFlutterFatalError(flutterErrorDetails);
  }

  Future<void> recordError(
    dynamic exception,
    StackTrace? stack, {
    dynamic reason,
    Iterable<Object> information = const [],
    bool? printDetails,
    bool fatal = false,
  }) async {
    return _delegate.recordError(
      exception,
      stack,
      reason: reason,
      information: information,
      printDetails: printDetails,
      fatal: fatal,
    );
  }

  Future<void> setCrashlyticsCollectionEnabled({
    required bool enabled,
  }) async =>
      _delegate.setCrashlyticsCollectionEnabled(enabled);
}
