import 'package:flutter/material.dart';
import 'package:password/config/injectable.dart';
import 'package:password/core/utils/logger.dart';
import 'package:password/data/services/auth_service.dart';
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
          'eyJraWQiOiJaRUZOY1dHM1hIemR4MFlBRVVVaTFpRk1ReHZoNCtYVWVGYlV0OXlvN1wvYz0iLCJhbGciOiJSUzI1NiJ9.eyJzdWIiOiIzNWNjZTBmOS01YWJkLTQzMjItYjE5Ny0yZGE0OWJlOTUwMWEiLCJjb2duaXRvOmdyb3VwcyI6WyJhZG1pbnMiXSwiZW1haWxfdmVyaWZpZWQiOnRydWUsImlzcyI6Imh0dHBzOlwvXC9jb2duaXRvLWlkcC51cy1lYXN0LTEuYW1hem9uYXdzLmNvbVwvdXMtZWFzdC0xX2k2b2JpTEFORiIsImNvZ25pdG86dXNlcm5hbWUiOiJnYWJyaWVsIiwib3JpZ2luX2p0aSI6IjA3ZmQ2Mzg3LWQ1MTctNGFhYi1iMzE0LTBkMWNlNWRhNjEyNiIsImNvZ25pdG86cm9sZXMiOlsiYXJuOmF3czppYW06OjkzMzIwMjI1ODYzMDpyb2xlXC9BdXRoU3RhY2stQ29nbml0b0FkbWluUm9sZTRDMTBGQkE0LXJxcWtCaGE1RUFRQSJdLCJhdWQiOiJtMHUyNTZpOGxvcWkwbGJrZ2pwODBpdm9pIiwiZXZlbnRfaWQiOiJlNjNlMDg4NC02YTdmLTRlZDUtODI1Yi0yNjdhMDYzMWFkOWIiLCJ0b2tlbl91c2UiOiJpZCIsImF1dGhfdGltZSI6MTcwNTMyODU4NCwiZXhwIjoxNzA1MzMyMTg0LCJpYXQiOjE3MDUzMjg1ODQsImp0aSI6IjRmN2YyMzljLThhZmYtNGUwZi1hZmRmLTk0ZTIxMmFhZGE3MSIsImVtYWlsIjoiaGFjLnBlcnRAZ21haWwuY29tIn0.pcOg1AQGNBgMyaQM8BbYpeH3NTmg4FZLeVOEjF3yud7IzqxcSm_shiIUv4CtYfVlon6iPPczNMfXR9h8pQXdnK4ElRw5_5uNtUNiOK_SRYYszHFXAC2cJoVi2InFpIys0IMXuC4FC6lIy4ZmtbH27lDDmOdBm5vaV0mGmPoXheBN39GlWEw-BJZsC25i-5EtjBrNrGhI9jbOsDyyLk8f8-b2Qqs_GQs9a34TKKwhArEeM2KSfv_QHDgz0DMszRXrYjEZsutogWcFxqg3NLw4Q0gEqw3AlgnHj06NpAuJIaKjOX4_H45KbgU4uAIq8VNQRs4isu7FTbRtlJOuqxsbvw',
    );

    logger.d(sl<AuthService>().isSignedIn);
  }

  Future<void> onPressedSpaces() async {
    await _controller.getSpaces();
  }
}
