import 'package:flutter/material.dart';

class CostomTextFormFeldNumber extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Icon? prefixIcon;
  final FormFieldValidator<String>? validator;

  const CostomTextFormFeldNumber({
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
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        label: Text(hintText),
        prefixIcon: prefixIcon,
      ),
      keyboardType: TextInputType.number,
      validator: validator,
    );
  }
}
