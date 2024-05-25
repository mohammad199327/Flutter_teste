import 'package:flutter/material.dart';
import 'package:flutter_application_test/VIEW/page/final.dart';
import 'package:flutter_application_test/constant/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class AddControler extends GetxController {
  final String todo;
  final String userId;

  AddControler({required this.todo, required this.userId});

  Future<void> addTodo(String todo, String userId) async {
    Get.defaultDialog(
      title: 'Add Todo',
      content: const Center(child: CircularProgressIndicator()),
    );
    final response = await http.post(
      Uri.parse(addtodopath),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
      },
      body: jsonEncode(<String, dynamic>{
        'todo': todo,
        'completed': true,
        'userId': userId,
      }),
    );
    print("responsr is $response");

    if (response.statusCode == 200) {
      Get.offAll(() => const Final());
      Get.snackbar(
        'Success',
        'Todo added successfully',
      );
      print(
          '==================================================================');
      print('Todo added successfully and responce body is   ${response.body}');
      print(
          '==================================================================');
    } else {
      Get.back();
      Get.snackbar(
        'Error',
        'Failed to add todo',
      );
      print('Failed to add todo');
    }
  }
}
