import 'package:flutter/material.dart';

class CostomTextFormFeld extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Icon? prefixIcon;
  final FormFieldValidator<String>? validator;

  const CostomTextFormFeld({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
        // hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        label: Text(hintText),
        prefixIcon: prefixIcon,
      ),
      validator: validator,
    );
  }
}
