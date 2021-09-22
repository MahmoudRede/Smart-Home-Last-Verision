import 'package:fssmarthome/Base/enumeration.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceManager {

  static Future<void> removeData(String key) async {
    SharedPreferences  sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }
  static Future<void> addData(String key,String value) async {
    SharedPreferences  sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }
  static Future<String?> getData(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
      return  sharedPreferences.getString(key);
  }
  static Future<bool> logout() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.clear();
  }
}
