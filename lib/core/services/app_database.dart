import 'package:drift/drift.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:password/data/models/password_model.dart';
import 'package:password/data/tables/password_table.dart';

part 'app_database.g.dart';

@DriftDatabase(tables: [Password])
class AppDatabase extends _$AppDatabase {
  AppDatabase([QueryExecutor? e]) : super(e ?? _openConnection());

  @override
  int get schemaVersion => 1;

  static QueryExecutor _openConnection() {
    return driftDatabase(name: 'password');
  }
}
