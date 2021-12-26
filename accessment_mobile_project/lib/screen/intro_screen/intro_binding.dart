import 'package:accessment_mobile_project/screen/intro_screen/intro_view_model.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class IntroBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IntroViewModel());
  }
}
