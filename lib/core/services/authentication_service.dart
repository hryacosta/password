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
  String _refreshToken = '';
  String _accessToken = '';
  double _expiresIn = 60;
  DateTime? _createdTime;

  String get authorizationToken => _authorizationToken;

  String get refreshToken => _refreshToken;

  String get accessToken => _accessToken;

  double get expiresIn => _expiresIn;

  void dispose() {
    _destroySession();
  }

  void createSession({
    required String idToken,
    required String refreshToken,
    required String accessToken,
    double expiresIn = 60,
  }) {
    _authorizationToken = idToken;
    _refreshToken = refreshToken;
    _accessToken = accessToken;
    _expiresIn = expiresIn;
    _createdTime = DateTime.now();
  }

  void _destroySession() {
    _authorizationToken = '';
    _refreshToken = '';
    _accessToken = '';
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
