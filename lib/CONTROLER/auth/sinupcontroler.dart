import 'package:flutter/material.dart';
import 'package:flutter_application_test/MODEL/sqflite/DB.dart';
import 'package:flutter_application_test/constant/constant.dart';
import 'package:flutter_application_test/VIEW/auth/signin.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:sqflite/sqflite.dart';

class SignUpController extends GetxController {
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String username;
  final int age;

  SignUpController(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.username,
      required this.age});

  Future<void> addUser(String firstName, String lastName, int age,
      String username, String email, String password) async {
    Get.defaultDialog(
      title: 'Loading',
      content: const Center(child: CircularProgressIndicator()),
    );

    final response = await http.post(
      Uri.parse(signUpUrl),
      headers: {'Content-Type': 'application/json'},
      body: jsonEncode({
        'firstName': firstName,
        'lastName': lastName,
        'age': age,
        'username': username,
        'email': email,
        'password': password,
      }),
    );

    if (response.statusCode == 200) {
      SqfliteDB db = SqfliteDB();
      Database sq = await db.openDatabaseAsync();
      db.insertDataUer(sq, firstName + lastName, email, age);
      db.closeDatabase(sq);
      Get.snackbar(
        'Success',
        'User added successfully',
      );

      Get.to(() => SignInPage());
    } else {
      Get.back();
      Get.snackbar(
        'Error',
        'Failed to add user',
      );
    }
  }

  testpassowrd(String password, String confirmPassword) {
    if (password == confirmPassword) {
      return true;
    } else {
      Get.snackbar(
        'Error',
        'Password and confirm password must be same',
      );
      return false;
    }
  }
}
