import 'package:json_annotation/json_annotation.dart';
import 'package:password/data/models/credential_model.dart';
import 'package:password/domain/entities/password_entity.dart';

part 'password_model.g.dart';

@JsonSerializable(includeIfNull: false)
class PasswordModel extends PasswordEntity {
  PasswordModel({
    required this.title,
    required this.username,
    required this.password,
    this.uuid,
    this.updatedAt,
  }) : super(
          title: title,
          uuid: uuid,
          updatedAt: updatedAt,
          credential: CredentialModel(username: username, password: password),
        );

  factory PasswordModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordModelFromJson(json);

  @override
  final String title;
  @override
  final String? uuid;
  @override
  @JsonKey(name: 'updated_at')
  final DateTime? updatedAt;
  final String username;
  final String password;

  Map<String, dynamic> toJson() => _$PasswordModelToJson(this);

  PasswordModel copyWith({
    String? uuid,
    String? username,
    String? password,
    DateTime? updatedAt,
    String? title,
  }) {
    return PasswordModel(
      username: username ?? this.username,
      password: password ?? this.password,
      updatedAt: updatedAt ?? this.updatedAt,
      title: title ?? this.title,
    );
  }
}
