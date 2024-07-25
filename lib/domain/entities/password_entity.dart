import 'package:equatable/equatable.dart';

class PasswordEntity extends Equatable {
  const PasswordEntity({
    required this.title,
    required this.username,
    required this.password,
    this.uuid,
    this.updatedAt,
  });

  final String username;
  final String password;
  final String title;
  final String? uuid;
  final String? updatedAt;

  @override
  List<Object?> get props => [uuid, username, password, title, updatedAt];
}
