import 'package:flutter/material.dart';
import 'package:password/presentation/providers/app_provider.dart';
import 'package:provider/provider.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key});

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Consumer<AppProvider>(
          builder: (BuildContext context, AppProvider value, Widget? child) =>
              ElevatedButton(
            onPressed: () {
              value.toggleTheme();
            },
            child: const Text('Toggle Theme'),
          ),
        ),
      ),
    );
  }
}
