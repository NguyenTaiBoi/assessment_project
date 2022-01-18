import 'package:accessment_mobile_project/screen/ducument/ducument_screen.dart';
import 'package:accessment_mobile_project/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DocumentScreen extends GetView<DocumentViewModel> {
  DocumentViewModel documentViewModel = Get.put(DocumentViewModel());
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
      body: Obx(() => documentViewModel.isLoading.value
          ? Center(child: CircularProgressIndicator())
          : Padding(
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
                        child: ListView.separated(
                          itemBuilder: (context, index) {
                            return _itemDocument(
                                id: documentViewModel.listDocuments[index].id
                                    .toString(),
                                name: documentViewModel
                                    .listDocuments[index].name);
                          },
                          itemCount: documentViewModel.listDocuments.length,
                          separatorBuilder: (context, index) => SizedBox(
                            height: 10,
                          ),
                        )),
                  ),
                ],
              ))),
    );
  }

  AppBar _buildAppBar() {
    return AppBar(
      title: Text("Document"),
      centerTitle: true,
    );
  }

  Widget _itemDocument({String name, String id}) {
    return GestureDetector(
      onTap: () {
        goTo(screen: "/fileScreen", arg: id.toString());
      },
      child: Row(
        children: [
          Icon(
            Icons.document_scanner,
            size: 50,
          ),
          Text("[$id][Container]$name"),
          Spacer(),
          Icon(
            Icons.delete,
            color: Colors.red,
            size: 40,
          )
        ],
      ),
    );
  }
}
