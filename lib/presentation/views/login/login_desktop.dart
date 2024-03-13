import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password/core/utils/app_localization.dart';
import 'package:password/core/utils/app_pattern.dart';
import 'package:password/presentation/components/button.dart';
import 'package:password/presentation/components/column_scroll_view.dart';
import 'package:password/presentation/components/input/input_field.dart';
import 'package:password/presentation/components/input/validators/validator.dart';
import 'package:password/presentation/providers/login_provider.dart';
import 'package:password/presentation/route/app_route.dart';
import 'package:provider/provider.dart';

class LoginDesktop extends StatefulWidget {
  const LoginDesktop({super.key});

  @override
  State<LoginDesktop> createState() => _LoginDesktopState();
}

class _LoginDesktopState extends State<LoginDesktop> {
  late LoginProvider provider;

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context);

    return ChangeNotifierProvider(
      create: (_) => provider,
      builder: (BuildContext context, _) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 184, vertical: 84),
            child: Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 16,
              ),
              child: ColumnScrollView(
                children: [
                  const Spacer(),
                  Consumer<LoginProvider>(
                    builder: (BuildContext context, LoginProvider value, _) =>
                        InputField(
                      labelText: localization.username,
                      maxLength: 64,
                      maxLengthEnforcement: MaxLengthEnforcement.enforced,
                      onChange: value.onChangeEmail,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(RegExp('[ ]')),
                        FilteringTextInputFormatter.deny(
                          AppPattern.regexToRemoveEmoji,
                        ),
                      ],
                      validator: Validator.emailValidator(
                        errorTextFormat: localization.email_format,
                        errorTextRequired: localization.email_required,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                    ),
                  ),
                  const SizedBox(
                    height: 84,
                  ),
                  Consumer<LoginProvider>(
                    builder: (BuildContext context, LoginProvider value, _) =>
                        InputField(
                      labelText: localization.password,
                      onChange: value.onChangePassword,
                      maxLength: 64,
                      obscureText: true,
                      enableSuggestions: false,
                      inputFormatters: [
                        FilteringTextInputFormatter.deny(
                          AppPattern.regexToRemoveEmoji,
                        ),
                      ],
                      validator: Validator.passwordValidator(
                        errorTextFormat: localization.password_format,
                        errorTextRequired: localization.password_required,
                        errorTextMustBeLonger:
                            localization.password_length_must_be_longer,
                      ),
                      keyboardType: TextInputType.visiblePassword,
                    ),
                  ),
                  const SizedBox(
                    height: 52,
                  ),
                  Consumer<LoginProvider>(
                    builder: (BuildContext context, LoginProvider value, _) =>
                        Button(
                      isLoading: value.isLoading,
                      label: localization.login,
                      onPress: () => value.signIn(
                        onSuccess: onSuccess,
                        onError: onError,
                      ),
                    ),
                  ),
                  const Spacer(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    provider = LoginProvider();
    super.initState();
  }

  Future<void> onError() async {}

  Future<void> onSuccess() async {
    const AppRoute().go(context);
  }
}
