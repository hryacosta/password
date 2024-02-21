import 'package:password/domain/entities/person.dart';

class Teacher extends Person {
  Teacher({
    required super.name,
    required super.lastname,
    required super.birthdate,
    required super.birthplace,
  });
}
