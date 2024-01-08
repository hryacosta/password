// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerError _$ServerErrorFromJson(Map json) => ServerError(
      json['result'] as String,
      code: json['code'] as int? ?? 500,
      data: json['errors'],
    );

Map<String, dynamic> _$ServerErrorToJson(ServerError instance) {
  final val = <String, dynamic>{
    'code': instance.code,
    'result': instance.message,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('errors', instance.data);
  return val;
}
