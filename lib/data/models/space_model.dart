import 'package:json_annotation/json_annotation.dart';
import 'package:password/domain/entities/space.dart';

part 'space_model.g.dart';

@JsonSerializable()
class SpaceModel extends Space {
  SpaceModel({
    required super.id,
    required super.location,
    required super.name,
    required super.photoUrl,
    required super.timestamp,
  });

  factory SpaceModel.fromJson(Map<String, dynamic> json) =>
      _$SpaceModelFromJson(json);

  Map<String, dynamic> toJson() => _$SpaceModelToJson(this);
}
