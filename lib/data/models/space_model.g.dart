// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpaceModel _$SpaceModelFromJson(Map<String, dynamic> json) => SpaceModel(
      (json['spaces'] as List<dynamic>)
          .map((e) => Space.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SpaceModelToJson(SpaceModel instance) =>
    <String, dynamic>{
      'spaces': instance.spaces,
    };
