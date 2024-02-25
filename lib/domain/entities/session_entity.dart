import 'package:equatable/equatable.dart';

class SessionEntity extends Equatable {
  const SessionEntity({
    required this.idToken,
    required this.accessToken,
    required this.refreshToken,
    required this.expiresIn,
  });

  final String idToken;
  final String accessToken;
  final String refreshToken;
  final int expiresIn;

  @override
  List<Object?> get props => [idToken, accessToken, refreshToken, expiresIn];
}
