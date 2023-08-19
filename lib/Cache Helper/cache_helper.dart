import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences? sharedPreferences;
  static onInit()async{
    sharedPreferences =await SharedPreferences.getInstance();
  }

  static  getFromSharedPreferences(String key)async{
    return sharedPreferences!.get(key);
  }

  static  Future saveToSharedPreferences(String key ,dynamic value)async{

    if (value is String) return await sharedPreferences!.setString(key, value);
    if (value is int) return await sharedPreferences!.setInt(key, value);
    if (value is bool) return await sharedPreferences!.setBool(key, value);
    if (value is double) return await sharedPreferences!.setDouble(key, value);
    if (value == null) return await sharedPreferences!.setString(key, value.toString());

  }

  static Future<bool> clearFromSharedPreferences(){
    return sharedPreferences!.clear();
  }
  static Future<bool> removeFromSharedPreferences({required key}){
    return sharedPreferences!.remove(key);
  }


}