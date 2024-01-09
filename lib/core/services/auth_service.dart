import 'package:injectable/injectable.dart';

@singleton
final class AuthService {
  String _authorizationToken = '';
  int _expiresIn = 60;
  DateTime? _createdTime;

  String get token => _authorizationToken;

  int get expiresIn => _expiresIn;

  @disposeMethod
  void dispose() {
    destroySession();
  }

  void createSession({required String idToken, int expires = 60}) {
    _authorizationToken = idToken;
    _expiresIn = expires;
    _createdTime = DateTime.now();
  }

  void destroySession() {
    _authorizationToken = '';
    _expiresIn = 60;
    _createdTime = null;
  }

  bool get isSignedIn {
    if (_createdTime != null) {
      final currentTime = DateTime.now();
      final timeDiff = currentTime.difference(_createdTime!);

      if (timeDiff.inMinutes >= _expiresIn) {
        return false;
      } else {
        return true;
      }
    }

    return false;
  }

  Map<String, String> get headers {
    return {
      'Content-Type': 'application/json;charset=UTF-8',
      'Accept': 'application/json',
      'authorization': _authorizationToken,
    };
  }
}
