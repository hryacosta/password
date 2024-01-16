import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:password/data/datasources/space_constants.dart';
import 'package:password/data/models/space_model.dart';

part 'space_remote_datasource.chopper.dart';

@injectable
@ChopperApi(baseUrl: '$scheme/$baseUrl')
abstract class SpaceRemoteDataSource extends ChopperService {
  @factoryMethod
  factory SpaceRemoteDataSource.from({
    required SpaceRemoteDataSource remoteDateSource,
  }) =>
      SpaceRepositoryImpl(
        remoteDateSource: remoteDateSource,
      );
  static SpaceRemoteDataSource create([ChopperClient? client]) =>
      _$SpaceRemoteDataSource(client);

  // @FactoryConverter(
  //   response: convertResponse,
  // )
  @Get(
    path: '$env/spaces',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8',
      'Accept': 'application/json',
    },
  )
  Future<Response<List<SpaceModel>>> getSpaces();

  @Post(
    path: '$env/spaces',
    headers: {
      'Content-Type': 'application/json;charset=UTF-8',
      'Accept': 'application/json',
    },
  )
  Future<Response<void>> addSpace(@Body() SpaceModel space);
}

// Response<List<SpaceModel>> convertResponse<T>(
//   Response<dynamic> res,
// ) {
//   final Map<String, dynamic> body = res.body;
//
//   final option =
//       Option<List<dynamic>>.of(body['spaces']).getOrElse(() => <dynamic>[]);
//
//   final spaces = option
//       .map(
//         (element) => SpaceModel.fromJson(element as Map<String, dynamic>),
//       )
//       .toList();
//
//   return res.copyWith(body: spaces);
// }
