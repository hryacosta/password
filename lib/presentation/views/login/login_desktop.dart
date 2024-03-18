import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:password/core/utils/app_localization.dart';
import 'package:password/core/utils/app_pattern.dart';
import 'package:password/presentation/components/column_scroll_view.dart';
import 'package:password/presentation/components/input/input_field.dart';
import 'package:password/presentation/components/input/validators/validator.dart';
import 'package:password/presentation/providers/login_provider.dart';
import 'package:password/presentation/route/app_route.dart';
import 'package:password/presentation/theme/app_colors.dart';
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
        backgroundColor: AppColors.lightGrey,
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
                    builder: (BuildContext context, LoginProvider value, _) {
                      return CustomInput(
                        onChange: value.onChangeEmail,
                        hintText: localization.username,
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
                      );
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Consumer<LoginProvider>(
                    builder: (BuildContext context, LoginProvider value, _) {
                      return CustomInput(
                        onChange: value.onChangePassword,
                        hintText: localization.password,
                        obscureText: value.isObscure,
                        validator: Validator.passwordValidator(
                          errorTextFormat: localization.password_format,
                          errorTextRequired: localization.password_required,
                          errorTextMustBeLonger:
                              localization.password_length_must_be_longer,
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.deny(
                            AppPattern.regexToRemoveEmoji,
                          ),
                        ],
                        suffixIcon: IconButton(
                          onPressed: value.onToggleObscure,
                          icon: Icon(
                            value.isObscure
                                ? Icons.visibility
                                : Icons.visibility_off,
                            size: 16,
                            color: AppColors.indigo,
                          ),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Consumer<LoginProvider>(
                    builder: (BuildContext context, LoginProvider value, _) {
                      return TextButton(
                        onPressed: () => value.signIn(
                          onSuccess: onSuccess,
                          onError: onError,
                        ),
                        child: Text(
                          localization.login,
                          style:
                              Theme.of(context).textTheme.bodyLarge?.copyWith(
                                    color: AppColors.indigo,
                                    fontWeight: FontWeight.w900,
                                  ),
                        ),
                      );
                    },
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

class CustomInput extends StatelessWidget {
  const CustomInput({
    required this.hintText,
    required this.onChange,
    this.inputFormatters,
    this.validator,
    this.suffixIcon,
    this.obscureText = false,
    super.key,
  });

  final String? Function(String?)? validator;
  final String hintText;
  final Widget? suffixIcon;
  final List<TextInputFormatter>? inputFormatters;
  final void Function(String) onChange;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: InputField(
        labelText: '',
        maxLength: 64,
        maxLengthEnforcement: MaxLengthEnforcement.enforced,
        onChange: onChange,
        inputFormatters: inputFormatters,
        validator: validator,
        keyboardType: TextInputType.emailAddress,
        textInputAction: TextInputAction.next,
        obscureText: obscureText,
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              color: AppColors.onPrimary,
            ),
        decoration: InputDecoration(
          fillColor: AppColors.darkGrey,
          filled: true,
          hintText: hintText,
          counterText: '',
          contentPadding: const EdgeInsets.symmetric(
            vertical: 5,
            horizontal: 10,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.lightGrey,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.indigo,
            ),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide(
              color: AppColors.lightGrey,
            ),
          ),
          hintStyle: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: AppColors.onPrimary.withOpacity(0.5),
              ),
          suffixIcon: suffixIcon,
        ),
      ),
    );
  }
}
