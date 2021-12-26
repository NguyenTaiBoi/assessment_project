import 'package:accessment_mobile_project/screen/ducument/ducument_screen.dart';
import 'package:accessment_mobile_project/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class DocumentScreen extends GetView<DocumentViewModel> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Increment',
        child: new Icon(
          Icons.add,
          color: Colors.red,
        ),
        backgroundColor: Colors.yellow,
        onPressed: () {},
      ),
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
          child: Column(
            children: [
              TextField(
                controller: TextEditingController(),
                autofocus: true,
                decoration: InputDecoration(
                    hintText: "Search Data...",
                    border: InputBorder.none,
                    hintStyle: TextStyle(color: Colors.black),
                    icon: Icon(Icons.search)),
                style: TextStyle(color: Colors.black, fontSize: 16.0),
                // onChanged: (query) {},
                textInputAction: TextInputAction.search,
              ),
              Container(
                height: screenSize(context).height - 200,
                width: screenSize(context).width - 40,
                decoration: BoxDecoration(
                  color: Colors.grey,
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView(
                    children: [
                      Row(
                        children: [
                          Icon(
                            Icons.document_scanner,
                            size: 50,
                          ),
                          Text("[DC001][Container] Documents"),
                          Spacer(),
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 40,
                          )
                        ],
                      ),
                      GestureDetector(
                        onTap: () {},
                        child: Row(
                          children: [
                            Icon(
                              Icons.document_scanner,
                              size: 50,
                            ),
                            Text("[DC002][Container] Documents"),
                            Spacer(),
                            Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 40,
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.document_scanner,
                            size: 50,
                          ),
                          Text("[DC003][Container] Documents"),
                          Spacer(),
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 40,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.document_scanner,
                            size: 50,
                          ),
                          Text("[DC004][Container]  Documents"),
                          Spacer(),
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 40,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.document_scanner,
                            size: 50,
                          ),
                          Text("[DC005][Container]  Documents"),
                          Spacer(),
                          Icon(
                            Icons.delete,
                            color: Colors.red,
                            size: 40,
                          )
                        ],
                      )
                    ],
                  ),
                ),
              )
            ],
          )),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Document"),
      centerTitle: true,
      automaticallyImplyLeading: false,
    );
  }
}
