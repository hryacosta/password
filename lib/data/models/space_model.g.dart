// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpaceModel _$SpaceModelFromJson(Map<String, dynamic> json) => SpaceModel(
      id: json['id'] as String,
      location: json['location'] as String,
      name: json['name'] as String,
      photoUrl: json['photoUrl'] as String,
      timestamp: json['timestamp'] as int,
    );

Map<String, dynamic> _$SpaceModelToJson(SpaceModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'location': instance.location,
      'name': instance.name,
      'photoUrl': instance.photoUrl,
      'timestamp': instance.timestamp,
    };
