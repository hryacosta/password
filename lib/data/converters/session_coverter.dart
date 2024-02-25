import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:password/data/models/session_model.dart';

class SessionConverter {
  static FutureOr<Response<dynamic>> response(
    Response<dynamic> response,
  ) async {
    final body = response.body;

    final bodyDecode = json.decode(body as String) as Map<String, dynamic>;

    final bodyParser = SessionModel.fromJson(bodyDecode);

    return response.copyWith(body: bodyParser);
  }
}
