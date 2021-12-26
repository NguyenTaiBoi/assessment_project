import 'package:accessment_mobile_project/screen/business/business_view_model.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class BusinessBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => BusinessViewModel());
  }
}
