// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerException _$ServerExceptionFromJson(Map<String, dynamic> json) =>
    ServerException(
      code: json['code'] as int,
      message: json['message'] as String?,
      extra: json['extra'],
    );

Map<String, dynamic> _$ServerExceptionToJson(ServerException instance) {
  final val = <String, dynamic>{
    'code': instance.code,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('extra', instance.extra);
  return val;
}

NetworkException _$NetworkExceptionFromJson(Map<String, dynamic> json) =>
    NetworkException(
      code: json['code'] as int,
      message: json['message'] as String?,
      extra: json['extra'],
    );

Map<String, dynamic> _$NetworkExceptionToJson(NetworkException instance) {
  final val = <String, dynamic>{
    'code': instance.code,
  };

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('extra', instance.extra);
  return val;
}
