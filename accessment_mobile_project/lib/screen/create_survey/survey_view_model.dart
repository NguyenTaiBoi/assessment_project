import 'package:accessment_mobile_project/data/category_model.dart';
import 'package:accessment_mobile_project/data/create_survey_model.dart';
import 'package:accessment_mobile_project/data/customer_model.dart';
import 'package:accessment_mobile_project/repository/category_repository.dart';
import 'package:accessment_mobile_project/repository/customer_respository.dart';
import 'package:accessment_mobile_project/repository/survey_repository.dart';
import 'package:accessment_mobile_project/screen/dash_board/dash_board_screen.dart';
import 'package:accessment_mobile_project/screen/dash_board/dash_board_view_model.dart';
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
  BuildContext context = Get.context;

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
      SnackBar snackBar = SnackBar(
        content: Text('New survey was created'),
        backgroundColor: Colors.green,
      );
      if (value["status"] != 201) {
        snackBar = SnackBar(
          content: Text('${value["error"]}'),
          backgroundColor: Colors.red,
        );
      }
      Get.find<DashBoardViewModel>().onInit();
      // Find the ScaffoldMessenger in the widget tree
      // and use it to show a SnackBar.
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    });
  }
}
