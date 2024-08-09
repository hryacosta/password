import 'package:drift/drift.dart';
import 'package:password/data/models/password_model.dart';

@UseRowClass(PasswordModel)
class Password extends Table {
  IntColumn get id => integer().autoIncrement()();
  TextColumn get uuid => text().unique()();
  TextColumn get username => text()();
  TextColumn get password => text()();
  TextColumn get title => text()();
  DateTimeColumn get updatedAt => dateTime().named('updated_at').nullable()();
}
