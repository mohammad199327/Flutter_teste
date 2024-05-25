import 'package:flutter/material.dart';
import 'package:flutter_application_test/CONTROLER/pages/Pagination.dart';
import 'package:flutter_application_test/CONTROLER/pages/homecontroler.dart';
import 'package:flutter_application_test/CONTROLER/pages/updateControler.dart';
import 'package:flutter_application_test/VIEW/page/update.dart';
import 'package:flutter_application_test/VIEW/wedget/pageination/card_pageination.dart';
import 'package:flutter_application_test/constant/colore.dart';
import 'package:get/get.dart';
import 'package:pagination_view/pagination_view.dart';

class Pagination_view extends StatefulWidget {
  const Pagination_view({super.key});

  @override
  State<Pagination_view> createState() => _Pagination_viewState();
}

class _Pagination_viewState extends State<Pagination_view> {
  Pageinationcontroler controler = Get.put(Pageinationcontroler());
  HomeControler homeControler = Get.put(HomeControler(id: ""));
  UpdateControler update = Get.put(UpdateControler(todoId: "", todo: ""));
  late String getid;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Pagination Example'),
          backgroundColor: color1,
        ),
        body: PaginationView<dynamic>(
          itemBuilder: (BuildContext context, dynamic task, int index) {
            return InkWell(
              child: CardPagination(
                id: "${task['id']}",
                todo: "${task['todo']}",
              ),
              onTap: () {
                Get.defaultDialog(
                    title: 'Choose',
                    content: const Text("What did you need"),
                    actions: [
                      ElevatedButton(
                          onPressed: () {
                            homeControler.deleteTodo("${task['id']}");
                            Get.to(() => const Pagination_view());
                          },
                          child: const Text("delete")),
                      ElevatedButton(
                          onPressed: () {
                            Get.to(() => UpdatePage(
                                id: "${task['id']}", todoq: task['todo']));
                          },
                          child: const Text("edit")),
                      ElevatedButton(
                          onPressed: () {
                            Get.back();
                          },
                          child: const Text("back"))
                    ]);
              },
            );
          },
          pageFetch: (int currentListSize) => controler
              .checkInternetAndFetchData(limit: 10, skip: currentListSize),
          onError: (dynamic error) => Center(
            child: Text('Error: $error'),
          ),
          onEmpty: const Center(
            child: Text('No more tasks'),
          ),
        ));
  }
}

//  create dode testing for this page?