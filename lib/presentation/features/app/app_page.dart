import 'package:flutter/material.dart';
import 'package:password/presentation/components/responsive_layout.dart';
import 'package:password/presentation/features/app/desktop_page.dart';
import 'package:password/presentation/features/app/mobile_page.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  @override
  Widget build(BuildContext context) {
    return const ResponsiveLayout(
      desktopScaffold: DesktopPage(),
      tabletScaffold: DesktopPage(),
      mobileScaffold: MobilePage(),
    );
  }
}
