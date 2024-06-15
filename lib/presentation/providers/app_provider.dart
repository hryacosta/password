import 'package:flutter/material.dart';
import 'package:password/core/config/injectable.dart';
import 'package:password/core/utils/shared_preferences_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppProvider with ChangeNotifier {
  AppProvider() {
    try {
      final isLightTheme = sl<SharedPreferences>().getBool(lightThemeModeKey);
      if (isLightTheme != null) {
        if (isLightTheme) {
          _toggleLightTheme();
        } else {
          _toggleDarkTheme();
        }
      }
    } catch (err) {
      _toggleLightTheme();
    }
  }

  final _themeMode = ValueNotifier<ThemeMode>(ThemeMode.light);

  void toggleTheme() {
    if (_themeMode.value == ThemeMode.light) {
      _toggleDarkTheme();
    } else {
      _toggleLightTheme();
    }
  }

  void _toggleDarkTheme() {
    _themeMode.value = ThemeMode.dark;
    sl<SharedPreferences>().setBool(lightThemeModeKey, false);
  }

  void _toggleLightTheme() {
    _themeMode.value = ThemeMode.light;
    sl<SharedPreferences>().setBool(lightThemeModeKey, true);
  }

  ValueNotifier<ThemeMode> get themeMode {
    return _themeMode;
  }
}
