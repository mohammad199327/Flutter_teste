import 'package:flutter/material.dart';

class CardPagination extends StatelessWidget {
  final String id;
  final String todo;
  const CardPagination({super.key, required this.id, required this.todo});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(id),
        subtitle: Text(todo),
      ),
    );
  }
}
