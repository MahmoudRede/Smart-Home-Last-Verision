import 'package:shared_preferences/shared_preferences.dart';

class CashHelper{



  static SharedPreferences ?sharedPreferences;

  static init()async {

    sharedPreferences= await SharedPreferences.getInstance();

  }


  static Future<bool> saveData ({
    required String key ,
    dynamic value ,
  }) async
  {
    if(value is String) return sharedPreferences!.setString(key, value);
    if(value is bool) return sharedPreferences!.setBool(key, value);
    if(value is int) return sharedPreferences!.setInt(key, value);

    return sharedPreferences!.setDouble(key, value);
  }

  static dynamic getData ({
    required String key,
  })
  {
    return sharedPreferences!.get(key);
  }

  static Future<bool> removeData({
    required String key,
  }) async
  {
    return await sharedPreferences!.remove(key);
  }

  static Future putUserName(
      {
        required String key,
        required String value
      }
      )async{

    return await sharedPreferences?.setString(key, value);

  }

  static Future putEmail(
      {
        required String key,
        required String value
      }
      )async{

    return await sharedPreferences?.setString(key, value);

  }

  static Future putPass(
      {
        required String key,
        required String value
      }
      )async{

    return await sharedPreferences?.setString(key, value);

  }

  static Future putStartAt(
      {
        required String key,
        required String value
      }
      )async{

    return await sharedPreferences?.setString(key, value);

  }

  static Future putGrade(
      {
        required String key,
        required String value
      }
      )async{

    return await sharedPreferences?.setString(key, value);

  }

  static Future putDepartment(
      {
        required String key,
        required String value
      }
      )async{

    return await sharedPreferences?.setString(key, value);

  }

  static String? getUserName(
      {
        required String key,
      }
      ){

    return sharedPreferences?.getString(key);

  }

  static String? getEmail(
      {
        required String key,
      }
      ){

    return sharedPreferences?.getString(key);

  }

  static String? getPass(
      {
        required String key,
      }
      ){

    return  sharedPreferences?.getString(key);

  }

  static String? getStartAt(
      {
        required String key,
      }
      ){

    return  sharedPreferences?.getString(key);

  }

  static String? getGrade(
      {
        required String key,
      }
      ){

    return  sharedPreferences?.getString(key);

  }

  static String? getDepartment(
      {
        required String key,
      }
      ){

    return  sharedPreferences?.getString(key);

  }


  static Future putInt(
      {
        required String key,
        required int value
      }
      )async{

    return await sharedPreferences?.setInt(key, value);

  }

  static int? getInt(
      {
        required String key,
      }
      ){

    return  sharedPreferences?.getInt(key);

  }





}