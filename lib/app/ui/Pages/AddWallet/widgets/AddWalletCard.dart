import 'package:flutter/material.dart';

import '../../../../constants.dart';

class AddWalletCard extends StatefulWidget {
  const AddWalletCard({Key key, this.imageURL, this.onClick, this.label = ""})
      : super(key: key);
  final String imageURL;
  final Function onClick;
  final String label;
  @override
  State<AddWalletCard> createState() => _AddWalletCardState();
}

class _AddWalletCardState extends State<AddWalletCard> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: width / 4,
      width: width / 4.2,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: TRANSPARENT,
        boxShadow: [
          BoxShadow(
            offset: const Offset(10, 20),
            color: Colors.black.withOpacity(0.1),
            spreadRadius: 0,
            blurRadius: 1,
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10000),
              boxShadow: [
                BoxShadow(
                  offset: const Offset(5, 20),
                  color: Colors.black.withOpacity(0.3),
                  spreadRadius: 0,
                  blurRadius: 1,
                ),
              ],
            ),
            child: Image(
              width: width / 9,
              image: AssetImage(widget.imageURL),
            ),
          ),
          Text(
            widget.label,
            style: TextStyle(
                color: DARK_BLUE,
                fontSize: width / 45,
                fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
