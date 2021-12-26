import 'package:accessment_mobile_project/screen/dash_board/dash_board_view_model.dart';
import 'package:accessment_mobile_project/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DashBoardScreen extends GetView<DashBoardViewModel> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: _buildAppBar(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: TabBarView(
            children: [
              ListView(
                children: [
                  InkWell(
                    child: Padding(
                      padding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 15),
                      child: Container(
                        height: screenSize(context).height / 3,
                        width: screenSize(context).width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.grey[200],
                            boxShadow: [
                              BoxShadow(
                                  offset: Offset(5, 3),
                                  color: Colors.grey,
                                  blurRadius: 5)
                            ]),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Colors.blue, width: 2),
                                    borderRadius: BorderRadius.circular(15)),
                                child: Text(
                                  "Manger confirmed",
                                  style: TextStyle(
                                      color: Colors.blue, fontSize: 18),
                                ),
                              ),
                              Center(
                                child: Container(
                                  height: 100,
                                  child: SingleChildScrollView(
                                    scrollDirection: Axis.horizontal,
                                    child: Row(
                                      children: [
                                        Container(
                                          height: 50,
                                          width: 80,
                                          child: TimelineTile(
                                            beforeLineStyle:
                                                LineStyle(color: Colors.red),
                                            indicatorStyle: IndicatorStyle(
                                                width: 30,
                                                height: 30,
                                                color: Colors.red),
                                            axis: TimelineAxis.horizontal,
                                            alignment: TimelineAlign.start,
                                            endChild: Container(),
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 80,
                                          child: TimelineTile(
                                            beforeLineStyle:
                                                LineStyle(color: Colors.red),
                                            indicatorStyle: IndicatorStyle(
                                                width: 30,
                                                height: 30,
                                                color: Colors.red),
                                            axis: TimelineAxis.horizontal,
                                            alignment: TimelineAlign.start,
                                            endChild: Container(),
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 80,
                                          child: TimelineTile(
                                            indicatorStyle: IndicatorStyle(
                                                width: 30, height: 30),
                                            axis: TimelineAxis.horizontal,
                                            alignment: TimelineAlign.start,
                                            endChild: Container(),
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 80,
                                          child: TimelineTile(
                                            indicatorStyle: IndicatorStyle(
                                                color: Colors.green,
                                                width: 30,
                                                height: 30),
                                            axis: TimelineAxis.horizontal,
                                            alignment: TimelineAlign.start,
                                            endChild: Icon(
                                              Icons.person,
                                              color: Colors.green,
                                              size: 40,
                                            ),
                                          ),
                                        ),
                                        Container(
                                          height: 50,
                                          width: 80,
                                          child: TimelineTile(
                                            indicatorStyle: IndicatorStyle(
                                                width: 30, height: 30),
                                            axis: TimelineAxis.horizontal,
                                            alignment: TimelineAlign.start,
                                            endChild: Container(),
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              Text(
                                  "[ID001][Frozen][Type01] Check the extent of damage of frozen seafood",
                                  style: TextStyle(
                                      color: Colors.black, fontSize: 18)),
                              SizedBox(
                                height: 15,
                              ),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                              text: "Start date: ",
                                              children: [
                                            TextSpan(text: "01/10/2021")
                                          ])),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      RichText(
                                          text: TextSpan(
                                              style: TextStyle(
                                                  color: Colors.black,
                                                  fontSize: 18),
                                              text: "Due date: ",
                                              children: [
                                            TextSpan(text: "01/12/2021")
                                          ])),
                                    ],
                                  ),
                                  Spacer(),
                                  Column(
                                    children: [
                                      Text("3 days",
                                          style: TextStyle(
                                              color: Colors.black,
                                              fontSize: 18)),
                                      SizedBox(
                                        height: 10,
                                      ),
                                      Container(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 5, horizontal: 15),
                                        decoration: BoxDecoration(
                                            color: Colors.green[300],
                                            borderRadius:
                                                BorderRadius.circular(15)),
                                        child: Text(
                                          "Accessment",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18),
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
                    onTap: () =>
                        goTo(context: context, screen: "/accessmentScreen"),
                  ),
                ],
              ),
              Icon(Icons.directions_transit),
            ],
          ),
        ),
      ),
    );
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
}
