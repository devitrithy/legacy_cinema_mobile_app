import 'package:flutter/material.dart';

class TextIcon extends StatelessWidget {
  const TextIcon({
    Key? key,
    required this.text,
    required this.icon,
    this.style,
  }) : super(key: key);
  final String text;
  final IconData icon;
  final TextStyle? style;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon),
        const SizedBox(
          width: 5,
        ),
        Text(text, style: style),
      ],
    );
  }
}
