import 'package:flutter/material.dart';
// ignore: unused_import
import 'package:flutter_application_test/CONTROLER/chsckInternet.dart';
import 'package:flutter_application_test/CONTROLER/pages/homecontroler.dart';
import 'package:flutter_application_test/MODEL/sqflite/DB.dart';
import 'package:flutter_application_test/VIEW/Custom/costomcard.dart';
import 'package:flutter_application_test/VIEW/page/update.dart';
import 'package:flutter_application_test/VIEW/page/add.dart';
import 'package:flutter_application_test/constant/colore.dart';
import 'package:get/get.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});
  final HomeControler homeControler = Get.put(HomeControler(id: ""));
  // final CheckConnect conn = Get.put(CheckConnect());
  final SqfliteDB db = SqfliteDB();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Get.to(() => AddPage());
        },
        child: const Icon(Icons.add),
      ),
      appBar: AppBar(
        title: const Text('Home'),
        backgroundColor: color1,
      ),
      body: Padding(
          padding: const EdgeInsets.all(8),
          child: GetBuilder<HomeControler>(
            builder: (controller) => ListView.builder(
                itemCount: controller.data.length,
                itemBuilder: (context, index) => InkWell(
                    child: CustomForHome(
                        id: " id = ${controller.data[index]['id']}",
                        todo: "todo = ${controller.data[index]['todo']}",
                        delet: () {
                          homeControler
                              .deleteTodo("${controller.data[index]['id']}");
                        },
                        edit: () {
                          Get.to(() => UpdatePage(
                                id: "${controller.data[index]['id']}",
                                todoq: "${controller.data[index]['todo']}",
                              ));
                        },
                        userid:
                            "userid = ${controller.data[index]['userId']}"))),
          )),
    );
  }
}
