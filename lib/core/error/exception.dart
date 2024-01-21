import 'package:json_annotation/json_annotation.dart';

part 'exception.g.dart';

interface class IException implements Exception {
  IException(this.message, {this.extra});

  String? message;
  dynamic extra;
}

final class CustomException extends IException {
  CustomException(
    super.message, {
    required this.code,
    super.extra,
  });

  int code;
}

/// Exception thrown when an error occurs while fetching data
@JsonSerializable(includeIfNull: false, checked: true)
final class ServerException extends CustomException {
  ServerException({
    required int code,
    String? message,
    dynamic extra,
  }) : super(message, code: code, extra: extra);

  factory ServerException.fromJson(Map<String, dynamic> json) =>
      _$ServerExceptionFromJson(json);

  Map<String, dynamic> toJson() => _$ServerExceptionToJson(this);
}

/// Exception thrown when network is not available
final class NetworkException extends IException {
  NetworkException(super.message, {super.extra});
}

/// Exception thrown when session is expired or dont exit
final class AuthenticationException extends IException {
  AuthenticationException(super.message, {super.extra});
}

/// Exception is throw when response data cant be cast to map
final class CastDataException extends IException {
  CastDataException(super.message, {super.extra});
}

/// Exception is throw when user is not authorized to access
final class UnauthorizedException extends IException {
  UnauthorizedException() : super('unauthorized');
}

/// Exception is throw when user is not authorized to access
final class ExpiredSessionException extends IException {
  ExpiredSessionException() : super('session has expired');
}
