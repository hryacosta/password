// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exception.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ServerException _$ServerExceptionFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'ServerException',
      json,
      ($checkedConvert) {
        final val = ServerException(
          code: $checkedConvert('code', (v) => (v as num).toInt()),
          message: $checkedConvert('message', (v) => v as String?),
          extra: $checkedConvert('extra', (v) => v),
        );
        return val;
      },
    );

Map<String, dynamic> _$ServerExceptionToJson(ServerException instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('message', instance.message);
  writeNotNull('extra', instance.extra);
  val['code'] = instance.code;
  return val;
}
