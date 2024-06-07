import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:fpdart/fpdart.dart';
import 'package:password/data/models/space_model.dart';

class SpaceConverter {
  static FutureOr<Response<dynamic>> response(
    Response<dynamic> response,
  ) async {
    final body = const Utf8Decoder().convert(response.bodyBytes);
    final bodyDecode = json.decode(body) as Map<String, dynamic>;

    final spacesList =
        Option.of(bodyDecode['spaces'] as List<dynamic>).getOrElse(
      () => [],
    );

    final bodyParser = spacesList
        .map(
          (element) => SpaceModel.fromJson(element as Map<String, dynamic>),
        )
        .toList();

    return response.copyWith(body: bodyParser);
  }
}
