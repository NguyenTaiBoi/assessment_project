import 'package:accessment_mobile_project/data/category_model.dart';
import 'package:accessment_mobile_project/data/create_survey_model.dart';
import 'package:accessment_mobile_project/data/customer_model.dart';
import 'package:accessment_mobile_project/repository/category_repository.dart';
import 'package:accessment_mobile_project/repository/customer_respository.dart';
import 'package:accessment_mobile_project/repository/survey_repository.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class CreateSurveyViewModel extends GetxController with WidgetsBindingObserver {
  RxList<CategoryModel> _listCategory = RxList<CategoryModel>([]);
  RxList<CustomerModel> _listCustomer = RxList<CustomerModel>([]);
  List<CustomerModel> get listCustomer => _listCustomer;
  List<CategoryModel> get listCategory => _listCategory;
  TextEditingController customerText = TextEditingController();
  TextEditingController phoneText = TextEditingController();
  TextEditingController categoryText = TextEditingController();
  TextEditingController durationText = TextEditingController();
  TextEditingController priceText = TextEditingController();
  TextEditingController nameText = TextEditingController();
  TextEditingController sceneText = TextEditingController();

  CreateSurveyModel createSurveyModel = CreateSurveyModel();
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getListCustomer();
    getListCategory();
    super.onInit();
  }

  Future<void> getListCategory() async {
    await CategoryRepository.instance.getListCagory().then((value) {
      _listCategory.value = value;
      isLoading.value = false;
      print("${_listCategory[0].code}");
    });
    update();
  }

  Future<void> getListCustomer() async {
    await CustomerRepository.instance.getListCustomer().then((value) {
      _listCustomer.value = value;
      isLoading.value = false;
      print("${_listCustomer[0].custNameIt}");
    });
    update();
  }

  void addSurvey() {
    print(
        "${createSurveyModel.assessmentCategoryCode}\n${createSurveyModel.customerCode}");
    createSurveyModel.contactPhone = phoneText.text;
    createSurveyModel.duration = int.parse(durationText.text);
    createSurveyModel.estimatePrice = int.parse(priceText.text);
    createSurveyModel.name = nameText.text;
    createSurveyModel.scene = sceneText.text;
    SurveyRepository.instance.createSurvey(createSurveyModel).then((value) {
      print(value["error"]);
    });
  }
}
