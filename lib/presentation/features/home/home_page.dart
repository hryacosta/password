import 'package:flutter/material.dart';
import 'package:password/core/config/injectable.dart';
import 'package:password/core/services/auth_service.dart';
import 'package:password/core/utils/logger.dart';
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
    sl<AuthService>().createSession(
        idToken:
            'eyJraWQiOiJaRUZOY1dHM1hIemR4MFlBRVVVaTFpRk1ReHZoNCtYVWVGYlV0OXlvN1wvYz0iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIzNWNjZTBmOS01YWJkLTQzMjItYjE5Ny0yZGE0OWJlOTUwMWEiLCJjb2duaXRvOmdyb3VwcyI6WyJhZG1pbnMiXSwiZW1haWxfdmVyaWZpZWQiOnRydWUsImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC51cy1lYXN0LTEuYW1hem9uYXdzLmNvbVwvdXMtZWFzdC0xX2k2b2JpTEFORiIsImNvZ25pdG86dXNlcm5hbWUiOiJnYWJyaWVsIiwib3JpZ2luX2p0aSI6IjQxNTE5NGVjLTc0MjMtNDNiYi1hZWI1LWM5NzdhZjNkYjBiMCIsImNvZ25pdG86cm9sZXMiOlsiYXJuOmF3czppYW06OjkzMzIwMjI1ODYzMDpyb2xlXC9BdXRoU3RhY2stQ29nbml0b0FkbWluUm9sZTRDMTBGQkE0LXJxcWtCaGE1RUFRQSJdLCJhdWQiOiJtMHUyNTZpOGxvcWkwbGJrZ2pwODBpdm9pIiwiZXZlbnRfaWQiOiJiMDBmYzExZi02NzJjLTRiNTQtOTRmOC1mODdjYTMxZTRiZmIiLCJ0b2tlbl91c2UiOiJpZCIsImF1dGhfdGltZSI6MTcwNDc3NTYxMSwiZXhwIjoxNzA0Nzc5MjExLCJpYXQiOjE3MDQ3NzU2MTEsImp0aSI6ImJmZWJjY2IzLWUwN2YtNDI2NC1iN2JiLWM4YWFlNWZlZWE4ZSIsImVtYWlsIjoiaGFjLnBlcnRAZ21haWwuY29tIn0.FNX_FxVpCrxRT1DFFydoqoArEADuThbgc8khw8zm-AZ7brDUCFabOtiTEZig2bBSpc8ydk1YitCbfCgsV-q_hWJzs_1-kQVw79I0L267i2CtUz-XNe-ScIZRXRsseu7wEND8PRgB4MB8yl5RcnnpeDFPhkmVDWF1TBIeLB9EthPc2zTqySR66IQJUIv2Rxux_RC8VL4E4IAmTS2XjOO9LqwDVkQjrd5QFG9lk_QNEQtVAucNHWpbmnti-SgYqmOXm_arWC9KHQkjrZ43ntDkpn_M3UYM23gSlhLofo27X7iBPJHTsULwSJWt9oFnUZC-64zTPned2qEDFFoB5Ys35Q');

    logger.d(sl<AuthService>().isSignedIn);
  }

  Future<void> onPressedSpaces() async {
    await _controller.getSpaces();
  }
}
