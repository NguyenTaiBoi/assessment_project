import 'package:accessment_mobile_project/screen/ducument/ducument_screen.dart';
import 'package:get/get.dart';

class FileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DocumentViewModel());
  }
}
