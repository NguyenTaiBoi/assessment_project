import 'dart:convert';
import 'package:accessment_mobile_project/data/category_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CategoryRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  CategoryRepository._();

  static final CategoryRepository _instance = CategoryRepository._();

  static CategoryRepository get instance => _instance;
  Future<List<CategoryModel>> getListCagory() async {
    final SharedPreferences prefs = await _prefs;

    try {
      var res = await http.get(
        Uri.parse("http://192.168.1.145:8080/api/assessment-category"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          'Authorization': 'Bearer ${prefs.getString("tokenStorageKey")}',
        },
      );
      if (res.statusCode == 200) {
        List<CategoryModel> list = categoryModelFromJson(res.bodyBytes);
        return list;
      }
      return <CategoryModel>[];
      // print(data);
    } catch (e) {
      print(e.toString());
      return <CategoryModel>[];
    }
  }
}
