import 'package:flutter/material.dart';
import 'package:password/core/config/injectable.dart';
import 'package:password/core/services/auth_service.dart';
import 'package:password/presentation/controllers/home_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController controller;

  @override
  void initState() {
    controller = HomeController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider.value(
      value: controller,
      child: Scaffold(
        body: Column(
          children: [
            const Center(
              child: Text('Home Page'),
            ),
            TextButton(
              onPressed: onPressed,
              child: const Text('Login'),
            ),
            TextButton(
              onPressed: onPressedSpaces,
              child: const Text('get spaces'),
            ),
            Text(controller.spaces.length.toString()),
          ],
        ),
      ),
    );
  }

  void onPressed() {
    sl<AuthService>().createSession(idToken: '');
  }

  Future<void> onPressedSpaces() async {
    await controller.getSpaces();
  }
}
