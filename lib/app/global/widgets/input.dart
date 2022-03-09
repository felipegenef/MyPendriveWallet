import 'package:flutter/material.dart';

import '../../constants.dart';

class Input extends StatefulWidget {
  const Input(
      {Key key, this.controller, this.label = "", this.obscureText = false})
      : super(key: key);
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: const BoxConstraints(maxWidth: 400),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(bottom: 8, left: 2),
            child: Text(
              widget.label,
              style: const TextStyle(
                  color: DARK_BLUE, fontSize: 22, fontWeight: FontWeight.w600),
            ),
          ),
          TextField(
            obscureText: widget.obscureText && isPasswordHidden,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
            decoration: InputDecoration(
              suffix: widget.obscureText
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          isPasswordHidden = !isPasswordHidden;
                        });
                      },
                      child: Icon(
                        !isPasswordHidden
                            ? Icons.visibility_off
                            : Icons.visibility,
                        color: DARK_BLUE,
                      ),
                    )
                  : null,
              fillColor: INPUT_BACKGROUND,
              filled: true,
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: DARK_BLUE, width: 3),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: DARK_BLUE, width: 3),
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              border: const OutlineInputBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
            ),
            controller: widget.controller,
          ),
        ],
      ),
    );
  }
}
