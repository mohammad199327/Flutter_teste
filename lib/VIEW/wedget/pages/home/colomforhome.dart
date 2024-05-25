import 'package:flutter/material.dart';

class colomforhome extends StatelessWidget {
  const colomforhome({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        IconButton(onPressed: () {}, icon: const Icon(Icons.edit_outlined)),
        IconButton(
            onPressed: () {}, icon: const Icon(Icons.delete_forever_rounded)),
      ],
    );
  }
}
