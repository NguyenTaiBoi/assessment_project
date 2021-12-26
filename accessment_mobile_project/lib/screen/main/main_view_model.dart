import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MainViewNModel extends GetxController with WidgetsBindingObserver {
  RxInt _selectedIndex = 0.obs;
  int get selectedIndex => _selectedIndex.value;
  void onItemTapped(int index) {
    _selectedIndex.value = index;
    update();
  }
}
