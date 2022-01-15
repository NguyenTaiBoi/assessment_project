import 'package:shared_preferences/shared_preferences.dart';

class LocalStorage {
  LocalStorage._();

  static LocalStorage _instance;

  static LocalStorage get instance {
    return _instance;
  }

  static final Future<SharedPreferences> _prefs =
      SharedPreferences.getInstance();
  String token;
}
