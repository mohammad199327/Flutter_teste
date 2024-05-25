import 'package:flutter/material.dart';
import 'package:flutter_application_test/CONTROLER/auth/login.dart';
import 'package:flutter_application_test/VIEW/auth/signup.dart';
import 'package:flutter_application_test/VIEW/wedget/auth/btn.dart';
import 'package:flutter_application_test/VIEW/wedget/auth/textfeldpass.dart';
import 'package:flutter_application_test/VIEW/wedget/auth/textformfeld.dart';
import 'package:get/get.dart';

class SignInPage extends StatelessWidget {
  final TextEditingController username = TextEditingController();
  final TextEditingController password = TextEditingController();
  final SignInController signInController = Get.put(SignInController("", ""));
  SignInPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Padding(
      padding: const EdgeInsets.all(10),
      child: ListView(
        children: [
          Container(
            height: 80,
          ),
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: const Text('login',
                style: TextStyle(
                  fontSize: 40,
                  color: Colors.black,
                )),
          ),
          const SizedBox(
            height: 10,
          ),
          CostomTextFormFeld(
            hintText: 'username',
            controller: username,
            prefixIcon: const Icon(Icons.person),
          ),
          Container(
            height: 10,
          ),
          CostomTextFormFeldPass(hintText: 'password', controller: password),
          Container(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            child: CustomButtonAuth(
                label: 'login',
                onPressed: () {
                  signInController.loginUser(username.text, password.text);
                  print("username ${username.text}");
                  print("password ${password.text}");
                }),
          ),
          Row(
            children: [
              const Text('Don\'t have an account?'),
              TextButton(
                  onPressed: () {
                    Get.to(() => SignUpPage());
                  },
                  child: const Text(
                    'Register here',
                  ))
            ],
          )
        ],
      ),
    ));
  }
}
