import 'package:mocktail/mocktail.dart';
import 'package:password/data/datasources/auth_remote_datasource.dart';
import 'package:password/domain/repositories/authentication_repository.dart';
import 'package:password/domain/repositories/spaces_repository.dart';

class MockAuthRemoteDataSource extends Mock implements AuthRemoteDataSource {}

class MockSpaceRepository extends Mock implements SpaceRepository {}

class MockAuthRepository extends Mock implements AuthRepository {}
