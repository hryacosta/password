import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'space.g.dart';

@JsonSerializable(
  includeIfNull: false,
)
class Space extends Equatable {
  const Space({
    required this.id,
    required this.location,
    required this.name,
    required this.timestamp,
    this.photoUrl,
  });

  factory Space.fromJson(Map<String, dynamic> json) => _$SpaceFromJson(json);

  final String id;
  final String location;
  final String name;
  final String? photoUrl;
  final int timestamp;

  Map<String, dynamic> toJson() => _$SpaceToJson(this);

  @override
  List<Object?> get props => [id, location, name, timestamp, photoUrl];
}
