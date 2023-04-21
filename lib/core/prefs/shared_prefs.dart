import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefs {
  static SharedPreferences? prefs;

  static Future<void> initializeSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  static String userType() {
    return prefs?.getString(USERTYPE) ?? TYPEBUYER;
  }

  static Future<void> setUserType(String type) async {
    await prefs?.setString(USERTYPE, type);
  }

  static String userId() {
    return prefs?.getString(USERID) ?? "1111";
  }

  static Future<void> setUserId(String id) async {
    await prefs?.setString(USERID, id);
  }
}

const USERTYPE = "usertype";
const TYPEBUYER = "Buyer";
const TYPESELLER = "Seller";
const USERID = "uid";
