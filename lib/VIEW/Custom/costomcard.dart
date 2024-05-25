import 'package:flutter/material.dart';
import 'package:flutter_application_test/VIEW/wedget/pages/home/ListTile.dart';

class CustomForHome extends StatelessWidget {
  final String id;
  final String todo;
  final String userid;
  final String? image;
  final void Function()? edit;
  final void Function()? delet;

  const CustomForHome(
      {super.key,
      required this.id,
      required this.todo,
      required this.userid,
      this.edit,
      this.delet,
      this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.amber[50],
        child: Card(
            child: Row(
          children: [
            Expanded(
              flex: 3,
              child: Listtilehome(id: id, todo: todo, userid: userid),
            ),
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  IconButton(
                      onPressed: edit, icon: const Icon(Icons.edit_outlined)),
                  IconButton(
                      onPressed: delet,
                      icon: const Icon(Icons.delete_forever_rounded)),
                ],
              ),
            )
          ],
        )));
  }
}
