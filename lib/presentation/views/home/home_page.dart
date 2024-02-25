import 'package:flutter/material.dart';
import 'package:password/presentation/providers/home_provider.dart';
import 'package:password/presentation/route/app_route.dart';
import 'package:provider/provider.dart';

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
    return ChangeNotifierProvider(
      create: (_) => _controller,
      builder: (context, child) => Scaffold(
        body: Column(
          children: [
            const Center(
              child: Text('Home Page'),
            ),
            TextButton(
              onPressed: onPressedSpaces,
              child: const Text('get spaces'),
            ),
            Consumer<HomeProvider>(
              builder: (
                BuildContext context,
                HomeProvider value,
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
