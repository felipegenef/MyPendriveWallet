import 'package:flutter/material.dart';

import '../../../../constants.dart';

class HomeCard extends StatefulWidget {
  const HomeCard({Key key, this.imageURL, this.onClick, this.label = ""})
      : super(key: key);
  final String imageURL;
  final Function onClick;
  final String label;
  @override
  State<HomeCard> createState() => _HomeCardState();
}

class _HomeCardState extends State<HomeCard> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var isSmallScreen = width < 800;
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      onTap: () {
        if (widget.onClick != null) widget.onClick();
      },
      onHover: (isMouseOver) {
        setState(() {
          isHovered = isMouseOver;
        });
      },
      child: AnimatedContainer(
        height: width / 4,
        width: width / 4.2,
        margin: const EdgeInsets.all(5),
        constraints: const BoxConstraints(minWidth: 252, minHeight: 264),
        curve: Curves.linear,
        duration: const Duration(milliseconds: 300),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(30),
          color: !isHovered ? TRANSPARENT : LIGHT_BLUE,
          boxShadow: [
            BoxShadow(
              offset: const Offset(10, 20),
              color: !isHovered
                  ? Colors.black.withOpacity(0.1)
                  : Colors.black.withOpacity(0.3),
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
                width: width / 9 < 130 ? 130 : width / 9,
                image: AssetImage(widget.imageURL),
              ),
            ),
            Text(
              widget.label,
              style: TextStyle(
                  color: !isHovered ? DARK_BLUE : BACKGROUND,
                  fontSize: width / 45 < 23 ? 23 : width / 45,
                  fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
