import 'package:blog_app/services/shared_preference_service.dart';
import 'package:flutter/material.dart';

class DarkThemeProvider with ChangeNotifier {
  bool get darkTheme {
    return SharedPreferencesService.getDarkTheme();
  }

  set darkTheme(bool value) {
    SharedPreferencesService.setDarkTheme(to: value);
    notifyListeners();
  }
}
