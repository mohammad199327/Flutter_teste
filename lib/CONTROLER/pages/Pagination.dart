import 'dart:convert';
import 'package:flutter_application_test/MODEL/sqflite/DB.dart';
import 'package:flutter_application_test/MODEL/sqflite/insertdata.dart';
import 'package:flutter_application_test/constant/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_application_test/constant/chsckInternet.dart';
import 'package:sqflite/sqflite.dart';

class Pageinationcontroler extends GetxController {
  List<dynamic> tasks = [];

  ApiHelper aph = ApiHelper();
  SqfliteDB topage = SqfliteDB();

  Future<List<dynamic>> checkInternetAndFetchData(
      {required int limit, required int skip}) async {
    bool isConnected = await checkInternetConnection();
    Database db = await topage.openDatabaseAsync();

    if (isConnected == true) {
      List<dynamic> newData = await fetchTasks(limit: limit, skip: skip);
      if (newData.isNotEmpty) {
        print("the task is in ifnew data isnot empty is   $tasks");
      }
    } else {
      List<Map<String, Object?>> data =
          await topage.getAllDataFromTodopaginetion(db);
      tasks = data;
      topage.closeDatabase(db);
      update();
      print("the task in else is  $tasks");
    }
    return tasks;
  }

  Future<bool> checkInternetConnection() async {
    Chek chek = Chek();
    chek.checkconnectivity();
    print("conn inFn ${chek.checkconnectivity()}");

    return await chek.checkconnectivity();
  }

  Future<List<dynamic>> fetchTasks(
      {required int limit, required int skip}) async {
    Database db = await topage.openDatabaseAsync();

    try {
      final response =
          await http.get(Uri.parse('$pageination$limit&skip=$skip'));
      print("the response is $response ===================================");

      if (response.statusCode == 200) {
        tasks.clear();
        tasks = jsonDecode(response.body)['todos'];
        aph.insertInToPaginetion(tasks);
        topage.closeDatabase(db);
        update();

        return tasks;
      }
    } catch (e) {
      print("error $e");
      List<Map<String, Object?>> data =
          await topage.getAllDataFromTodopaginetion(db);
      tasks = data;
      print("task is $tasks");
      topage.closeDatabase(db);

      update();
      return tasks;
      //print the error
    }
    throw Exception('Failed to load tasks ');
  }
}
