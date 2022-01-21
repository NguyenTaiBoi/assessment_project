import 'dart:io';

import 'package:accessment_mobile_project/data/file_model.dart';
import 'package:dio/dio.dart';
import 'package:http/http.dart' as http;
import 'package:path_provider/path_provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FileRepository {
  final Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  FileRepository._();

  static final FileRepository _instance = FileRepository._();

  static FileRepository get instance => _instance;
  Future<List<FileModel>> getListFiles(String id) async {
    final SharedPreferences prefs = await _prefs;

    try {
      var res = await http.get(
        Uri.parse("http://192.168.1.145:8080/file/search?documentId=$id"),
        headers: {
          "content-type": "application/json",
          "accept": "application/json",
          'Authorization': 'Bearer ${prefs.getString("tokenStorageKey")}',
        },
      );
      if (res.statusCode == 200) {
        List<FileModel> list = fileModelFromJson(res.body);
        print(res.body);
        print("list>>> ${list.length}");
        return list;
      }
      return <FileModel>[];
    } catch (e) {
      print(e.toString());
      return <FileModel>[];
    }
  }

  Future uploadFiles(int documentId, String filePath) async {
    final SharedPreferences prefs = await _prefs;
    String url = "http://192.168.1.145:8080/api/file/upload-file-document";

    try {
      print(filePath);
      String fileName = filePath.split('/').last;
      FormData formData = FormData.fromMap({
        "documentId": documentId,
        "file": await MultipartFile.fromFile(filePath, filename: fileName)
      });
      var response = await Dio().post(url,
          data: formData,
          options: Options(headers: {
            'Authorization': 'Bearer ${prefs.getString("tokenStorageKey")}'
          }));
      if (response.statusCode == 201) {
        print("ok");
      } else
        print("fail");
    } catch (e) {
      print(e.toString());
    }
  }

  Future<File> downloadFile(String url, String name) async {
    try {
      final appStorage = await getApplicationSupportDirectory();
      final file = File("${appStorage.path}/$name");

      final response = await Dio().get(url,
          options: Options(
              responseType: ResponseType.bytes,
              followRedirects: false,
              receiveTimeout: 0));

      final raf = file.openSync(mode: FileMode.write);
      raf.writeFromSync(response.data);
      await raf.close();
      return file;
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
