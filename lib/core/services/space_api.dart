import 'package:password/core/utils/api.dart';

class SpaceApi implements Api {
  factory SpaceApi() {
    return _instance;
  }

  factory SpaceApi.getInstance() {
    return _instance;
  }

  SpaceApi._internal();

  static final SpaceApi _instance = SpaceApi._internal();

  @override
  Uri baseUrl() {
    return Uri(
      scheme: scheme,
      host: host,
      pathSegments: [stage],
    );
  }

  @override
  String get host => 'faqpqzhd74.execute-api.us-east-1.amazonaws.com';

  @override
  String get scheme => 'https';

  @override
  String get stage => 'prod';

  static String get login => '/login';
  static String get logout => '/logout';
  static String get spaces => '/spaces';
}
