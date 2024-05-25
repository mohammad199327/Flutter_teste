import 'package:flutter/material.dart';
import 'package:flutter_application_test/VIEW/page/final.dart';
import 'package:flutter_application_test/constant/constant.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class UpdateControler extends GetxController {
  final String todoId;
  final String todo;

  UpdateControler({required this.todoId, required this.todo});

  Future<void> updateTodoStatus(String todoId, String todo) async {
    Get.defaultDialog(
      title: "Updating .....",
      middleText: "Please wait...",
      content: const Center(child: CircularProgressIndicator()),
    );
    final response = await http.put(
      Uri.parse("$updatepath$todoId"),
      headers: <String, String>{
        'Content-Type': 'application/json',
      },
      body: jsonEncode({
        'todo': todo,
      }),
    );

    if (response.statusCode == 200) {
      Get.snackbar("update", "updated successfully");
      Get.offAll(() => Final());
    } else {
      Get.back();
      print('Failed to update todo');
      Get.snackbar("update", "Failed to update todo");
    }
  }
}
