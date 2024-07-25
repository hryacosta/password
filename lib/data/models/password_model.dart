import 'package:json_annotation/json_annotation.dart';
import 'package:password/domain/entities/password_entity.dart';

part 'password_model.g.dart';

@JsonSerializable(
  includeIfNull: false,
)
class PasswordModel extends PasswordEntity {
  const PasswordModel({
    required super.title,
    required super.username,
    required super.password,
    super.uuid,
    super.updatedAt,
  });

  factory PasswordModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordModelFromJson(json);

  @override
  @JsonKey(name: 'updated_at')
  String? get updatedAt {
    return super.updatedAt;
  }

  Map<String, dynamic> toJson() => _$PasswordModelToJson(this);

  PasswordModel copyWith({
    String? uuid,
    String? username,
    String? password,
    String? updatedAt,
    String? title,
  }) {
    return PasswordModel(
      uuid: uuid ?? this.uuid,
      username: username ?? this.username,
      password: password ?? this.password,
      updatedAt: updatedAt ?? this.updatedAt,
      title: title ?? this.title,
    );
  }
}
