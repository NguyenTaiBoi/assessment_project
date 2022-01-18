import 'package:accessment_mobile_project/data/document_model.dart';
import 'package:accessment_mobile_project/repository/document_repository.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

class DocumentViewModel extends GetxController with WidgetsBindingObserver {
  RxList<Document> _listDocument = RxList<Document>([]);
  List<Document> get listDocuments => _listDocument;
  RxBool isLoading = true.obs;

  @override
  void onInit() {
    getListDocument();
    super.onInit();
  }

  Future<void> getListDocument() async {
    await DocumentRepository.instance.getListDocument().then((value) {
      _listDocument.value = value;
      isLoading.value = false;
      print("${_listDocument.length}");
    });
    update();
  }
}
