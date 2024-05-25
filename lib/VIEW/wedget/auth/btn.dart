import 'package:flutter/material.dart';

class CustomButtonAuth extends StatelessWidget {
  final String label;
  final VoidCallback onPressed;

  const CustomButtonAuth({
    super.key,
    required this.label,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: onPressed,
      color: Colors.lightBlue[100],
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(6),
      ),
      child: Text(label),
    );
  }
}
