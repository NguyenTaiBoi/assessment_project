import 'package:accessment_mobile_project/screen/accessment/accessment_view_model.dart';
import 'package:get/get.dart';

class AccessmentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => AccessmentViewModel());
  }
}
