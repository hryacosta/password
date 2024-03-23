import 'package:flutter/material.dart';
import 'package:password/core/utils/analytics.dart';
import 'package:password/presentation/components/responsive_layout.dart';
import 'package:password/presentation/views/login/login_desktop.dart';
import 'package:password/presentation/views/login/login_mobile.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  void initState() {
    super.initState();
    Analytics().logAppOpen();
  }

  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      mobileScaffold: LoginMobile(),
      tabletScaffold: LoginDesktop(),
      desktopScaffold: LoginDesktop(),
    );
  }
}
