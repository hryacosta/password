import 'package:fpdart/fpdart.dart';
import 'package:injectable/injectable.dart';
import 'package:password/data/datasources/password_local_datasource.dart';
import 'package:password/data/repositories/password_repository_impl.dart';
import 'package:password/domain/entities/password_entity.dart';
import 'package:password/domain/failures/failure.dart';

@injectable
abstract class PasswordRepository {
  @factoryMethod
  factory PasswordRepository.from({
    required PasswordLocalDataSource localDataSource,
  }) =>
      PasswordRepositoryImpl(localDataSource: localDataSource);

  Future<Either<Failure, bool>> add(PasswordEntity arg);
  Future<Either<Failure, bool>> delete(PasswordEntity arg);
  Future<Either<Failure, bool>> update(PasswordEntity arg);
}
