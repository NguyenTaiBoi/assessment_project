import 'package:accessment_mobile_project/data/survey_model.dart';
import 'package:accessment_mobile_project/repository/survey_repository.dart';
import 'package:accessment_mobile_project/repository/uer_repository.dart';
import 'package:accessment_mobile_project/screen/login/login_view_model.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class MainViewNModel extends GetxController with WidgetsBindingObserver {
  RxInt _selectedIndex = 0.obs;
  RxString _surveyName = "".obs;
  String get surveuName => _surveyName.value;
  int get selectedIndex => _selectedIndex.value;
  RxString _dueDay = "".obs;
  String get dueDay => _dueDay.value;
  RxString _createAt = "".obs;
  String get createAt => _createAt.value;
  RxString _status = "".obs;
  String get status => _status.value;
  RxString _scene = "".obs;
  String get scene => _scene.value;
  RxString _phase = "".obs;
  String get phase => _phase.value;
  RxString _assessmentCategory = "".obs;
  String get assessmentCategory => _assessmentCategory.value;
  dynamic listSurveys;
  // dynamic get listSurveys => _listSurveys;

  void onItemTapped(int index) {
    _selectedIndex.value = index;
    update();
  }

  @override
  Future<void> onInit() async {
    // _listSurveys = await UserRepository.instance.getUerInfo("anh");
    // debugPrint(_listSurveys.toString());
    // if (res["status"] == 200) {}
    listSurveys = await SurveyRepository.instance
        .getSurveyDone(Get.find<LoginPresenter>().userName.value);
    // _surveyName.value = _listSurveys[0].name;
    // _dueDay.value = resp[0].dueDate;
    // _createAt.value = resp[0].createAt;
    // _status.value = resp[0].status;
    // _scene.value = resp[0].scene;
    // _phase.value = resp[0].phase["name"];
    // _assessmentCategory.value = resp[0].assessmentCategory["name"];

    // print(resp[0].name);
    // print(resp.name.toString());

    super.onInit();
  }
}
