import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:password/data/converters/space_converter.dart';
import 'package:password/data/datasources/space_constants.dart';
import 'package:password/data/models/space_model.dart';
import 'package:password/domain/entities/space_entity.dart';

part 'space_remote_datasource.chopper.dart';

@ChopperApi(baseUrl: '$stage/spaces')
@injectable
abstract class SpaceRemoteDataSource extends ChopperService {
  @factoryMethod
  static SpaceRemoteDataSource create(ChopperClient client) =>
      _$SpaceRemoteDataSource(client);

  @Post()
  Future<Response<void>> addSpace(@Body() SpaceEntity space);

  @FactoryConverter(
    response: SpaceConverter.response,
  )
  @Get()
  Future<Response<List<SpaceModel>>> getSpaces();

  @Delete()
  Future<Response<void>> deleteSpace(@Path() String id);
}
