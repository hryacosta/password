import 'package:json_annotation/json_annotation.dart';
import 'package:password/domain/entities/session_entity.dart';

part 'session_model.g.dart';

@JsonSerializable(
  includeIfNull: false,
)
class SessionModel extends SessionEntity {
  const SessionModel({
    required super.idToken,
    required super.accessToken,
    required super.refreshToken,
    required super.expiresIn,
  });

  factory SessionModel.fromJson(Map<String, dynamic> json) =>
      _$SessionModelFromJson(json);

  Map<String, dynamic> toJson() => _$SessionModelToJson(this);
}
