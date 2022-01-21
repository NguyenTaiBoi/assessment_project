import 'package:accessment_mobile_project/screen/create_survey/survey_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateSurveyScreen extends GetView<CreateSurveyViewModel> {
  final surveyController = Get.put(CreateSurveyViewModel());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: _addButton(),
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Text("CREATE SURVEY"),
        centerTitle: true,
      ),
      body: _buildBody(context),
    );
  }

  FloatingActionButton _addButton() {
    return FloatingActionButton(
      tooltip: 'Increment',
      child: new Icon(
        Icons.add,
        color: Colors.red,
      ),
      backgroundColor: Colors.yellow,
      onPressed: () {
        Get.defaultDialog(
            title: "Confirm to create",
            content: Container(),
            onConfirm: () {
              surveyController.addSurvey();
              Get.back();
            },
            onCancel: () {});
        // surveyController.addSurvey();
      },
    );
  }

  _buildBody(BuildContext context) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                _buildTextField(
                    controller: surveyController.categoryText,
                    hintText: "Assessment category",
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                content: Container(
                              height: 220,
                              width: 400,
                              child: ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 15,
                                ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      surveyController.categoryText.text =
                                          surveyController
                                              .listCategory[index].name;
                                      surveyController.createSurveyModel
                                              .assessmentCategoryCode =
                                          surveyController
                                              .listCategory[index].code;
                                      Get.back();
                                    },
                                    child: Text(
                                      surveyController.listCategory[index].name,
                                      maxLines: 2,
                                    ),
                                  );
                                },
                                itemCount: surveyController.listCategory.length,
                              ),
                            ));
                          });
                    }),
                SizedBox(
                  height: 15,
                ),
                _buildTextField(
                    controller: surveyController.customerText,
                    hintText: "Customer company",
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                                content: Container(
                              height: 220,
                              width: 400,
                              child: ListView.separated(
                                separatorBuilder: (context, index) => SizedBox(
                                  height: 15,
                                ),
                                itemBuilder: (context, index) {
                                  return InkWell(
                                    onTap: () {
                                      surveyController.customerText.text =
                                          surveyController
                                              .listCustomer[index].custNameVn;
                                      surveyController
                                              .createSurveyModel.customerCode =
                                          surveyController
                                              .listCustomer[index].code;
                                      Get.back();
                                    },
                                    child: Text(
                                      surveyController
                                          .listCustomer[index].custNameVn,
                                      maxLines: 2,
                                    ),
                                  );
                                },
                                itemCount: surveyController.listCustomer.length,
                              ),
                            ));
                          });
                    }),
                SizedBox(
                  height: 15,
                ),
                _buildTextField(
                    controller: surveyController.phoneText,
                    hintText: "Contact phone",
                    keyboard: TextInputType.number,
                    onTap: () {}),
                SizedBox(
                  height: 15,
                ),
                _buildTextField(
                    controller: surveyController.durationText,
                    hintText: "Duration",
                    keyboard: TextInputType.number,
                    suffixText: "hours",
                    onTap: () {}),
                SizedBox(
                  height: 15,
                ),
                _buildTextField(
                    controller: surveyController.priceText,
                    hintText: "Eastimate price",
                    keyboard: TextInputType.number,
                    suffixText: "VND",
                    onTap: () {}),
                SizedBox(
                  height: 15,
                ),
                _buildTextField(
                    controller: surveyController.nameText,
                    hintText: "Survey name",
                    onTap: () {}),
                SizedBox(
                  height: 15,
                ),
                _buildTextField(
                    controller: surveyController.sceneText,
                    hintText: "Scence",
                    onTap: () {}),
              ],
            ),
          ),
        ),
      );

  TextField _buildTextField(
      {String hintText,
      TextEditingController controller,
      Function onTap,
      TextInputType keyboard = TextInputType.text,
      String suffixText}) {
    return TextField(
      onTap: onTap,
      controller: controller,
      autofocus: false,
      keyboardType: keyboard,
      style: TextStyle(fontSize: 20, color: Colors.black),
      decoration: InputDecoration(
        suffixText: suffixText ?? "",
        border: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[850]),
          borderRadius: BorderRadius.circular(50.0),
        ),
        hintText: hintText,
        filled: true,
        fillColor: Colors.grey[200],
        contentPadding: const EdgeInsets.all(20),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(50.0),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.grey[850]),
          borderRadius: BorderRadius.circular(50.0),
        ),
      ),
      // onChanged: isCurrency
      //     ? (string) {
      //         string = '${_formatNumber(string?.replaceAll(',', '')) ?? "0"}';
      //         controller.value = TextEditingValue(
      //           text: string,
      //           selection: TextSelection.collapsed(offset: string.length),
      //         );
      //       }
      //     : (string) {},
    );
  }
}
