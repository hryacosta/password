import 'package:flutter/material.dart';
import 'package:password/core/utils/logger.dart';
import 'package:password/presentation/components/button.dart';
import 'package:password/presentation/components/column_scroll_view.dart';
import 'package:password/presentation/components/input/input_field.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 16,
          ),
          child: ColumnScrollView(
            children: [
              const Spacer(),
              InputField(
                labelText: 'Email',
                onChange: onChangeEmail,
              ),
              const SizedBox(
                height: 16,
              ),
              InputField(
                labelText: 'Password',
                onChange: onChangePassword,
                obscureText: true,
                enableSuggestions: false,
                keyboardType: TextInputType.visiblePassword,
                autoValidateMode: AutovalidateMode.always,
                decoration: const InputDecoration(
                  icon: Icon(
                    Icons.lock,
                  ),
                ),
              ),
              const Spacer(),
              const Buttom(label: 'login'),
            ],
          ),
        ),
      ),
    );
  }

  void onChangeEmail(String email) {
    logger.d(email);
  }

  void onChangePassword(String password) {
    logger.d(password);
  }
}
