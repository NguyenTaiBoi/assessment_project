import 'package:accessment_mobile_project/screen/report/report_view_model.dart';
import 'package:get/get.dart';

class LoginBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ReportViewModel());
  }
}
