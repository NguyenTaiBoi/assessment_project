import 'package:accessment_mobile_project/screen/document_detail/document_detail_view_model.dart';
import 'package:get/get.dart';
import 'package:get/get_instance/src/bindings_interface.dart';

class DocumentDetailBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => DocumentDetailViewModel());
  }
}
