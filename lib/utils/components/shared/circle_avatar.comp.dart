// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CircleAvatarPicker extends StatelessWidget {
  const CircleAvatarPicker({
    Key? key,
    this.onTapUp,
    required this.image,
  }) : super(key: key);
  final Function(TapUpDetails)? onTapUp;
  final ImageProvider<Object> image;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapUp: onTapUp,
      child: Container(
        height: 100,
        width: 100,
        clipBehavior: Clip.none,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          image: DecorationImage(
            image: image,
            fit: BoxFit.cover,
          ),
        ),
      ),
    );
  }
}
