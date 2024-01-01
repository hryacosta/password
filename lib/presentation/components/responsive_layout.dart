import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    required this.mobileScaffold,
    required this.tabletScaffold,
    required this.desktopScaffold,
    super.key,
  });

  final Widget mobileScaffold;
  final Widget tabletScaffold;
  final Widget desktopScaffold;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      ///https://m3.material.io/foundations/layout/applying-layout/window-size-classes
      builder: (context, constraints) {
        if (constraints.maxWidth < 600) {
          return mobileScaffold;
        } else if (constraints.maxWidth >= 600 && constraints.maxWidth < 840) {
          return tabletScaffold;
        } else {
          return desktopScaffold;
        }
      },
    );
  }
}
