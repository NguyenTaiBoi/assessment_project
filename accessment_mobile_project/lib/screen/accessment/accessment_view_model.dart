import 'package:accessment_mobile_project/data/comment_model.dart';
import 'package:accessment_mobile_project/data/inspector_model.dart';
import 'package:accessment_mobile_project/data/survey_model.dart';
import 'package:accessment_mobile_project/data/user.dart';
import 'package:accessment_mobile_project/repository/comment_repository.dart';
import 'package:accessment_mobile_project/repository/confirmed_repository.dart';
import 'package:accessment_mobile_project/repository/inspector_repository.dart';
import 'package:accessment_mobile_project/repository/survey_repository.dart';
import 'package:accessment_mobile_project/repository/uer_repository.dart';
import 'package:accessment_mobile_project/screen/dash_board/dash_board_view_model.dart';
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
  RxList<Inspector> _listInspector = RxList<Inspector>([]);
  List<Inspector> get listInspector => _listInspector;
  RxList<RxBool> listInspectorAdded = RxList<RxBool>([]);
  List<String> _listAssignedInsp = <String>[];
  String surveyCode = Get.arguments[0].toString();
  String sence = Get.arguments[1].toString();
  String director = Get.arguments[5].toString();
  String accountant = Get.arguments[6].toString();
  List<User> _listMangers = <User>[];
  List<User> _listDirectors = <User>[];
  List<User> _listAccountants = <User>[];
  List<User> get listMangers => _listMangers;
  List<User> get listDirectors => _listDirectors;
  List<User> get listAccountants => _listAccountants;
  List<String> managers = [
    Get.arguments[2].toString(),
    Get.arguments[5].toString(),
    Get.arguments[6].toString()
  ];
  RxList<RxBool> _listConfirmed = RxList<RxBool>([]);

  @override
  onInit() {
    contentController = new TextEditingController();

    listComment();
    getListInspector();
    getListUser("managers");
    getListUser("directors");
    getListUser("accountants");
    super.onInit();
  }

  Future<void> listComment({bool isRefresh = false}) async {
    listComments.value =
        await CommentRepository.instance.getComments(surveyCode);
    listUsers.value = await UserRepository.instance.getAllUser();

    isLoading.value = false;
    if (isRefresh == false) {
      listInspectors.value = Get.arguments[4];
    }
    update();
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
      listComments.value = await CommentRepository.instance
          .getComments(Get.arguments[0].toString());
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text("Comment successfully")));
      listRequestUser.clear();
      listComment(isRefresh: true);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red, content: Text("Fail to comment")));
      listRequestUser.clear();
    }
    contentController.text = "";
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
    responsePhase.value =
        await SurveyRepository.instance.submitPhase(putPhaseModel);
    if (responsePhase.value["status"] == 200) {
      print(responsePhase.value["content"]);
      Get.find<DashBoardViewModel>()
        ..getSurveyDone()
        ..getSurveyGoing();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text("Submit phase successfully")));
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

  Future<void> getListInspector() async {
    await InspectorRepository.instance.getListInspector().then((value) {
      _listInspector.value = value;
      isLoading.value = false;
      print("${_listInspector.length}");
      for (int i = 0; i < _listInspector.length; i++) {
        listInspectorAdded.add(false.obs);
      }
    });
    update();
  }

  void tapInspector(int index) {
    listInspectorAdded[index].value = !listInspectorAdded[index].value;
    if (listInspectorAdded[index].value) {
      _listAssignedInsp.add(_listInspector[index].username);
    } else {
      _listAssignedInsp.remove(_listInspector[index]);
    }
    print(_listAssignedInsp);
    update();
  }

  Future<void> submitInspectors() async {
    print("$surveyCode");
    var res = await SurveyRepository.instance
        .approveInspector(surveyCode, _listAssignedInsp);
    if (res["status"] == 200) {
      print("${res["content"]["inspectors"]}");
      await listComment(isRefresh: true);
      listInspectors.value = res["content"]["inspectors"];
      print(listInspectors.value[1]["username"]);
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green, content: Text("Successfully")));
      update();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("You are not allow to assign inspector")));
    }

    _listAssignedInsp.clear();
    for (int i = 0; i < listInspectorAdded.length; i++) {
      listInspectorAdded[i].value = false;
    }
    Get.back();
    update();
  }

  Future<void> postConfirm(String id) async {
    var res = await ConfirmedRepository.instance.postConfirm(id);
    if (res) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.green,
          content: Text("Confirmed successfully")));
      listComment(isRefresh: true);
      Get.back();
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          backgroundColor: Colors.red,
          content: Text("You are not allow to confirmed")));
    }
  }

  Future<void> getListUser(String user) async {
    await UserRepository.instance.getListUsers(user: user).then((value) {
      switch (user) {
        case "managers":
          _listMangers = value;
          print(_listMangers[0].username);
          break;
        case "directors":
          _listDirectors = value;
          print(_listDirectors[0].username);
          break;
        case "accountants":
          _listAccountants = value;
          print(_listAccountants[0].username);
          break;
      }
      isLoading.value = false;
    });
    update();
  }

  Future<void> updateUser(
      String surveyCode, String fromUser, String toUser) async {
    await UserRepository.instance
        .changeManager(surveyCode, fromUser, toUser)
        .then((value) {
      if (value["status"] == 200) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.green,
            content: Text("Assign employee successfully")));
        listComment(isRefresh: true);
      } else {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            backgroundColor: Colors.red,
            content: Text("You are not allow to assign employee")));
      }
      isLoading.value = false;
    });
    update();
  }
}
