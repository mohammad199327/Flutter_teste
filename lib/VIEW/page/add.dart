import 'package:flutter/material.dart';
import 'package:flutter_application_test/VIEW/wedget/auth/textformfeld.dart';
import 'package:flutter_application_test/VIEW/wedget/btn.dart';
import 'package:flutter_application_test/CONTROLER/pages/addcontroler.dart';
import 'package:flutter_application_test/main.dart';
import 'package:get/get.dart';

class AddPage extends StatelessWidget {
  AddPage({super.key});
  final TextEditingController todo = TextEditingController();
  final AddControler controler = Get.put(AddControler(todo: "", userId: ""));

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add"),
        backgroundColor: Colors.amber[100],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(children: [
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          CostomTextFormFeld(hintText: "todo", controller: todo),
          const SizedBox(
            height: 10,
          ),
          const SizedBox(
            height: 10,
          ),
          Container(
            alignment: Alignment.center,
            width: double.infinity,
            height: 50,
            child: CustomButton(
              label: "Add",
              onPressed: () async {
                String? userId = prefs!.getString('id');
                if (userId != null) {
                  print(userId);
                  await controler.addTodo(todo.text, userId);
                } else {
                  // Handle the case where userId is null
                  print("User ID is null");
                }
              },
            ),
          ),
        ]),
      ),
    );
  }
}
