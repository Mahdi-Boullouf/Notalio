import 'package:flutter/material.dart';

class CustomRichTextField extends StatelessWidget {
  const CustomRichTextField({
    super.key,
    required this.controller,
    required this.hintText,
    this.onChanged,
    this.validator,
  });

  final TextEditingController controller;
  final String hintText;
  final Function(String)? onChanged;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onChanged: onChanged,
      maxLines: null,
      validator: validator,
      minLines: 3,
      controller: controller,
      decoration: InputDecoration(
          hintText: hintText,
          isDense: true,
          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10))),
    );
  }
}
