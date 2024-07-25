import 'package:dio/dio.dart';

extension HttpResponse on Response<Map<String, dynamic>> {
  bool get isOk {
    if (statusCode == null) {
      return false;
    }

    return (statusCode! ~/ 100) == 2;
  }
}
