import 'package:accessment_mobile_project/screen/accessment/accessment_view_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:timeline_tile/timeline_tile.dart';

class AccessmentScreen extends GetView<AccessmentViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Accessment"),
      ),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
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
                          beforeLineStyle: LineStyle(color: Colors.red),
                          indicatorStyle: IndicatorStyle(
                              width: 30, height: 30, color: Colors.red),
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.start,
                          endChild: Container(),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 80,
                        child: TimelineTile(
                          beforeLineStyle: LineStyle(color: Colors.red),
                          indicatorStyle: IndicatorStyle(
                              width: 30, height: 30, color: Colors.red),
                          axis: TimelineAxis.horizontal,
                          alignment: TimelineAlign.start,
                          endChild: Container(),
                        ),
                      ),
                      Container(
                        height: 50,
                        width: 80,
                        child: TimelineTile(
                          indicatorStyle: IndicatorStyle(width: 30, height: 30),
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
                              color: Colors.green, width: 30, height: 30),
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
                          indicatorStyle: IndicatorStyle(width: 30, height: 30),
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
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(),
                        SizedBox(
                          width: 15,
                        ),
                        Text(
                          "Boi",
                          style: TextStyle(fontSize: 18),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      "Dear Mr.Anh @ThienAnh,\nPlease help me to process next step\n\nPlease be aware of this requirement and help to prepare needed action",
                      style: TextStyle(fontSize: 18),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Checkbox(
                            value: true,
                            onChanged: (value) {
                              // setState(() {
                              //   checkBoxValue = value;
                              // });
                            }),
                        Text(
                          "Confirmed 2/2",
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ),
                        Spacer(),
                        TextButton(
                            style: TextButton.styleFrom(
                                backgroundColor: Colors.blue),
                            onPressed: () {},
                            child: Text(
                              "Submit phase",
                              style: TextStyle(color: Colors.white),
                            ))
                      ],
                    )
                  ],
                ),
              ),
            ),
            Stack(
              children: <Widget>[
                Align(
                  alignment: Alignment.bottomLeft,
                  child: Container(
                    padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
                    height: 60,
                    width: double.infinity,
                    color: Colors.white,
                    child: Row(
                      children: <Widget>[
                        GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 30,
                            width: 30,
                            decoration: BoxDecoration(
                              color: Colors.lightBlue,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 20,
                            ),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        Expanded(
                          child: TextField(
                            decoration: InputDecoration(
                                hintText: "Write message...",
                                hintStyle: TextStyle(color: Colors.black54),
                                border: InputBorder.none),
                          ),
                        ),
                        SizedBox(
                          width: 15,
                        ),
                        FloatingActionButton(
                          onPressed: () {},
                          child: Icon(
                            Icons.send,
                            color: Colors.white,
                            size: 18,
                          ),
                          backgroundColor: Colors.blue,
                          elevation: 0,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
