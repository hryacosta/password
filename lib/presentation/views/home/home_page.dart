import 'package:flutter/material.dart';
import 'package:password/core/utils/app_localization.dart';
import 'package:password/presentation/components/button.dart';
import 'package:password/presentation/components/input/input_field.dart';
import 'package:password/presentation/providers/home_provider.dart';
import 'package:password/presentation/route/app_route.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeProvider _controller;

  @override
  void initState() {
    _controller = HomeProvider();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context);
    return Container(
      margin: const EdgeInsets.all(24),
      child: Column(
        children: [
          InputField(
            onChange: _controller.changeTitle,
            labelText: localization.login,
          ),
          InputField(
            onChange: _controller.changeUsername,
            labelText: localization.username,
          ),
          InputField(
            onChange: _controller.changePassword,
            labelText: localization.password,
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(
            width: 400,
            child: Button(
              label: localization.add,
              onPress: onPress,
            ),
          ),
        ],
      ),
    );
  }

  void onPress() {}

  void onPressed() {
    const LoginRoute().go(context);
  }

  Future<void> onPressedSpaces() async {
    await _controller.getSpaces();
  }
}
