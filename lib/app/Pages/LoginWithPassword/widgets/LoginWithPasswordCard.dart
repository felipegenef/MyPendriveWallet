import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/constants.dart';

class LoginWithPasswordCard extends StatefulWidget {
  const LoginWithPasswordCard({Key key, this.onClick, this.label = ""})
      : super(key: key);

  final Function onClick;
  final String label;
  @override
  State<LoginWithPasswordCard> createState() => _LoginWithPasswordCardState();
}

class _LoginWithPasswordCardState extends State<LoginWithPasswordCard> {
  bool isHovered = false;
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
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
        height: 252,
        width: 264,
        padding: const EdgeInsets.all(2.5),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 20),
        constraints: const BoxConstraints(
            minWidth: 252, maxWidth: 352, minHeight: 264, maxHeight: 364),
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
              child: const Image(
                width: 140,
                image: AssetImage("assets/user.png"),
              ),
            ),
            Text(
              widget.label,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: TextStyle(
                  color: !isHovered ? DARK_BLUE : BACKGROUND,
                  fontSize: 23,
                  fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
