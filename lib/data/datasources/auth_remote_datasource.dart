import 'package:chopper/chopper.dart';
import 'package:injectable/injectable.dart';
import 'package:password/data/converters/session_coverter.dart';
import 'package:password/data/datasources/space_constants.dart';
import 'package:password/data/models/session_model.dart';

part 'auth_remote_datasource.chopper.dart';

@ChopperApi()
@injectable
abstract class AuthRemoteDataSource extends ChopperService {
  @factoryMethod
  static AuthRemoteDataSource create(ChopperClient client) =>
      _$AuthRemoteDataSource(client);

  @FactoryConverter(
    response: SessionConverter.response,
  )
  @Post(path: '$stage/login')
  Future<Response<SessionModel>> signIn(
    @Body() Map<String, String> body,
  );
}
