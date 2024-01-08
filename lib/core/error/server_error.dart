import 'package:json_annotation/json_annotation.dart';

part 'server_error.g.dart';

/// Exception thrown when an error occurs while fetching data from the cache
@JsonSerializable(
  anyMap: true,
  includeIfNull: false,
)
class ServerError implements Exception {
  ServerError(this.message, {this.code = 500, this.data});

  factory ServerError.fromJson(Map<String, dynamic> json) =>
      _$ServerErrorFromJson(json);

  int code;
  @JsonKey(name: 'result')
  String message;
  @JsonKey(name: 'errors')
  dynamic data;

  Map<String, dynamic> toJson() => _$ServerErrorToJson(this);
}
