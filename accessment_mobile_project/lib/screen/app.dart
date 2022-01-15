import 'package:accessment_mobile_project/config/routes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Application extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      navigatorKey: Get.key,
      defaultTransition: Transition.fadeIn,
      initialRoute: "/loginScreen",
      getPages: Rounter.route,
    );
  }
}
