import 'package:flutter/material.dart';

class Hover extends StatefulWidget {
  const Hover({Key key, this.child, this.onHover}) : super(key: key);
  final Widget child;
  final Function onHover;
  @override
  State<Hover> createState() => _HoverState();
}

class _HoverState extends State<Hover> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onHover: (onHoverValue) {
        if (widget.onHover != null) widget.onHover(onHoverValue);
      },
      child: widget.child,
    );
  }
}
