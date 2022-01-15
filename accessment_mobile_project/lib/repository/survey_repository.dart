import 'dart:convert';
import 'package:accessment_mobile_project/data/create_survey_model.dart';
import 'package:accessment_mobile_project/data/survey_model.dart';
import 'package:accessment_mobile_project/screen/create_survey/survey_binding.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SurveyRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  SurveyRepository._();

  static final SurveyRepository _instance = SurveyRepository._();

  static SurveyRepository get instance => _instance;

  ///Get survey done

  getSurveyDone(String userName) async {
    final SharedPreferences prefs = await _prefs;
    try {
      var res = await http.get(
        Uri.parse(
            "http://192.168.1.145:8080/api/survey/fetch/done/survey?username=anh"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          'Authorization': 'Bearer ${prefs.getString("tokenStorageKey")}',
        },
      );

      final data = json.decode(res.body);
      if (data["status"] == 200) {
        dynamic list = json
            .decode(utf8.decode(res.bodyBytes))['content']
            .map((data) => SurveyModel.fromJson(data))
            .toList();
        // List<SurveyModel> surveys = (json.decode(data)['content'] as List)
        //     .map((data) => SurveyModel.fromJson(data))
        //     .toList();
        print("name>>>> ${list[1].name}");
        return list;
        // return SurveyModel.fromJson(data["content"][0]);
      }
    } catch (e) {
      print(e.toString());
    }
  }

  getSurveyGoing(String userName) async {
    final SharedPreferences prefs = await _prefs;
    try {
      var res = await http.get(
        Uri.parse(
            "http://192.168.1.145:8080/api/survey/fetch/in-doing/survey?username=anh"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          'Authorization': 'Bearer ${prefs.getString("tokenStorageKey")}',
        },
      );

      final data = json.decode(res.body);
      if (data["status"] == 200) {
        dynamic list = json
            .decode(utf8.decode(res.bodyBytes))['content']
            .map((data) => SurveyModel.fromJson(data))
            .toList();
        print("name>>>> ${list[1].name}");
        return list;
      }
      return [];
    } catch (e) {
      print(e.toString());
    }
  }

  submitPhase(PutPhaseModel putPhaseModel) async {
    final SharedPreferences prefs = await _prefs;
    var match = {
      "surveyCode": putPhaseModel.surveyCode,
      "content": putPhaseModel.content,
      "phaseName": putPhaseModel.phaseName
    };
    try {
      print("token>>> ${prefs.getString("tokenStorageKey")}");
      var res = await http.put(
          Uri.parse("http://192.168.1.145:8080/api/phase/submit-phase"),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            'Authorization': 'Bearer ${prefs.getString("tokenStorageKey")}',
          },
          body: json.encode(match));

      final data = json.decode(res.body);
      return data;
    } catch (e) {
      print(e.toString());
    }
  }

  Future<dynamic> createSurvey(CreateSurveyModel ceateSurveyModel) async {
    final SharedPreferences prefs = await _prefs;
    try {
      print("token>>> ${prefs.getString("tokenStorageKey")}");
      var res = await http.put(
          Uri.parse("http://192.168.1.145:8080/api/accountant/survey"),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
            'Authorization': 'Bearer ${prefs.getString("tokenStorageKey")}',
          },
          body: createSurveyModelToJson(ceateSurveyModel));

      final dynamic data = json.decode(res.body);
      return data;
    } catch (e) {
      print(e.toString());
    }
  }
}
