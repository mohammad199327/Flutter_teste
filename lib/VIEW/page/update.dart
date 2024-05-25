import 'package:flutter/material.dart';
import 'package:flutter_application_test/CONTROLER/pages/updateControler.dart';
import 'package:flutter_application_test/VIEW/wedget/auth/textformfeld.dart';
import 'package:flutter_application_test/VIEW/wedget/btn.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class UpdatePage extends StatefulWidget {
  final String id;
  final String todoq;
  UpdatePage({super.key, required this.id, required this.todoq});

  @override
  State<UpdatePage> createState() => _UpdatePageState();
}

class _UpdatePageState extends State<UpdatePage> {
  final TextEditingController todo = TextEditingController();
  final UpdateControler update = Get.put(UpdateControler(todoId: "", todo: ""));

  @override
  void initState() {
    setState(() {
      todo.text = widget.todoq;
    });

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Update"),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Column(children: [
            CostomTextFormFeld(
              controller: todo,
              hintText: "update",
            ),
            SizedBox(
              height: 10,
            ),
            CustomButton(
                label: "Update",
                onPressed: () {
                  update.updateTodoStatus(widget.id, todo.text);
                })
          ]),
        ));
  }
}
