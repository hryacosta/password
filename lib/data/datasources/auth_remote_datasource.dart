import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:password/data/datasources/auth_remote_datasource_impl.dart';
import 'package:password/data/models/credential_model.dart';
import 'package:password/data/models/session_model.dart';

@injectable
abstract class AuthRemoteDataSource {
  @factoryMethod
  factory AuthRemoteDataSource.from({
    required Dio client,
  }) =>
      AuthRemoteDataSourceImpl(
        client: client,
      );

  Future<SessionModel> signIn(CredentialModel credential);

  Future<void> signOut();
}
