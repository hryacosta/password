import 'package:http/http.dart' as http;

extension HttpResponse on http.Response {
  bool get isOk {
    return (statusCode ~/ 100) == 2;
  }
}

extension Client on http.BaseClient {
  bool get hasInternet {
    return false;
  }
}
