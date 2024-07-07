import 'package:equatable/equatable.dart';

base class PasswordEntity extends Equatable {
  const PasswordEntity({
    required this.uuid,
    required this.title,
    required this.username,
    required this.password,
    this.updatedAt = '',
  });

  const PasswordEntity.create({
    required this.password,
    required this.username,
    required this.title,
    this.uuid = '',
    this.updatedAt = '',
  });

  final String uuid;
  final String username;
  final String password;
  final String title;
  final String updatedAt;

  @override
  List<Object?> get props => [uuid, username, password, title, updatedAt];
}
