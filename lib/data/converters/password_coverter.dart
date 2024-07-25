import 'dart:convert';

import 'package:drift/drift.dart';
import 'package:password/data/models/password_model.dart';

class PasswordCoverter extends TypeConverter<PasswordModel, String> {
  const PasswordCoverter();

  @override
  PasswordModel fromSql(String fromDb) {
    return PasswordModel.fromJson(json.decode(fromDb) as Map<String, dynamic>);
  }

  @override
  String toSql(PasswordModel value) {
    return json.encode(value.toJson());
  }
}
