import 'package:json_annotation/json_annotation.dart';
import 'package:password/domain/entities/space_entity.dart';

part 'space_model.g.dart';

@JsonSerializable(
  includeIfNull: false,
)
class SpaceModel extends SpaceEntity {
  const SpaceModel({
    required super.id,
    required super.location,
    required super.name,
    required super.timestamp,
    super.photoUrl,
  });

  factory SpaceModel.fromJson(Map<String, dynamic> json) =>
      _$SpaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpaceModelToJson(this);
}
