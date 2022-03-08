import 'package:flutter/material.dart';

class MenuItem extends StatelessWidget {
  final String assetImageURL;
  const MenuItem({Key key, this.assetImageURL}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 30),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10000),
        boxShadow: [
          BoxShadow(
            offset: const Offset(0, 15),
            color: Colors.black.withOpacity(0.6),
            spreadRadius: 0,
            blurRadius: 15,
          ),
        ],
      ),
      child: Image(
        height: 40,
        image: AssetImage(assetImageURL),
      ),
    );
  }
}
