import 'package:injectable/injectable.dart';
import 'package:password/core/services/db_service.dart';
import 'package:password/data/datasources/password_local_datasource_impl.dart';
import 'package:password/data/models/password_model.dart';

@injectable
abstract class PasswordLocalDataSource {
  @factoryMethod
  factory PasswordLocalDataSource.from({
    required DBService db,
  }) =>
      PasswordLocalDataSourceImpl(db: db);

  Future<void> addPassword(PasswordModel password);

  Future<PasswordModel> updatePassword(PasswordModel id);

  Future<void> deletePassword(PasswordModel id);

  Future<List<PasswordModel>> getAllPasswords();

  Future<PasswordModel> getPassword(PasswordModel id);
}
