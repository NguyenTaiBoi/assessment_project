import 'package:accessment_mobile_project/repository/survey_repository.dart';
import 'package:accessment_mobile_project/screen/login/login_view_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DashBoardViewModel extends GetxController with WidgetsBindingObserver {
  Rx<dynamic> listSurveys = Rx<dynamic>([]);
  Rx<dynamic> listSurveysGoing = Rx<dynamic>([]);
  RxBool isLoadingState = true.obs;
  @override
  void onInit() {
    getSurveyDone();
    getSurveyGoing();
    super.onInit();
  }

  Future<void> getSurveyDone() async {
    listSurveys.value = await SurveyRepository.instance
        .getSurveyDone(Get.find<LoginPresenter>().userName.value);
    if (await listSurveys.value != []) {
      isLoadingState.value = false;
    }
    update();
  }

  Future<void> getSurveyGoing() async {
    listSurveysGoing.value = await SurveyRepository.instance
        .getSurveyGoing(Get.find<LoginPresenter>().userName.value);
    if (await listSurveys.value != []) {
      isLoadingState.value = false;
    }
    update();
  }
}
