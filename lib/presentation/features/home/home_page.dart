import 'package:flutter/material.dart';
import 'package:password/config/route/app_route.dart';
import 'package:password/presentation/controllers/home_controller.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late HomeController _controller;

  @override
  void initState() {
    _controller = HomeController();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => _controller,
      builder: (context, child) => Scaffold(
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
            Consumer<HomeController>(
              builder: (
                BuildContext context,
                HomeController value,
                Widget? child,
              ) =>
                  Text(value.spaces.length.toString()),
            ),
          ],
        ),
      ),
    );
  }

  void onPressed() {
    const LoginRoute().go(context);
  }

  Future<void> onPressedSpaces() async {
    await _controller.getSpaces();
  }
}
