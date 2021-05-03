import 'package:blog_app/services/shared_preference_service.dart';
import 'package:flutter/material.dart';

class DarkThemeProvider with ChangeNotifier {
  SharedPreferencesService darkThemePreference = SharedPreferencesService();
  bool _darkTheme = false;

  bool get darkTheme => _darkTheme;

  set darkTheme(bool value) {
    _darkTheme = value;
    darkThemePreference.setSharedPreferenceValue('themeMode', value);
    notifyListeners();
  }
}
