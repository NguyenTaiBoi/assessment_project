import 'package:accessment_mobile_project/screen/dash_board/dash_board_view_model.dart';
import 'package:accessment_mobile_project/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';
import 'package:get/get.dart';
import 'dart:convert' show utf8;

class DashBoardScreen extends GetView<DashBoardViewModel> {
  final dashBoardController = Get.put(DashBoardViewModel());

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        length: 2,
        child: Obx(
          () => Scaffold(
            appBar: _buildAppBar(),
            body: controller.isLoadingState.value
                ? Center(child: CircularProgressIndicator())
                : Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 15, vertical: 15),
                    child: TabBarView(
                      children: [
                        ListView.builder(
                          itemBuilder: (context, int index) {
                            return _buildCartItem(context,
                                phase: dashBoardController
                                    .listSurveys.value[index].phase["name"],
                                surveuName:
                                    "[${dashBoardController.listSurveys.value[index].code}] ${dashBoardController.listSurveys.value[index].name}",
                                assessmentCategory: dashBoardController
                                    .listSurveys
                                    .value[index]
                                    .assessmentCategory["name"],
                                createAt: dashBoardController
                                    .listSurveys.value[index].createAt,
                                dueDay: dashBoardController
                                    .listSurveys.value[index].dueDate,
                                status: dashBoardController
                                    .listSurveys.value[index].status,
                                code: dashBoardController
                                    .listSurveys.value[index].code,
                                sence: dashBoardController
                                    .listSurveys.value[index].scene,
                                manager: dashBoardController.listSurveys
                                    .value[index].manager["username"],
                                customer: dashBoardController.listSurveys
                                    .value[index].customer["custNameIT"],
                                estimatePrice: dashBoardController
                                    .listSurveys.value[index].estimatePrice
                                    .toString(),
                                nodeOther: dashBoardController.listSurveys
                                        .value[index].phase["nodeOrder"] -
                                    1,
                                inspectors: dashBoardController.listSurveys.value[index].inspectors);
                          },
                          itemCount:
                              dashBoardController.listSurveys.value.length,
                        ),
                        dashBoardController.listSurveysGoing.value.length == 0
                            ? Center(
                                child: Text("No data"),
                              )
                            : ListView.builder(
                                itemBuilder: (context, int index) {
                                  return _buildCartItem(context,
                                      phase: dashBoardController
                                          .listSurveysGoing
                                          .value[index]
                                          .phase["name"],
                                      surveuName:
                                          "[${dashBoardController.listSurveysGoing.value[index].code}] ${dashBoardController.listSurveysGoing.value[index].name}",
                                      assessmentCategory: dashBoardController
                                          .listSurveysGoing
                                          .value[index]
                                          .assessmentCategory["name"],
                                      createAt: dashBoardController
                                          .listSurveysGoing
                                          .value[index]
                                          .createAt,
                                      dueDay: dashBoardController
                                          .listSurveysGoing
                                          .value[index]
                                          .dueDate,
                                      status: dashBoardController
                                          .listSurveysGoing.value[index].status,
                                      code: dashBoardController
                                          .listSurveysGoing.value[index].code,
                                      sence: dashBoardController
                                          .listSurveysGoing.value[index].scene,
                                      manager: dashBoardController
                                          .listSurveysGoing
                                          .value[index]
                                          .manager["username"],
                                      customer: dashBoardController.listSurveysGoing.value[index].customer["custNameIT"],
                                      estimatePrice: dashBoardController.listSurveysGoing.value[index].estimatePrice.toString(),
                                      nodeOther: dashBoardController.listSurveysGoing.value[index].phase["nodeOrder"] - 1,
                                      inspectors: dashBoardController.listSurveysGoing.value[index].inspectors);
                                },
                                itemCount: dashBoardController
                                    .listSurveysGoing.value.length,
                              ),
                      ],
                    ),
                  ),
          ),
        ));
  }

  AppBar _buildAppBar() {
    return AppBar(
        title: Text("Dash board"),
        centerTitle: true,
        automaticallyImplyLeading: false,
        bottom: const TabBar(
          tabs: [
            Tab(
              text: "Projects assigned",
            ),
            Tab(
              text: "Projects on going",
            ),
          ],
        ));
  }

  Widget _buildCartItem(
    BuildContext context, {
    String phase,
    String surveuName,
    String assessmentCategory,
    String createAt,
    String dueDay,
    String status,
    String code,
    String sence,
    String manager,
    String customer,
    String estimatePrice,
    int nodeOther,
    dynamic inspectors,
  }) {
    return InkWell(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Container(
          height: screenSize(context).height / 2.5,
          width: screenSize(context).width,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
              color: Colors.grey[200],
              boxShadow: [
                BoxShadow(
                    offset: Offset(5, 3), color: Colors.grey, blurRadius: 5)
              ]),
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        phase,
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.blue, width: 2),
                          borderRadius: BorderRadius.circular(15)),
                      child: Text(
                        "$estimatePrice VND",
                        style: TextStyle(color: Colors.blue, fontSize: 18),
                      ),
                    ),
                  ],
                ),
                Center(
                  child: Container(
                    height: 100,
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Container(
                        height: 200,
                        width: 400,
                        child: ConstrainedBox(
                          constraints:
                              BoxConstraints(maxHeight: 200, maxWidth: 400),
                          child: ListView.builder(
                            itemBuilder: (context, index) {
                              if (index == nodeOther) {
                                return itemBuilder(color: Colors.green);
                              } else if (index > nodeOther) {
                                return itemBuilder();
                              }
                              return itemBuilder(color: Colors.red);
                            },
                            itemCount: 6,
                            scrollDirection: Axis.horizontal,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Text(surveuName,
                    style: TextStyle(color: Colors.black, fontSize: 18)),
                SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    Text("Category:"),
                    Text(utf8.decode(utf8.encode(assessmentCategory)))
                  ],
                ),
                SizedBox(
                  height: 15,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ConstrainedBox(
                      constraints: BoxConstraints(
                          maxWidth: screenSize(context).width - 200),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  text: "Start date: ",
                                  children: [TextSpan(text: createAt)])),
                          SizedBox(
                            height: 5,
                          ),
                          RichText(
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  text: "Due date: ",
                                  children: [TextSpan(text: dueDay)])),
                          RichText(
                              maxLines: 2,
                              text: TextSpan(
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18),
                                  text: "Customer: ",
                                  children: [
                                    TextSpan(
                                      text: customer,
                                    )
                                  ])),
                        ],
                      ),
                    ),
                    Spacer(),
                    Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Container(
                          padding:
                              EdgeInsets.symmetric(vertical: 5, horizontal: 15),
                          decoration: BoxDecoration(
                              color: Colors.green[300],
                              borderRadius: BorderRadius.circular(15)),
                          child: Text(
                            status,
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ],
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
      onTap: () => goTo(
          screen: "/accessmentScreen",
          arg: [code, sence, manager, phase, inspectors]),
    );
  }

  Widget itemBuilder({Color color = Colors.grey}) {
    return Container(
      height: 50,
      width: 80,
      child: TimelineTile(
        beforeLineStyle: LineStyle(color: color),
        indicatorStyle: IndicatorStyle(width: 30, height: 30, color: color),
        axis: TimelineAxis.horizontal,
        alignment: TimelineAlign.start,
        endChild: color == Colors.green
            ? Icon(
                Icons.person,
                color: Colors.green,
                size: 40,
              )
            : Container(),
      ),
    );
  }
}
