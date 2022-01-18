import 'package:accessment_mobile_project/repository/auth_repository.dart';
import 'package:accessment_mobile_project/util/utils.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class LoginPresenter extends GetxController with WidgetsBindingObserver {
  TextEditingController userController = new TextEditingController();
  TextEditingController passwordController = new TextEditingController();
  RxString userName = "".obs;
  RxString password = "".obs;
  BuildContext context = Get.context;

  Future<void> loginPress() async {
    userName.value = userController.text.trim();
    password.value = passwordController.text.trim();
    update();
    var res = await AuthRepository.instance
        .login(userName: userName.value, password: password.value);
    if (res["status"] == 200) {
      goTo(
        screen: "/mainScreen",
      );
    }
  }
}
