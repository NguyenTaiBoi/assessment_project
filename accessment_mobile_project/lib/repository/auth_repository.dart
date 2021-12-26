import 'dart:convert';

import 'package:http/http.dart' as http;

// class AuthRepository {
//   login({String userName, String password}) async {
//     try {
//       var res = await http.post(
//           Uri.parse("https://assessment-mgmt.herokuapp.com/login"),
//           headers: {
//             "content-type": "application/json",
//             "accept": "application/json",
//           },
//           body: json.encode({"userName": userName, "password:": password}));
//       final data = json.decode(res.body);
//       return data;
//     } catch (e) {
//       print(e.toString());
//     }
//   }
// }

class AuthRepository {
  AuthRepository._();

  static final AuthRepository _instance = AuthRepository._();

  static AuthRepository get instance => _instance;

  login({String userName, String password}) async {
    try {
      print(jsonEncode({"userName": "boi", "password:": "123"}).toString());
      var res = await http.post(
          Uri.parse("https://assessment-mgmt.herokuapp.com/login"),
          headers: {
            "content-type": "application/json",
            "accept": "application/json",
          },
          body: jsonEncode({"username": userName, "password": password}));
      final data = json.decode(res.body);
      print(data);
      return data;
    } catch (e) {
      print(e.toString());
    }
  }
}
