import 'package:flutter/material.dart';

class Listtilehome extends StatelessWidget {
  const Listtilehome({
    super.key,
    required this.id,
    required this.todo,
    required this.userid,
  });

  final String id;
  final String todo;
  final String userid;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(id),
      subtitle: Text(todo),
      trailing: Text(userid),
    );
  }
}
