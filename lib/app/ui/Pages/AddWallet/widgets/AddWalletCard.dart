import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

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
  TextEditingController walletNameController = TextEditingController();
  FocusNode walletNameNode = FocusNode();
  bool walletNameFocused = false;
  TextEditingController walletPasswordController = TextEditingController();
  FocusNode walletPasswordNode = FocusNode();
  bool walletPasswordFocused = false;
  void _onFocusChange() {
    setState(() {
      walletNameFocused = walletNameNode.hasFocus;
      walletPasswordFocused = walletPasswordNode.hasFocus;
    });
  }

  @override
  void initState() {
    super.initState();
    walletNameNode.addListener(_onFocusChange);
    walletPasswordNode.addListener(_onFocusChange);
  }

  @override
  void dispose() {
    super.dispose();
    walletNameNode.removeListener(_onFocusChange);
    walletNameNode.dispose();
    walletPasswordNode.removeListener(_onFocusChange);
    walletPasswordNode.dispose();
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      height: height / 1.4,
      width: width / 1.4,
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
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: TextField(
              focusNode: walletNameNode,
              decoration: InputDecoration(
                label: Container(
                  margin: EdgeInsets.only(bottom: !walletNameFocused ? 80 : 0),
                  child: !walletNameFocused
                      ? const Text(
                          "Nome da Carteira",
                          style: TextStyle(
                              color: DARK_BLUE,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )
                      : Container(
                          width: 0,
                        ),
                ),
                fillColor: INPUT_BACKGROUND,
                filled: true,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: DARK_BLUE, width: 5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              controller: walletNameController,
            ),
          ),
          Container(
            constraints: const BoxConstraints(maxWidth: 400),
            child: TextField(
              obscureText: true,
              focusNode: walletPasswordNode,
              decoration: InputDecoration(
                label: Container(
                  margin:
                      EdgeInsets.only(bottom: !walletPasswordFocused ? 80 : 0),
                  child: !walletPasswordFocused
                      ? const Text(
                          "Senha",
                          style: TextStyle(
                              color: DARK_BLUE,
                              fontSize: 20,
                              fontWeight: FontWeight.w500),
                        )
                      : Container(
                          width: 0,
                        ),
                ),
                fillColor: INPUT_BACKGROUND,
                filled: true,
                focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: DARK_BLUE, width: 5),
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
              ),
              controller: walletPasswordController,
            ),
          )
        ],
      ),
    );
  }
}
