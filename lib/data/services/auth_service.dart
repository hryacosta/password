final class AuthenticationService {
  factory AuthenticationService() {
    return _instance;
  }

  factory AuthenticationService.getInstance() {
    return _instance;
  }

  AuthenticationService._internal();

  static final AuthenticationService _instance =
      AuthenticationService._internal();

  String _authorizationToken = '';
  int _expiresIn = 60;
  DateTime? _createdTime;

  String get authorizationToken => _authorizationToken;

  int get expiresIn => _expiresIn;

  void dispose() {
    _destroySession();
  }

  void createSession({required String idToken, int expires = 60}) {
    _authorizationToken = idToken;
    _expiresIn = expires;
    _createdTime = DateTime.now();
  }

  void _destroySession() {
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
}
