import 'package:accessment_mobile_project/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:timelines/timelines.dart';

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
                            Container(
                              child: Timeline.tileBuilder(
                                builder: TimelineTileBuilder.fromStyle(
                                  contentsAlign: ContentsAlign.basic,
                                  contentsBuilder: (context, index) =>
                                      Container(
                                    color: Colors.black,
                                    height: 10,
                                    width: 10,
                                  ),
                                  itemCount: 2,
                                ),
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
