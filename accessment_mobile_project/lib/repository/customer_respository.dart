import 'package:accessment_mobile_project/data/customer_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CustomerRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  CustomerRepository._();

  static final CustomerRepository _instance = CustomerRepository._();

  static CustomerRepository get instance => _instance;
  Future<List<CustomerModel>> getListCustomer() async {
    final SharedPreferences prefs = await _prefs;

    try {
      var res = await http.get(
        Uri.parse("http://192.168.1.145:8080/api/customer"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          'Authorization': 'Bearer ${prefs.getString("tokenStorageKey")}',
        },
      );
      if (res.statusCode == 200) {
        List<CustomerModel> list = customerModelFromJson(res.bodyBytes);
        return list;
      }
      return <CustomerModel>[];
    } catch (e) {
      print(e.toString());
      return <CustomerModel>[];
    }
  }
}
