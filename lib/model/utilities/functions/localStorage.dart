import 'package:voice_assistant_with_chatgpt/model/utilities/imports/generalImport.dart';

class LocalStorage {
//set String into shared preferences like this
  static Future<bool> setInt(String key, int value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt(key, value).then((value) {
      if (kDebugMode) {
        print("value from shared preferenceWidget");
      }
    });
    return true;
  }

//get String value from shared preferences
  static Future<int?> getInt(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    int? storage;
    storage = pref.getInt(key) ?? 0;
    return storage;
  }

//set bool into shared preferences like this
  static Future<bool> setBool(String key, bool value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(key, value).then((value) {
      if (kDebugMode) {
        print("value from shared preferenceWidget");
      }
    });
    return true;
  }

//get bool value from shared preferences
  static Future<bool?> getBool(String? key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    bool? storage;
    storage = pref.getBool(key!);
    return storage;
  }

  //set bool into shared preferences like this
  static Future<bool> setString(String key, String value) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(key, value).then((value) {
      if (kDebugMode) {
        print("value from shared preferenceWidget");
      }
    });
    return true;
  }

//get bool value from shared preferences
  static Future<String?> getString(String key) async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    String? storage;
    storage = pref.getString(key) ?? "";
    return storage;
  }
}
