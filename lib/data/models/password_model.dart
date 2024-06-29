import 'package:json_annotation/json_annotation.dart';
import 'package:password/domain/entities/password_entity.dart';

part 'password_model.g.dart';

@JsonSerializable(
  includeIfNull: false,
)
base class PasswordModel extends PasswordEntity {
  const PasswordModel({
    required super.username,
    required super.password,
    required super.updatedAt,
    required super.title,
  });

  factory PasswordModel.fromJson(Map<String, dynamic> json) =>
      _$PasswordModelFromJson(json);

  Map<String, dynamic> toJson() => _$PasswordModelToJson(this);

  PasswordModel copyWith({
    String? username,
    String? password,
    String? updatedAt,
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
