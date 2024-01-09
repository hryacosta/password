import 'package:json_annotation/json_annotation.dart';

part 'exception.g.dart';

abstract class CustomException implements Exception {
  CustomException({required this.code, this.message, this.extra});

  int code;
  String? message;
  dynamic extra;
}

@JsonSerializable(includeIfNull: false)
class ServerException extends CustomException {
  ServerException({required super.code, super.message, super.extra});

  factory ServerException.fromJson(Map<String, dynamic> json) =>
      _$ServerExceptionFromJson(json);

  Map<String, dynamic> toJson() => _$ServerExceptionToJson(this);
}

@JsonSerializable(includeIfNull: false)
class NetworkException extends CustomException {
  NetworkException({required super.code, super.message, super.extra});

  factory NetworkException.fromJson(Map<String, dynamic> json) =>
      _$NetworkExceptionFromJson(json);

  Map<String, dynamic> toJson() => _$NetworkExceptionToJson(this);
}
