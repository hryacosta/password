import 'package:flutter/foundation.dart';
import 'package:password/config/injectable.dart';
import 'package:password/core/services/authentication_service.dart';
import 'package:password/core/utils/analytics.dart';
import 'package:password/domain/usecases/sign_in.dart';
import 'package:password/domain/usecases/sign_out.dart';

class LoginProvider with ChangeNotifier, DiagnosticableTreeMixin {
  LoginProvider();

  String _username = '';
  String _password = '';
  bool _isObscure = true;
  bool isLoading = false;

  bool get isObscure => _isObscure;

  void onChangeEmail(String value) {
    _username = value;
    notifyListeners();
  }

  void onChangePassword(String value) {
    _password = value;
    notifyListeners();
  }

  void onToggleObscure() {
    _isObscure = !_isObscure;
    notifyListeners();
  }

  Future<void> signIn({
    required VoidCallback onSuccess,
    VoidCallback? onError,
  }) async {
    isLoading = true;
    final res = await sl<SignIn>().call(
      Param(
        password: _password,
        username: _username,
      ),
    );

    res.fold((l) {
      onError?.call();
    }, (session) {
      AuthenticationService.getInstance().createSession(
        idToken: session.idToken,
        refreshToken: session.refreshToken,
        accessToken: session.accessToken,
        expiresIn: session.expiresIn / 60,
      );
      onSuccess.call();
      Analytics().logLogin(loginMethod: 'signIn');
    });

    isLoading = false;

    notifyListeners();
  }

  Future<void> signOut() async {
    await sl<SignOut>()();
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(StringProperty('username', _username))
      ..add(FlagProperty('isObscure', value: isObscure));
  }
}
