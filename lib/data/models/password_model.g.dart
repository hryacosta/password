// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'password_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PasswordModel _$PasswordModelFromJson(Map<String, dynamic> json) =>
    PasswordModel(
      uuid: json['uuid'] as String,
      username: json['username'] as String,
      password: json['password'] as String,
      updatedAt: json['updatedAt'] as String? ?? '',
      title: json['title'] as String,
    );

Map<String, dynamic> _$PasswordModelToJson(PasswordModel instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'username': instance.username,
      'password': instance.password,
      'title': instance.title,
      'updatedAt': instance.updatedAt,
    };
