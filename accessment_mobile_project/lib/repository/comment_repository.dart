import 'dart:convert';
import 'package:accessment_mobile_project/data/comment_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CommentRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  CommentRepository._();

  static final CommentRepository _instance = CommentRepository._();

  static CommentRepository get instance => _instance;

  ///Get survey done

  getComments(String idCode) async {
    final SharedPreferences prefs = await _prefs;
    try {
      print("token>>> ${prefs.getString("tokenStorageKey")}");
      var res = await http.get(
        Uri.parse(
            "http://192.168.1.145:8080/api/comment/search/survey?survey=$idCode"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          'Authorization': 'Bearer ${prefs.getString("tokenStorageKey")}',
        },
      );

      final data = json.decode(res.body);
      print(data.toString());
      if (data["status"] == 200) {
        dynamic list = json
            .decode(res.body)['content']
            .map((data) => CommentModel.fromJson(data))
            .toList();
        return list;
      }
    } catch (e) {
      print(e.toString());
    }
  }

  postComments(PostCommentModel postCommentModel) async {
    final SharedPreferences prefs = await _prefs;
    var match = {
      "surveyCode": postCommentModel.surveyCode,
      "content": postCommentModel.content,
      "confirmedUser": postCommentModel.confirmedUser
    };
    try {
      print("token>>> ${prefs.getString("tokenStorageKey")}");
      var res =
          await http.post(Uri.parse("http://192.168.1.145:8080/api/comment"),
              headers: {
                "content-type": "application/json",
                "accept": "application/json",
                'Authorization': 'Bearer ${prefs.getString("tokenStorageKey")}',
              },
              body: json.encode(match));

      final data = json.decode(res.body);
      print(data.toString());
      if (data["status"] == 201) {
        return true;
      } else
        return false;
    } catch (e) {
      print(e.toString());
    }
  }
}
