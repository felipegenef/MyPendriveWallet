import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../../constants.dart';

class Input extends StatefulWidget {
  const Input(
      {Key key,
      this.readOnly = false,
      this.controller,
      this.label = "",
      this.obscureText = false,
      this.maxWidth = 400,
      this.node,
      this.isNumber = false,
      this.onSubmited})
      : super(key: key);
  final TextEditingController controller;
  final String label;
  final bool obscureText;
  final double maxWidth;
  final FocusNode node;
  final Function onSubmited;
  final bool readOnly;
  final bool isNumber;
  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  bool isPasswordHidden = true;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(maxWidth: widget.maxWidth),
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
            onSubmitted: (stringValue) {
              if (widget.onSubmited != null) widget.onSubmited();
            },
            inputFormatters: widget.isNumber
                ? [FilteringTextInputFormatter.digitsOnly]
                : null,
            readOnly: widget.readOnly,
            focusNode: widget.node,
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
