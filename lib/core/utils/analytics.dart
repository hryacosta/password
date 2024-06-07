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

  Future<void> logBeginCheckout({
    double? value,
    String? currency,
    List<AnalyticsEventItem>? items,
    String? coupon,
    Map<String, Object>? parameters,
    AnalyticsCallOptions? callOptions,
  }) async {
    await _delegate.logBeginCheckout(
      value: value,
      currency: currency,
      items: items,
      coupon: coupon,
      parameters: parameters,
      callOptions: callOptions,
    );
  }

  Future<void> logLogin({
    String? loginMethod,
    Map<String, Object>? parameters,
    AnalyticsCallOptions? callOptions,
  }) async {
    await _delegate.logLogin(
      loginMethod: loginMethod,
      parameters: parameters,
      callOptions: callOptions,
    );
  }

  Future<void> logScreenView({
    String? screenClass,
    String? screenName,
    Map<String, Object>? parameters,
    AnalyticsCallOptions? callOptions,
  }) async {
    await _delegate.logScreenView(
      screenClass: screenClass,
      screenName: screenName,
      parameters: parameters,
      callOptions: callOptions,
    );
  }

  Future<void> logAppOpen({
    AnalyticsCallOptions? callOptions,
    Map<String, Object?>? parameters,
  }) async {
    await _delegate.logAppOpen();
  }
}
