import 'package:firebase_analytics/firebase_analytics.dart';

class Analytics {
  factory Analytics() {
    return _instance;
  }

  factory Analytics.getInstance() {
    return _instance;
  }

  Analytics._internal();

  static final Analytics _instance = Analytics._internal();

  final _delegate = FirebaseAnalytics.instance;

  Future<bool> isSupported() {
    return _delegate.isSupported();
  }

  Future<int?> getSessionId() {
    return _delegate.getSessionId();
  }
}
