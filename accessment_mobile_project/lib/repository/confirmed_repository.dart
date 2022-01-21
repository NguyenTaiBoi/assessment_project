import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class ConfirmedRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  ConfirmedRepository._();

  static final ConfirmedRepository _instance = ConfirmedRepository._();

  static ConfirmedRepository get instance => _instance;

  ///Get survey done

  Future<bool> postConfirm(String id) async {
    final SharedPreferences prefs = await _prefs;
    try {
      print("token>>> ${prefs.getString("tokenStorageKey")}");
      var res = await http.put(
        Uri.parse(
            "http://192.168.1.145:8080/api/confirmation/change-status?comment=$id"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          'Authorization': 'Bearer ${prefs.getString("tokenStorageKey")}',
        },
      );

      final data = json.decode(res.body);
      print(data.toString());
      if (res.statusCode == 200) {
        return true;
      } else
        return false;
    } catch (e) {
      print(e.toString());
    }
  }
}
