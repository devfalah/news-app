import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper {
  static Future<bool> putData({required key, required bool value}) async {
    print("ok");
    var sharedPreferences = await SharedPreferences.getInstance();
    return await sharedPreferences.setBool(key, value);
  }

  static Future<bool?> getData({required key}) async {
    var sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.getBool(key);
  }

  static Future<bool> delet({required key}) async {
    var sharedPreferences = await SharedPreferences.getInstance();

    return sharedPreferences.clear();
  }
}
