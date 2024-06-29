import 'package:injectable/injectable.dart';
import 'package:password/core/db/db_schema.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

@singleton
class DBService {
  const DBService();

  Future<Database> open() async {
    final directory = await getApplicationDocumentsDirectory();
    final dbPath = directory.path;
    final path = join(dbPath, 'password.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (Database db, int version) async => db.execute(dbSchema),
    );
  }
}
