import 'package:flutter/material.dart';
import 'package:password/presentation/components/button.dart';
import 'package:password/presentation/components/column_scroll_view.dart';
import 'package:password/presentation/route/app_route.dart';

class MobilePage extends StatefulWidget {
  const MobilePage({super.key});

  @override
  State<MobilePage> createState() => _MobilePageState();
}

class _MobilePageState extends State<MobilePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ColumnScrollView(
        children: [
          const Spacer(),
          Button(
            label: 'logout',
            onPress: loginOut,
          ),
          const Spacer()
        ],
      ),
    );
  }

  void loginOut() {
    const LoginRoute().go(context);
  }
}
