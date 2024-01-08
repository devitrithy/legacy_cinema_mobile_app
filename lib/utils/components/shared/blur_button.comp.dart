// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:ui';

import 'package:flutter/material.dart';

class BlurButton extends StatelessWidget {
  final VoidCallback onPressed;
  final Widget child;

  const BlurButton({
    Key? key,
    required this.onPressed,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ClipRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(
            sigmaX: 20,
            sigmaY: 20), // Adjust sigmaX and sigmaY for blur intensity
        child: Material(
          color: Colors.transparent, // Ensure transparent background
          child: InkWell(
            onTap: onPressed,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey, width: 1),
                borderRadius: BorderRadius.circular(20),
              ),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}
