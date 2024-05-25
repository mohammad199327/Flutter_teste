import 'package:flutter/material.dart';
import 'package:flutter_application_test/VIEW/page/final.dart';
import 'package:flutter_application_test/constant/constant.dart';
import 'package:flutter_application_test/main.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class SignInController extends GetxController {
  final String username;
  final String passowrd;

  SignInController(this.username, this.passowrd);

  loginUser(String username, String password) async {
    Get.defaultDialog(
      title: 'Loading',
      content: const Center(child: CircularProgressIndicator()),
    );
    var url = Uri.parse(loginUrl);
    var response = await http.post(
      url,
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'username': username,
        'password': password,

        'expiresInMins': 30, // optional, defaults to 60
      }),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> t = jsonDecode(response.body);
      prefs!.setString('id', t['id'].toString());

      Get.offAll(() => const Final());
    } else {
      Get.back();
      Get.snackbar('Error', 'login failed');
    }
  }
}
