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
      await localDataSource.addPassword(
        PasswordModel.arg(
          username: arg.username,
          password: arg.password,
          title: arg.title,
        ),
      );
      return right(true);
    } catch (error) {
      return left(LocalFailure(error));
    }
  }

  @override
  Future<Either<Failure, bool>> delete(PasswordEntity arg) async {
    try {
      final params = PasswordModel(
        uuid: arg.uuid,
        username: arg.username,
        password: arg.password,
        updatedAt: arg.updatedAt,
        title: arg.title,
      );

      await localDataSource.deletePassword(params);
      return right(true);
    } catch (error) {
      return left(LocalFailure(error));
    }
  }

  @override
  Future<Either<Failure, bool>> update(PasswordEntity arg) async {
    try {
      await localDataSource.updatePassword(arg as PasswordModel);
      return right(true);
    } catch (error) {
      return left(LocalFailure(error));
    }
  }

  @override
  Future<Either<Failure, int>> count() async {
    try {
      final res = await localDataSource.counts();
      return right(res);
    } catch (error) {
      return left(LocalFailure(error));
    }
  }
}
