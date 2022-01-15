import 'package:accessment_mobile_project/data/comment_model.dart';
import 'package:accessment_mobile_project/data/survey_model.dart';
import 'package:accessment_mobile_project/repository/comment_repository.dart';
import 'package:accessment_mobile_project/repository/survey_repository.dart';
import 'package:accessment_mobile_project/repository/uer_repository.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class AccessmentViewModel extends GetxController with WidgetsBindingObserver {
  Rx<dynamic> listComments = Rx<dynamic>([]);
  Rx<dynamic> listUsers = Rx<dynamic>([]);
  Rx<dynamic> listInspectors = Rx<dynamic>([]);
  Rx<String> manager = "".obs;
  RxBool isCommented = false.obs;
  RxList<String> listRequestUser = RxList<String>([]);
  Rx<dynamic> responsePhase = Rx<dynamic>(Map<String, dynamic>());
  TextEditingController contentController;
  BuildContext context = Get.context;
  RxBool isLoading = true.obs;

  @override
  onInit() {
    contentController = new TextEditingController();

    listComment();
    super.onInit();
  }

  Future<void> listComment() async {
    listComments.value = await CommentRepository.instance
        .getComments(Get.arguments[0].toString());
    listUsers.value = await UserRepository.instance.getAllUser();
    isLoading.value = false;
    listInspectors.value = Get.arguments[4];
    manager.value = Get.arguments[2];
    update();
    print(listComments.value[3].confirmations.length);
    print(listUsers.value[0].username);
    print("${Get.arguments[4][0]["username"]}");
  }

  Future<void> postComment() async {
    PostCommentModel postCommentModel = PostCommentModel(
        surveyCode: Get.arguments[0].toString(),
        content: contentController.text,
        confirmedUser: listRequestUser);
    print(postCommentModel.confirmedUser.toString());
    isCommented.value =
        await CommentRepository.instance.postComments(postCommentModel);
    if (isCommented.value) {
      listComments = await CommentRepository.instance
          .getComments(Get.arguments[0].toString());
    }

    update();
  }

  void onTagUser(String username) {
    contentController.text = "${contentController.text} @$username";
    listRequestUser.add(username);
    update();
  }

  Future<void> putPhase() async {
    PutPhaseModel putPhaseModel = PutPhaseModel(
        surveyCode: Get.arguments[0].toString(),
        content: contentController.text,
        phaseName: Get.arguments[3].toString());
    print("phase name >>>> ${Get.arguments[3].toString()}");
    responsePhase.value =
        await SurveyRepository.instance.submitPhase(putPhaseModel);
    if (responsePhase.value["status"] == 200) {
      print(responsePhase.value["content"]);
    } else if (responsePhase.value["status"] == 400) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text(responsePhase.value["error"][0])));
      print(responsePhase.value["error"]);
    } else {
      print(responsePhase.value["error"]);
    }

    update();
  }
}
