import 'package:accessment_mobile_project/data/inspector_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class InspectorRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  InspectorRepository._();

  static final InspectorRepository _instance = InspectorRepository._();

  static InspectorRepository get instance => _instance;
  Future<List<Inspector>> getListInspector() async {
    final SharedPreferences prefs = await _prefs;

    try {
      var res = await http.get(
        Uri.parse("http://192.168.1.145:8080/api/user/inspectors"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          'Authorization': 'Bearer ${prefs.getString("tokenStorageKey")}',
        },
      );
      if (res.statusCode == 200) {
        List<Inspector> list = inspectorFromJson(res.body);
        return list;
      }
      return <Inspector>[];
    } catch (e) {
      print(e.toString());
      return <Inspector>[];
    }
  }
}
