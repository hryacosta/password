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

const idToken =
    "eyJraWQiOiJaRUZOY1dHM1hIemR4MFlBRVVVaTFpRk1ReHZoNCtYVWVGYlV0OXlvN1wvYz0iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIzNWNjZTBmOS01YWJkLTQzMjItYjE5Ny0yZGE0OWJlOTUwMWEiLCJjb2duaXRvOmdyb3VwcyI6WyJhZG1pbnMiXSwiZW1haWxfdmVyaWZpZWQiOnRydWUsImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC51cy1lYXN0LTEuYW1hem9uYXdzLmNvbVwvdXMtZWFzdC0xX2k2b2JpTEFORiIsImNvZ25pdG86dXNlcm5hbWUiOiJnYWJyaWVsIiwib3JpZ2luX2p0aSI6IjI4NTAyMTUwLWMyNDUtNDY5NS1hZTcxLTAxNmQ4MjIyZmY0MCIsImNvZ25pdG86cm9sZXMiOlsiYXJuOmF3czppYW06OjkzMzIwMjI1ODYzMDpyb2xlXC9BdXRoU3RhY2stQ29nbml0b0FkbWluUm9sZTRDMTBGQkE0LXJxcWtCaGE1RUFRQSJdLCJhdWQiOiJtMHUyNTZpOGxvcWkwbGJrZ2pwODBpdm9pIiwiZXZlbnRfaWQiOiI3MGJkMGFjOC02MjdkLTRlMTYtOGMxZi1lYzc1M2UxYzQxMWIiLCJ0b2tlbl91c2UiOiJpZCIsImF1dGhfdGltZSI6MTcwNTQ1OTk5NywiZXhwIjoxNzA1NDYzNTk3LCJpYXQiOjE3MDU0NTk5OTcsImp0aSI6ImFiMDQwNDgzLTk1ODItNDQxMi1iYWZiLTlkYWI2NmI3ZTQ2NCIsImVtYWlsIjoiaGFjLnBlcnRAZ21haWwuY29tIn0.OD-FyRpvJIypfAYWX1mYAaAGNDHb7m01pbllMRkUK7tqzrOF2luCBN0PgUQu2s0Zif-3ft3LPJ78WAJVXs3FWiJsEn_uI-LuIrDCjV-xgTiCcnkWnSizssptx6LjA_xlor0n_BzBm2_qDfCgK8X14AHbDzeCZj9qJ1ypP9bS_mLP0emY7dhvbjbIdI8Oq05Anp3DQVTZZANcBA6Mw4Cc-w2NJonByw23cOOfivpQcNTShZ5cFEpxXkRJiamSVZni0zyidkj4PXQeENtWhufMl_Frh9a1zF8ixwDu2A0NoPq2872J46CA9HS0Kmlwfzj2HDs3lqSpOfSqBxikXMyWaw";
