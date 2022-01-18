import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class AuthRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  AuthRepository._();

  static final AuthRepository _instance = AuthRepository._();

  static AuthRepository get instance => _instance;

  login({String userName, String password}) async {
    final SharedPreferences prefs = await _prefs;
    try {
      var res = await http.post(Uri.parse("http://192.168.1.145:8080/login"),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
          },
          body: jsonEncode({"username": userName, "password": password}));
      print("${res.statusCode}");
      final data = json.decode(res.body);
      Future<bool> token =
          prefs.setString("tokenStorageKey", data["content"]["jwt"]);
      print(prefs.getString("tokenStorageKey"));
      return data;
    } catch (e) {
      print(e.toString());
    }
  }
}
