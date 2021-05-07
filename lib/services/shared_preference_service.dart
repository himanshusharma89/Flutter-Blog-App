import 'package:shared_preferences/shared_preferences.dart';

// this class provides basic methods to store data into
// and retrieve data from shared preferences

class SharedPreferencesService {
  static late SharedPreferences _sharedPreferences;

  // Create shared preferences instance here
  Future<void> init() async {
    _sharedPreferences = await SharedPreferences.getInstance();
  }

  static String sharedPreferenceFirstLaunchKey = 'FIRSTLAUNCH';
  static String sharedPreferenceDarkThemeKey = 'DARKTHEME';

  /// Set Data to Sharedpreference
  static Future<bool> setFirstLaunch({required bool to}) async {
    return _sharedPreferences.setBool(sharedPreferenceFirstLaunchKey, to);
  }

  static Future<bool> setDarkTheme({required bool to}) async {
    return _sharedPreferences.setBool(sharedPreferenceDarkThemeKey, to);
  }

  /// Fetching Data From Sharedpreference
  static bool getFirstLaunch() {
    return _sharedPreferences.getBool(sharedPreferenceFirstLaunchKey) ?? true;
  }

  static bool getDarkTheme() {
    return _sharedPreferences.getBool(sharedPreferenceDarkThemeKey) ?? false;
  }
}
