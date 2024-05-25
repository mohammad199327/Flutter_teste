import 'package:flutter/material.dart';

class CostomTextFormFeldPass extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Icon? prefixIcon;
  final FormFieldValidator<String>? validator;

  const CostomTextFormFeldPass({
    super.key,
    required this.hintText,
    required this.controller,
    this.validator,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: true,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        label: Text(hintText),
        prefixIcon: const Icon(Icons.lock),
      ),
      validator: validator,
    );
  }
}
