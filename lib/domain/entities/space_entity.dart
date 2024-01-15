import 'package:equatable/equatable.dart';

class SpaceEntity extends Equatable {
  const SpaceEntity({
    required this.id,
    required this.location,
    required this.name,
    required this.timestamp,
    this.photoUrl,
  });

  final String id;
  final String location;
  final String name;
  final String? photoUrl;
  final int timestamp;

  @override
  List<Object?> get props => [id, location, name, timestamp, photoUrl];
}
