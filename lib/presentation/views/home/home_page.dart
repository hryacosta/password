import 'package:flutter/material.dart';
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
    return Container(
      margin: const EdgeInsets.all(24),
      child: Column(
        children: [
          InputField(
            onChange: (String value) {},
            labelText: 'username',
          ),
          InputField(
            onChange: (String value) {},
            labelText: 'password',
          ),
          const SizedBox(
            height: 24,
          ),
          SizedBox(width: 400, child: Button(label: 'add', onPress: onPress)),
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
