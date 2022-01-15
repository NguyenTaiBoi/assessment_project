import 'package:flutter/material.dart';
import 'package:get/get.dart';

Size screenSize(BuildContext context) => MediaQuery.of(context).size;

Future goTo({@required String screen, var arg}) async =>
    await Get.toNamed(screen, arguments: arg);

int getConfirmedUser(dynamic confirmations) {
  int result = 0;
  for (int i = 0; i < confirmations.length; i++) {
    if (confirmations[i]["status"]) {
      result++;
    }
  }
  return result;
}
