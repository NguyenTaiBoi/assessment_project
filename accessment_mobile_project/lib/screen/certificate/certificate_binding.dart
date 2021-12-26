import 'package:accessment_mobile_project/screen/certificate/certificate_view_model.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class CertificateBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CertificateViewModel());
  }
}
