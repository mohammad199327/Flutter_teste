import 'package:flutter/material.dart';
import 'package:flutter_application_test/VIEW/auth/signin.dart';
import 'package:flutter_application_test/VIEW/page/final.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

SharedPreferences? prefs;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  prefs = await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'flutter_aplication_test',
      home: prefs!.getString('id') != null
          ? const Final()
          : SignInPage(), // Set the main page as the home page
    );
  }
}
