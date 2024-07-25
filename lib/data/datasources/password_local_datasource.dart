import 'package:injectable/injectable.dart';
import 'package:password/core/services/app_database.dart';
import 'package:password/data/datasources/password_local_datasource_impl.dart';
import 'package:password/data/models/password_model.dart';
import 'package:uuid/uuid.dart';

@injectable
abstract class PasswordLocalDataSource {
  @factoryMethod
  factory PasswordLocalDataSource.from({
    required Uuid uuid,
    required AppDatabase database,
  }) =>
      PasswordLocalDataSourceImpl(uuid: uuid, database: database);

  Future<void> addPassword(PasswordModel password);

  Future<PasswordModel> updatePassword(PasswordModel id);

  Future<void> deletePassword(PasswordModel id);

  Future<List<PasswordModel>> getAllPasswords();

  Future<PasswordModel> getPassword(PasswordModel id);

  Future<int> counts();
}
