import 'package:http/http.dart' as http;
import 'package:injectable/injectable.dart';
import 'package:password/core/error/server_error.dart';
import 'package:password/data/datasources/spaces_remote_datasource_impl.dart';
import 'package:password/data/models/space_model.dart';

@injectable
abstract class SpaceRemoteDataSource {
  @factoryMethod
  factory SpaceRemoteDataSource.from({
    required http.Client client,
  }) =>
      SpaceRemoteDataSourceImpl(client: client);

  /// Calls https://api endpoint.
  ///
  /// Throws a [ServerError] for all error codes.
  Future<List<SpaceModel>> getSpaces();

  /// Calls https://api endpoint.
  ///
  /// Throws a [ServerError] for all error codes.
  Future<void> addSpace({required SpaceModel space});

  /// Calls https://api endpoint.
  ///
  /// Throws a [ServerError] for all error codes.
  Future<void> updateSpace({required SpaceModel space});

  /// Calls https://api endpoint.
  ///
  /// Throws a [ServerError] for all error codes.
  Future<void> deleteSpace({required String id});
}
