import 'package:equatable/equatable.dart';
import 'package:password/domain/entities/credential_entity.dart';

class PasswordEntity extends Equatable {
  const PasswordEntity({
    required this.title,
    required this.credential,
    this.uuid,
    this.updatedAt,
  });

  final CredentialEntity credential;
  final String title;
  final String? uuid;
  final DateTime? updatedAt;

  @override
  List<Object?> get props => [uuid, credential, title, updatedAt];
}
