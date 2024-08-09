import 'package:equatable/equatable.dart';

class CredentialEntity extends Equatable {
  const CredentialEntity({
    required this.username,
    required this.password,
  });

  final String username;
  final String password;

  @override
  List<Object?> get props => [username, password];
}
