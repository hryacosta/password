import 'package:drift/drift.dart';
import 'package:password/core/services/app_database.dart';
import 'package:password/data/datasources/password_local_datasource.dart';
import 'package:password/data/models/password_model.dart';
import 'package:uuid/uuid.dart';

class PasswordLocalDataSourceImpl implements PasswordLocalDataSource {
  PasswordLocalDataSourceImpl({required this.database, required this.uuid});

  final Uuid uuid;
  final AppDatabase database;

  @override
  Future<void> addPassword(PasswordModel param) async {
    await database.into(database.password).insert(
          PasswordCompanion(
            title: Value(param.title),
            uuid: Value(uuid.v4()),
            username: Value(param.username),
            password: Value(param.password),
            updatedAt: Value(DateTime.now()),
          ),
        );
  }

  @override
  Future<void> deletePassword(PasswordModel param) async {
    await (database.delete(database.password)
          ..where((element) => element.uuid.equals(param.uuid.toString())))
        .go();
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
  Future<PasswordModel> updatePassword(PasswordModel param) async {
    await (database.update(database.password)
          ..where((element) => element.uuid.equals(param.uuid.toString())))
        .write(
      PasswordCompanion(
        title: Value(param.title),
        uuid: Value(param.uuid.toString()),
        username: Value(param.username),
        password: Value(param.password),
        updatedAt: Value(DateTime.now()),
      ),
    );

    return param;
  }

  @override
  Future<int> counts() async {
    final result = await database.select(database.password).get();

    return result.length;
  }
}
