import 'package:flutter/material.dart';
import 'package:password/core/utils/app_localization.dart';
import 'package:password/presentation/components/button.dart';
import 'package:password/presentation/components/column_scroll_view.dart';
import 'package:password/presentation/route/app_route.dart';

class HomeMobile extends StatefulWidget {
  const HomeMobile({super.key});

  @override
  State<HomeMobile> createState() => _HomeMobileState();
}

class _HomeMobileState extends State<HomeMobile> {
  final int _currentSelectedIndex = 0;
  @override
  Widget build(BuildContext context) {
    final localization = AppLocalization.of(context);

    return Scaffold(
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 24),
        child: ColumnScrollView(
          children: [
            const Spacer(),
            Button(
              label: localization.logout,
              onPress: loginOut,
            ),
            const Spacer(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: const Icon(Icons.home),
            label: localization.home,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.business),
            label: localization.settings,
          ),
          const BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'School',
          ),
        ],
        currentIndex: _currentSelectedIndex,
        onTap: (index) {},
      ),
    );
  }

  void loginOut() {
    const LoginRoute().go(context);
  }
}
