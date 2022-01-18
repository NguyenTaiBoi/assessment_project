import 'package:accessment_mobile_project/data/file_model.dart';
import 'package:accessment_mobile_project/repository/file_repository.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

class FileViewModel extends GetxController with WidgetsBindingObserver {
  RxList<FileModel> _listFiles = RxList<FileModel>([]);
  List<FileModel> get listFiles => _listFiles;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getListFiles();
    super.onInit();
  }

  Future<void> getListFiles() async {
    String id = Get.arguments;
    await FileRepository.instance.getListFiles(id).then((value) {
      _listFiles.value = value;
      isLoading.value = false;
    });
    update();
  }

  Future<void> uploadFile(String filePath) async {
    await FileRepository.instance.uploadFiles(1, filePath);
    getListFiles();
  }

  Future openFile({String url, String fileName}) async {
    final file = await FileRepository.instance.downloadFile(url, fileName);
    if (file == null) {
      return;
    }
    print("path>>>>> ${file.path}");
    OpenFile.open(file.path);
  }
}
