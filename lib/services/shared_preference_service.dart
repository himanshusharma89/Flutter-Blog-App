import 'package:shared_preferences/shared_preferences.dart';

// this class provides basic methods to store data into
// and retrieve data from shared preferences

class SharedPreferencesService {
  // a generic method to retrieve one key:value pair from shared preferences at a time
  Future<dynamic> getSharedPreferenceValue(String key) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.get(key) ?? null;
  }

  // a generic method to store one key:value pair in shared preferences at a time
  // key is of type String,
  // and value can be any of the following types [String, int, double, bool]
  setSharedPreferenceValue(String key, dynamic value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    if (value is String) {
      await prefs.setString(key, value);
    } else if (value is int) {
      await prefs.setInt(key, value);
    } else if (value is double) {
      await prefs.setDouble(key, value);
    } else if (value is bool) {
      await prefs.setBool(key, value);
    }
  }
}
