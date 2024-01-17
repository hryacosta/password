import 'dart:io';

import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:password/data/datasources/space_constants.dart';
import 'package:password/data/models/space_model.dart';

part 'space_remote_datasource.chopper.dart';

@ChopperApi(baseUrl: '$env/spaces')
@injectable
abstract class SpaceRemoteDataSource extends ChopperService {
  @factoryMethod
  static SpaceRemoteDataSource create(ChopperClient client) =>
      _$SpaceRemoteDataSource(client);

  @Post(
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.acceptHeader: 'application/json',
    },
  )
  Future<Response<void>> addSpace(@Body() SpaceModel space);

  @Get(
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=UTF-8',
      HttpHeaders.acceptHeader: 'application/json',
    },
  )
  Future<Response<List<SpaceModel>>> getSpaces();
}
