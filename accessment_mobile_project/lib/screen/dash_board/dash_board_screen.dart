import 'package:accessment_mobile_project/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:timeline_tile/timeline_tile.dart';

class DashBoardScreen extends StatefulWidget {
  DashBoardScreen({Key key}) : super(key: key);

  @override
  _DashBoardScreenState createState() => _DashBoardScreenState();
}

class _DashBoardScreenState extends State<DashBoardScreen> {
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
                        child: Column(
                          children: [
                            Text("Title"),
                            SingleChildScrollView(
                              scrollDirection: Axis.horizontal,
                              child: Row(
                                children: [
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: TimelineTile(
                                      axis: TimelineAxis.horizontal,
                                      alignment: TimelineAlign.start,
                                      endChild: Container(
                                        constraints: const BoxConstraints(
                                          minWidth: 50,
                                        ),
                                        color: Colors.lightGreenAccent,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: TimelineTile(
                                      indicatorStyle:
                                          IndicatorStyle(color: Colors.green),
                                      axis: TimelineAxis.horizontal,
                                      alignment: TimelineAlign.start,
                                      endChild: Container(
                                        constraints: const BoxConstraints(
                                          minWidth: 50,
                                        ),
                                        color: Colors.lightGreenAccent,
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 50,
                                    width: 50,
                                    child: TimelineTile(
                                      axis: TimelineAxis.horizontal,
                                      alignment: TimelineAlign.start,
                                      endChild: Icon(Icons.access_alarm),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
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
