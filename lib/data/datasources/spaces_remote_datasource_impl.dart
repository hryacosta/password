import 'package:http/http.dart' as http;
import 'package:password/data/datasources/spaces_remote_datasource.dart';
import 'package:password/data/models/space_model.dart';

class SpaceRemoteDataSourceImpl implements SpaceRemoteDataSource {
  SpaceRemoteDataSourceImpl({required this.client});

  final http.Client client;

  @override
  Future<void> addSpace({required SpaceModel space}) {
    // TODO: implement addSpace
    throw UnimplementedError();
  }

  @override
  Future<void> deleteSpace({required String id}) {
    // TODO: implement deleteSpace
    throw UnimplementedError();
  }

  @override
  Future<List<SpaceModel>> getSpaces() {
    // TODO: implement getSpaces
    throw UnimplementedError();
  }

  @override
  Future<void> updateSpace({required SpaceModel space}) {
    // TODO: implement updateSpace
    throw UnimplementedError();
  }
}
