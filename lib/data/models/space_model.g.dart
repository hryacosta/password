// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'space_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SpaceModel _$SpaceModelFromJson(Map<String, dynamic> json) => SpaceModel(
      id: json['id'] as String,
      location: json['location'] as String,
      name: json['name'] as String,
      timestamp: (json['timestamp'] as num).toInt(),
      photoUrl: json['photoUrl'] as String? ?? '',
    );

Map<String, dynamic> _$SpaceModelToJson(SpaceModel instance) {
  final val = <String, dynamic>{
    'id': instance.id,
    'location': instance.location,
    'name': instance.name,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('photoUrl', instance.photoUrl);
  val['timestamp'] = instance.timestamp;
  return val;
}
