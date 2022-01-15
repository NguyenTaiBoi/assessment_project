import 'package:accessment_mobile_project/screen/business/business_screen.dart';
import 'package:accessment_mobile_project/screen/dash_board/dash_board_screen.dart';
import 'package:accessment_mobile_project/screen/main/main_view_model.dart';
import 'package:accessment_mobile_project/screen/notification/notification_screen.dart';
import 'package:accessment_mobile_project/screen/setting/setting_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class MainScreen extends GetView<MainViewNModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          body: getBody(),
          bottomNavigationBar: BottomNavigationBar(
            items: const <BottomNavigationBarItem>[
              BottomNavigationBarItem(
                icon: Icon(Icons.dashboard),
                label: 'Dash Board',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.business),
                label: 'Business',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.notifications),
                label: 'Notification',
              ),
              BottomNavigationBarItem(
                icon: Icon(Icons.settings),
                label: 'Settings',
              ),
            ],
            currentIndex: controller.selectedIndex,
            selectedItemColor: Colors.amber[800],
            onTap: controller.onItemTapped,
            unselectedItemColor: Colors.grey,
          ),
        ));
  }

  Widget getBody() {
    switch (controller.selectedIndex) {
      case 0:
        return DashBoardScreen();
      case 1:
        return BusinessScreen();
      case 2:
        return NotificationScreen();
      case 3:
        return SettingScreen();
      default:
        return BusinessScreen();
    }
  }
}
