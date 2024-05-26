import 'package:flutter/material.dart';
import 'package:flutter_application_test/constant/chsckInternet.dart';
import 'package:flutter_application_test/MODEL/sqflite/DB.dart';
import 'package:flutter_application_test/MODEL/sqflite/insertdata.dart';
import 'package:flutter_application_test/VIEW/page/final.dart';
import 'package:flutter_application_test/constant/constant.dart';
import 'package:flutter_application_test/main.dart';
import 'package:get/get.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:sqflite/sqflite.dart';

class HomeControler extends GetxController {
  final String id;
  SqfliteDB db = SqfliteDB();
  ApiHelper todouser = ApiHelper();

  List task = [];

  HomeControler({required this.id});

  // int currePage = 1;
  @override
  void onInit() {
    super.onInit();

    getTodo();
  }

  List data = [];

  getTodo() async {
    Chek testconnection = Chek();
    testconnection.checkconnectivity();
    print("conn in homeCont is ${testconnection}=================");
    Database todo = await db.openDatabaseAsync();
    if (await testconnection == true) {
      var url = Uri.parse("$getdataforuser/${prefs!.getString('id')}");
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        data.clear();
        data.addAll(jsonResponse['todos']);
        todouser.insertInToTodouser(data);
        update();
      }
      data = await db.getAllDatafromtodouser(todo);
      print("print data in if !=200 $data");
      update();
    } else {
      data = await db.getAllDatafromtodouser(todo);
      print(
          "print dadat if conn = ${testconnection.checkconnectivity()} \n data =  $data");
      update();
    }
    // db.closeDatabase(todo);
  }

  deleteTodo(String id) async {
    Get.defaultDialog(
      title: "Deleting...",
      content: const Center(
        child: CircularProgressIndicator(),
      ),
    );

    var url = Uri.parse('$delettodo$id');
    var response = await http.delete(url);
    if (response.statusCode == 200) {
      Get.offAll(() => const Final());
      Get.snackbar("Success", "Deleted Successfully ");
    } else {
      Get.back();
      Get.snackbar("Error", "Error cant delete data");
    }
  }
}
