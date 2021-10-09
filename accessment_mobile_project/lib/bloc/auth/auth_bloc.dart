import 'package:flutter/material.dart';

class AuthBloc {
  TextEditingController userController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  void onAction() {
    print(userController.text);
  }
}
