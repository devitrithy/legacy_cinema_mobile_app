// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FormComponent extends StatelessWidget {
  const FormComponent({
    super.key,
    this.formKey,
    required this.child,
  });
  final Key? formKey;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        child: SafeArea(
          child: Form(
            key: formKey,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
