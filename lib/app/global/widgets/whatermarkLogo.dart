import 'package:flutter/material.dart';

class WatermarkLogo extends StatelessWidget {
  const WatermarkLogo({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: 20,
      left: 20,
      child: ConstrainedBox(
        constraints: const BoxConstraints(
          maxHeight: 70,
        ),
        child: const Image(
          image: AssetImage("assets/logo.png"),
        ),
      ),
    );
  }
}
