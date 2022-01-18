import 'package:accessment_mobile_project/data/document_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class DocumentRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  DocumentRepository._();

  static final DocumentRepository _instance = DocumentRepository._();

  static DocumentRepository get instance => _instance;
  Future<List<Document>> getListDocument() async {
    final SharedPreferences prefs = await _prefs;

    try {
      var res = await http.get(
        Uri.parse("http://192.168.1.145:8080/api/document"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          'Authorization': 'Bearer ${prefs.getString("tokenStorageKey")}',
        },
      );
      if (res.statusCode == 200) {
        List<Document> list = documentFromJson(res.body);
        return list;
      }
      return <Document>[];
    } catch (e) {
      print(e.toString());
      return <Document>[];
    }
  }
}
