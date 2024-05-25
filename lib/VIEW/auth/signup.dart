import 'package:flutter/material.dart';
import 'package:flutter_application_test/CONTROLER/auth/sinupcontroler.dart';
import 'package:flutter_application_test/VIEW/auth/signin.dart';
import 'package:flutter_application_test/VIEW/wedget/auth/btn.dart';
import 'package:flutter_application_test/VIEW/wedget/auth/textfeldpass.dart';
import 'package:flutter_application_test/VIEW/wedget/auth/textformfeld.dart';
import 'package:flutter_application_test/VIEW/wedget/auth/textformnuber.dart';
import 'package:get/get.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({super.key});

  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final SignUpController controller = Get.put(SignUpController(
      firstName: "",
      lastName: "",
      email: "",
      password: "",
      username: "",
      age: 0));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Sign Up'),
        ),
        body: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  CostomTextFormFeld(
                    hintText: 'first name',
                    controller: firstNameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CostomTextFormFeld(
                    hintText: 'last name',
                    controller: lastNameController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CostomTextFormFeldNumber(
                    hintText: 'Age',
                    controller: ageController,
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CostomTextFormFeld(
                    hintText: 'username',
                    controller: usernameController,
                    prefixIcon: const Icon(Icons.person),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CostomTextFormFeld(
                    hintText: 'Email',
                    controller: emailController,
                    prefixIcon: const Icon(Icons.email),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  CostomTextFormFeldPass(
                      hintText: 'Password', controller: passwordController),
                  const SizedBox(
                    height: 10,
                  ),
                  CostomTextFormFeldPass(
                      hintText: 'Confirm Password',
                      controller: confirmPasswordController),
                  const SizedBox(
                    height: 10,
                  ),
                  CustomButtonAuth(
                    onPressed: () {
                      bool password = controller.testpassowrd(
                          passwordController.text,
                          confirmPasswordController.text);

                      if (firstNameController.text.isNotEmpty &&
                          lastNameController.text.isNotEmpty &&
                          ageController.text.isNotEmpty &&
                          emailController.text.isNotEmpty &&
                          password == true) {
                        controller.addUser(
                          firstNameController.text,
                          lastNameController.text,
                          int.parse(ageController.text),
                          usernameController.text,
                          emailController.text,
                          passwordController.text,
                        );
                      }
                    },
                    label: 'Sign Up',
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text("if you have an acunte "),
                      InkWell(
                        onTap: () {
                          Get.to(() => SignInPage());
                        },
                        child: const Text(
                          "Login",
                          style: TextStyle(color: Colors.purple, fontSize: 18),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
