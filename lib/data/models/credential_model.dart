import 'package:json_annotation/json_annotation.dart';
import 'package:password/domain/entities/credential_entity.dart';

part 'credential_model.g.dart';

@JsonSerializable(includeIfNull: false)
class CredentialModel extends CredentialEntity {
  const CredentialModel({
    required super.username,
    required super.password,
  });

  factory CredentialModel.fromJson(Map<String, dynamic> json) =>
      _$CredentialModelFromJson(json);

  Map<String, dynamic> toJson() => _$CredentialModelToJson(this);
}
