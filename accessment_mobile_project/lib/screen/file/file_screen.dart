import 'package:accessment_mobile_project/screen/file/file_view_model.dart';
import 'package:file_picker/file_picker.dart';
import 'package:accessment_mobile_project/util/utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FileScreen extends GetView<FileViewModel> {
  FileViewModel fileViewModel = Get.put(FileViewModel());
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
        onPressed: () async {
          final results = await FilePicker.platform.pickFiles();
          if (results == null) return;
          final file = results.files.first;
          fileViewModel.uploadFile(file.path);
          // fileViewModel.openFile(file);
        },
      ),
      resizeToAvoidBottomInset: false,
      appBar: _buildAppBar(),
      body: Obx(() => fileViewModel.isLoading.value
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
                                name: fileViewModel.listFiles[index].name,
                                url: fileViewModel.listFiles[index].url);
                          },
                          itemCount: fileViewModel.listFiles.length,
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
      title: Text("List files"),
      centerTitle: true,
    );
  }

  Widget _itemDocument({String name, String url}) {
    return GestureDetector(
      onTap: () {
        print("$url");
        fileViewModel.openFile(url: url, fileName: url.split("/").last);
      },
      child: Row(
        children: [
          Icon(
            Icons.document_scanner,
            size: 50,
          ),
          Container(
            width: 300,
            child: Text(
              "$name",
              overflow: TextOverflow.ellipsis,
            ),
          ),
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
