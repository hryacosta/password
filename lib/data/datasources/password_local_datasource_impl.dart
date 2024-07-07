import 'package:password/core/db/db_schema.dart';
import 'package:password/core/services/db_service.dart';
import 'package:password/data/datasources/password_local_datasource.dart';
import 'package:password/data/models/password_model.dart';
import 'package:uuid/uuid.dart';

class PasswordLocalDataSourceImpl implements PasswordLocalDataSource {
  PasswordLocalDataSourceImpl({required this.db, required this.uuid});

  final DBService db;
  final Uuid uuid;

  @override
  Future<void> addPassword(PasswordModel arg) async {
    final values = arg.copyWith(
      updatedAt: DateTime.now().toIso8601String(),
      uuid: uuid.v4(),
      username: arg.username,
      password: arg.password,
      title: arg.title,
    );

    final database = await db.open();

    await database.insert(tablePassword, values.toJson());

    await database.close();
  }

  @override
  Future<void> deletePassword(PasswordModel arg) async {
    final database = await db.open();

    await database.delete(tablePassword, where: 'id =?', whereArgs: [arg.uuid]);

    await database.close();
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
  Future<PasswordModel> updatePassword(PasswordModel id) async {
    final database = await db.open();

    await database.update(tablePassword, id.toJson());

    await database.close();

    return id;
  }
}
