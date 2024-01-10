import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:password/domain/entities/space.dart';

part 'space_model.g.dart';

@JsonSerializable(
  includeIfNull: false,
)
class SpaceModel extends Equatable {
  const SpaceModel(this.spaces);

  factory SpaceModel.fromJson(Map<String, dynamic> json) =>
      _$SpaceModelFromJson(json);

  final List<Space> spaces;

  Map<String, dynamic> toJson() => _$SpaceModelToJson(this);

  @override
  List<Object?> get props => [spaces];
}
