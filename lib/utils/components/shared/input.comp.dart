// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class InputForm extends StatelessWidget {
  const InputForm({
    Key? key,
    required this.label,
    this.validator,
    required this.icon,
    this.obscureText = false,
    required this.controller,
  }) : super(key: key);
  final String label;
  final String? Function(String?)? validator;
  final Widget icon;
  final bool obscureText;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      validator: validator,
      obscureText: obscureText,
      controller: controller,
      decoration: InputDecoration(
        icon: icon,
        label: Text(label),
        errorMaxLines: 10,
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade400,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey.shade700,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade800,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red.shade800,
          ),
          borderRadius: const BorderRadius.all(Radius.circular(10)),
        ),
        errorStyle: TextStyle(
          color: Colors.red.shade800,
        ),
      ),
    );
  }
}
