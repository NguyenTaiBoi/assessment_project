import 'dart:convert';
import 'package:accessment_mobile_project/data/user.dart';
import 'package:accessment_mobile_project/data/user_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class UserRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  UserRepository._();

  static final UserRepository _instance = UserRepository._();

  static UserRepository get instance => _instance;
  getUerInfo(String userName) async {
    final SharedPreferences prefs = await _prefs;
    try {
      var res = await http.get(
        Uri.parse("http://192.168.1.145:8080/api/user/fetch?username=anh"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          'Authorization': 'Bearer ${prefs.getString("tokenStorageKey")}',
        },
      );

      final data = json.decode(res.body);
      return data["content"];
      // print(data);
    } catch (e) {
      print(e.toString());
    }
  }

  getAllUser() async {
    final SharedPreferences prefs = await _prefs;
    try {
      var res = await http.get(
        Uri.parse("http://192.168.1.145:8080/api/user"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          'Authorization': 'Bearer ${prefs.getString("tokenStorageKey")}',
        },
      );

      final data = json.decode(res.body);
      if (data["status"] == 200) {
        dynamic list =
            data['content'].map((data) => UserModel.fromJson(data)).toList();
        print("username>>>> ${list[0].username}");
        return list;
        // return SurveyModel.fromJson(data["content"][0]);
      }
      return data;
      // print(data);
    } catch (e) {
      print(e.toString());
    }
  }

  Future<List<User>> getListUsers({String user}) async {
    final SharedPreferences prefs = await _prefs;

    try {
      var res = await http.get(
        Uri.parse("http://192.168.1.145:8080/api/user/$user"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          'Authorization': 'Bearer ${prefs.getString("tokenStorageKey")}',
        },
      );
      if (res.statusCode == 200) {
        List<User> list = userFromJson(res.body);
        return list;
      }
      return <User>[];
    } catch (e) {
      print(e.toString());
      return <User>[];
    }
  }

  Future<dynamic> changeManager(
      String surveyCode, String fromUser, String toUser) async {
    final SharedPreferences prefs = await _prefs;
    String url =
        "http://192.168.1.145:8080/api/manager/survey/change?fromUser=$fromUser&surveyCode=$surveyCode&toUser=$toUser";
    try {
      var res = await http.put(
        Uri.parse(url),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          'Authorization': 'Bearer ${prefs.getString("tokenStorageKey")}',
        },
      );

      final dynamic data = json.decode(res.body);
      if (res.statusCode == 200) {
        print("ok");
        print(data["content"]);
      } else {
        print("${data["error"]}");
      }
      return data;
    } catch (e) {
      print(e.toString());
    }
  }
}
