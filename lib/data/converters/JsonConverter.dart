import 'dart:async';
import 'dart:convert';

import 'package:chopper/chopper.dart';
import 'package:fpdart/fpdart.dart';
import 'package:password/core/error/exception.dart';
import 'package:password/data/models/space_model.dart';

class JsonCoverter {
  static FutureOr<Response<dynamic>> getSpacesConverter(
    Response<dynamic> response,
  ) async {
    final body = json.decode(response.body) as Map<String, dynamic>;
    if (response.isSuccessful) {
      final spacesList = Option.of(body['spaces'] as List<dynamic>).getOrElse(
        () => [],
      );
      final bodyParser = spacesList
          .map(
            (element) => SpaceModel.fromJson(element as Map<String, dynamic>),
          )
          .toList();

      return response.copyWith(body: bodyParser);
    }

    throw ServerException(code: 1, message: 'serverError');
  }
}
