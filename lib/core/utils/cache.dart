import 'package:shared_preferences/shared_preferences.dart';

class CacheHelper{
  static SharedPreferences ?sharedPreferences;
  static init()async
  {
    sharedPreferences= await SharedPreferences.getInstance();
  }
  static saveData(String key,String value)async
  {
    return await sharedPreferences?.setString(key, value);
  }
  static retrieveData(String key)
  {
    return  sharedPreferences?.getString(key);
  }
}