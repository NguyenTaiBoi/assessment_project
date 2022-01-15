import 'package:accessment_mobile_project/repository/survey_repository.dart';
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
    listSurveys.value = await SurveyRepository.instance.getSurveyDone("anh1");
    if (await listSurveys.value != []) {
      isLoadingState.value = false;
    }
    print(listSurveys.value[0].inspectors);
    update();
  }

  Future<void> getSurveyGoing() async {
    listSurveysGoing.value =
        await SurveyRepository.instance.getSurveyGoing("anh1");
    if (await listSurveys.value != []) {
      isLoadingState.value = false;
    }
    update();
  }
}
