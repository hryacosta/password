import 'package:flutter/material.dart';
import 'package:password/presentation/components/responsive_layout.dart';
import 'package:password/presentation/views/login/login_desktop.dart';
import 'package:password/presentation/views/login/login_mobile.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileScaffold: LoginMobile(),
      tabletScaffold: LoginDesktop(),
      desktopScaffold: LoginDesktop(),
    );
  }
}
