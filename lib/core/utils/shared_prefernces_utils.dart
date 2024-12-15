import 'package:shared_preferences/shared_preferences.dart';

class PreferenceUtils {
  static SharedPreferences? _preferences;

  static Future<SharedPreferences> get _instance async =>
      _preferences ??= await SharedPreferences.getInstance();

  static Future<SharedPreferences?> init() async {
    _preferences = await _instance;
    return _preferences;
  }

  static String? getString(String key, [String? defValue = ""]) {
    return _preferences?.getString(key) ?? defValue;
  }

  static Future<bool> setString(String key, String value) {
    return _preferences!.setString(key, value);
  }

  static Future<bool> removeKey(String key) {
    return _preferences!.remove(key);
  }

  static Future<bool> clearPreference() async {
    return await _preferences!.clear();
  }

  static bool keyContains(String key) {
    return _preferences?.containsKey(key) ?? false;
  }
}
