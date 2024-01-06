import 'package:flutter/widgets.dart';

class LoadingComponent extends StatelessWidget {
  const LoadingComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Center(
          child: Image.asset("assets/image/dark_logo.png", width: 300),
        ),
      ],
    );
  }
}
