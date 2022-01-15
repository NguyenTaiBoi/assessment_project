import 'package:accessment_mobile_project/screen/accessment/accessment_view_model.dart';
import 'package:accessment_mobile_project/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AccessmentScreen extends GetView<AccessmentViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
        appBar: AppBar(
          title: Text(Get.arguments[0].toString()),
        ),
        body: controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : SingleChildScrollView(
                child: Container(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 80,
                          width: double.infinity,
                          color: Colors.grey[600],
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      "Scece",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                  content: Container(
                                                height: 220,
                                                width: 200,
                                                child: ListView.separated(
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          SizedBox(
                                                    height: 15,
                                                  ),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return _itemItem(controller
                                                        .manager.value);
                                                  },
                                                  itemCount: 1,
                                                ),
                                              ));
                                            });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.blue[600],
                                        primary: Colors.lime,
                                        shape: const BeveledRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                      ),
                                      child: Text(
                                        "Manager",
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                  content: Container(
                                                height: 220,
                                                width: 200,
                                                child: ListView.separated(
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          SizedBox(
                                                    height: 15,
                                                  ),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return _itemItem(controller
                                                            .listInspectors
                                                            .value[index]
                                                        ["username"]);
                                                  },
                                                  itemCount: controller
                                                      .listInspectors
                                                      .value
                                                      .length,
                                                ),
                                              ));
                                            });
                                      },
                                      style: TextButton.styleFrom(
                                        backgroundColor: Colors.green[700],
                                        primary: Colors.lime,
                                        shape: const BeveledRectangleBorder(
                                            borderRadius: BorderRadius.all(
                                                Radius.circular(5))),
                                      ),
                                      child: Text("Inspector",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                    ),
                                  ],
                                ),
                                Text(
                                  Get.arguments[1].toString(),
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold),
                                ),
                                // Text(Get.arguments[2].toString()),
                                // Text("Inspector"),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          height: 600,
                          width: double.infinity,
                          child: ListView.separated(
                            separatorBuilder: (context, index) => Container(
                              height: 1,
                              width: double.infinity,
                              color: Colors.grey,
                            ),
                            itemBuilder: (context, int index) {
                              return _buildItemCard(
                                context,
                                title: controller
                                        .listComments.value[index]?.title ??
                                    "",
                                content: controller
                                        .listComments.value[index]?.content ??
                                    "",
                                userName: controller.listComments.value[index]
                                        ?.user["username"] ??
                                    "",
                                confirmation: controller.listComments
                                        .value[index]?.confirmations ??
                                    [],
                              );
                            },
                            itemCount: controller.listComments.value.length,
                          ),
                        ),
                        Container(
                          padding:
                              EdgeInsets.only(left: 10, bottom: 10, top: 10),
                          height: 130,
                          width: double.infinity,
                          color: Colors.white,
                          child: Column(
                            children: [
                              Row(
                                children: [
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.blue),
                                      onPressed: () {
                                        showDialog(
                                            context: context,
                                            builder: (context) {
                                              return AlertDialog(
                                                  content: Container(
                                                height: 220,
                                                width: 200,
                                                child: ListView.separated(
                                                  separatorBuilder:
                                                      (context, index) =>
                                                          SizedBox(
                                                    height: 15,
                                                  ),
                                                  itemBuilder:
                                                      (context, index) {
                                                    return Row(
                                                      children: [
                                                        CircleAvatar(
                                                          backgroundColor:
                                                              Colors.blue,
                                                        ),
                                                        SizedBox(
                                                          width: 10,
                                                        ),
                                                        Text(controller
                                                            .listUsers
                                                            .value[index]
                                                            .username),
                                                        Spacer(),
                                                        IconButton(
                                                            onPressed: () {
                                                              controller.onTagUser(
                                                                  controller
                                                                      .listUsers
                                                                      .value[
                                                                          index]
                                                                      .username);
                                                            },
                                                            icon:
                                                                Icon(Icons.add))
                                                      ],
                                                    );
                                                  },
                                                  itemCount: controller
                                                      .listUsers.value.length,
                                                ),
                                              ));
                                            });
                                      },
                                      child: Text(
                                        "Tag users",
                                        style: TextStyle(color: Colors.white),
                                      )),
                                  Spacer(),
                                  TextButton(
                                      style: TextButton.styleFrom(
                                          backgroundColor: Colors.blue),
                                      onPressed: () {
                                        controller.putPhase();
                                      },
                                      child: Text(
                                        "Submit phase",
                                        style: TextStyle(color: Colors.white),
                                      ))
                                ],
                              ),
                              Row(
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
                                      controller: controller.contentController,
                                      decoration: InputDecoration(
                                          hintText: "Write message...",
                                          hintStyle:
                                              TextStyle(color: Colors.black54),
                                          border: InputBorder.none),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 15,
                                  ),
                                  FloatingActionButton(
                                    onPressed: controller.postComment,
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
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              )));
  }

  Widget _buildItemCard(BuildContext context,
      {String userName, String content, String title, dynamic confirmation}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
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
                  userName,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              title,
              style: TextStyle(
                  fontSize: 18,
                  color: Colors.lightBlueAccent,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              content,
              style: TextStyle(fontSize: 18),
            ),
            SizedBox(
              height: 20,
            ),
            confirmation.length == 0
                ? Container()
                : Row(
                    children: [
                      Checkbox(
                          value: true,
                          onChanged: (value) {
                            // setState(() {
                            //   checkBoxValue = value;
                            // });
                          }),
                      InkWell(
                        onTap: () {
                          if (confirmation != []) {
                            showDialog(
                                context: context,
                                builder: (context) {
                                  return AlertDialog(
                                      content: Container(
                                    height: 220,
                                    width: 200,
                                    child: ListView.separated(
                                      separatorBuilder: (context, index) =>
                                          SizedBox(
                                        height: 15,
                                      ),
                                      itemBuilder: (context, index) {
                                        return Row(
                                          children: [
                                            CircleAvatar(
                                              backgroundColor: Colors.blue,
                                            ),
                                            SizedBox(
                                              width: 10,
                                            ),
                                            Text(confirmation[index]["user"]
                                                ["username"]),
                                            Spacer(),
                                            Icon(
                                              confirmation[index]["status"]
                                                  ? Icons.done
                                                  : Icons.cancel,
                                              color: confirmation[index]
                                                      ["status"]
                                                  ? Colors.greenAccent
                                                  : Colors.redAccent,
                                            )
                                          ],
                                        );
                                      },
                                      itemCount: confirmation.length,
                                    ),
                                  ));
                                });
                          }
                        },
                        child: Text(
                          "Confirmed ${getConfirmedUser(confirmation).toString()}/${confirmation.length}",
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
          ],
        ),
      ),
    );
  }

  Widget _itemItem(String userName) {
    return Row(
      children: [
        CircleAvatar(
          backgroundColor: Colors.blue,
        ),
        SizedBox(
          width: 10,
        ),
        Text(userName)
      ],
    );
  }
}
