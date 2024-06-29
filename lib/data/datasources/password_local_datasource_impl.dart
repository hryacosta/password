import 'package:password/core/services/db_service.dart';
import 'package:password/core/utils/logger.dart';
import 'package:password/data/datasources/password_local_datasource.dart';
import 'package:password/data/models/password_model.dart';

class PasswordLocalDataSourceImpl implements PasswordLocalDataSource {
  PasswordLocalDataSourceImpl({required this.db});

  final DBService db;

  @override
  Future<void> addPassword(PasswordModel arg) async {
    try {
      final values = arg.copyWith(
        updatedAt: DateTime.now().toIso8601String(),
      );

      logger.d(values);
      final database = await db.open();

      // await database.insert(tablePassword, values.toJson());

      await database.close();
    } catch (error) {
      logger.e('', error: error);
    }
  }

  @override
  Future<void> deletePassword(PasswordModel id) {
    throw UnimplementedError();
  }

  @override
  Future<List<PasswordModel>> getAllPasswords() {
    throw UnimplementedError();
  }

  @override
  Future<PasswordModel> getPassword(PasswordModel id) {
    throw UnimplementedError();
  }

  @override
  Future<PasswordModel> updatePassword(PasswordModel id) {
    throw UnimplementedError();
  }
}
