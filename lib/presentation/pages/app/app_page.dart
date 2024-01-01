import 'package:flutter/material.dart';
import 'package:password/presentation/pages/home/home_page.dart';
import 'package:password/presentation/pages/settings/settings_page.dart';

class AppPage extends StatefulWidget {
  const AppPage({super.key});

  @override
  State<AppPage> createState() => _AppPageState();
}

class _AppPageState extends State<AppPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        NavigationRail(
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.home),
              label: Text('Home'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.settings),
              label: Text('Settings'),
            ),
          ],
          selectedIndex: selectedIndex,
          onDestinationSelected: (int index) {
            setState(() {
              selectedIndex = index;
            });
          },
        ),
        Expanded(
          child: Scaffold(
            appBar: AppBar(
              title: const Text('Home Page'),
            ),
            body: Builder(
              builder: (context) {
                switch (selectedIndex) {
                  case 0:
                    return const HomePage();
                  case 1:
                    return const SettingsPage();
                  default:
                    return const HomePage();
                }
              },
            ),
          ),
        ),
      ],
    );
  }
}
