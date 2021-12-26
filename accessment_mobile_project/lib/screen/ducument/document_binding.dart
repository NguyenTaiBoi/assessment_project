import 'package:accessment_mobile_project/screen/ducument/ducument_screen.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class DocumentBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DocumentViewModel());
  }
}
