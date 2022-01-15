import 'package:accessment_mobile_project/screen/create_survey/survey_view_model.dart';
import 'package:get/get.dart';

class CreateSurveyBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateSurveyViewModel());
  }
}
