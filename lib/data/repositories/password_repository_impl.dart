import 'package:fpdart/fpdart.dart';
import 'package:password/data/datasources/password_local_datasource.dart';
import 'package:password/data/models/password_model.dart';
import 'package:password/domain/entities/password_entity.dart';
import 'package:password/domain/failures/failure.dart';
import 'package:password/domain/repositories/password_repository.dart';

class PasswordRepositoryImpl implements PasswordRepository {
  PasswordRepositoryImpl({required this.localDataSource});

  final PasswordLocalDataSource localDataSource;

  @override
  Future<Either<Failure, bool>> add(PasswordEntity arg) async {
    try {
      await localDataSource.addPassword(arg as PasswordModel);
      return right(true);
    } catch (error) {
      return left(LocalFailure(error));
    }
  }

  @override
  Future<Either<Failure, bool>> delete(PasswordEntity arg) {
    throw UnimplementedError();
  }

  @override
  Future<Either<Failure, bool>> update(PasswordEntity arg) {
    throw UnimplementedError();
  }
}
