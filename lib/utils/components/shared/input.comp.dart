// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:legacy_cinema/utils/public_used.dart';

// ignore: must_be_immutable
class InputForm extends StatelessWidget {
  bool isKhmer = PublicUsed.storage.read("lang") == 'kh';
  InputForm({
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
      style: TextStyle(
        fontFamily: isKhmer ? "NotoSansKhmer" : "OpenSans",
      ),
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
