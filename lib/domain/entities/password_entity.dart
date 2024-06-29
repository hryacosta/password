import 'package:equatable/equatable.dart';

base class PasswordEntity extends Equatable {
  const PasswordEntity({
    required this.title,
    required this.username,
    required this.password,
    this.updatedAt = '',
  });

  final String username;
  final String password;
  final String title;
  final String updatedAt;

  @override
  List<Object?> get props => [username, password, title, updatedAt];
}
