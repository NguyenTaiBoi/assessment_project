import 'package:accessment_mobile_project/screen/accessment/accessment_view_model.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class AccessmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccessmentViewModel());
  }
}
