import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/input.dart';

import '../../../../constants.dart';

class LoginWithSeedCard extends StatefulWidget {
  const LoginWithSeedCard({
    Key key,
    this.imageURL,
  }) : super(key: key);
  final String imageURL;

  @override
  State<LoginWithSeedCard> createState() => _LoginWithSeedCardState();
}

class _LoginWithSeedCardState extends State<LoginWithSeedCard> {
  TextEditingController firstMnemonicController = TextEditingController();
  TextEditingController secondMnemonicController = TextEditingController();
  TextEditingController thirdMnemonicController = TextEditingController();
  TextEditingController fourthMnemonicController = TextEditingController();
  TextEditingController fifthMnemonicController = TextEditingController();
  TextEditingController sixthMnemonicController = TextEditingController();
  TextEditingController seventhMnemonicController = TextEditingController();
  TextEditingController eighthMnemonicController = TextEditingController();
  TextEditingController ninthMnemonicController = TextEditingController();
  TextEditingController tenthMnemonicController = TextEditingController();
  TextEditingController eleventhMnemonicController = TextEditingController();
  TextEditingController twelfthMnemonicController = TextEditingController();
  List<TextEditingController> controllers;

  List<Map<String, dynamic>> firstRowinputs = [];
  List<Map<String, dynamic>> secondRowinputs = [];
  List<Map<String, dynamic>> thirdRowinputs = [];
  @override
  void initState() {
    super.initState();
    initInputs();
  }

  void initInputs() {
    setState(() {
      firstRowinputs = [
        {"label": "1", "controller": firstMnemonicController},
        {"label": "2", "controller": secondMnemonicController},
        {"label": "3", "controller": thirdMnemonicController},
        {"label": "4", "controller": fourthMnemonicController},
      ];
      secondRowinputs = [
        {"label": "5", "controller": fifthMnemonicController},
        {"label": "6", "controller": sixthMnemonicController},
        {"label": "7", "controller": seventhMnemonicController},
        {"label": "8", "controller": eighthMnemonicController},
      ];
      thirdRowinputs = [
        {"label": "9", "controller": ninthMnemonicController},
        {"label": "10", "controller": tenthMnemonicController},
        {"label": "11", "controller": eleventhMnemonicController},
        {"label": "12", "controller": twelfthMnemonicController}
      ];
      controllers = [
        firstMnemonicController,
        secondMnemonicController,
        thirdMnemonicController,
        fourthMnemonicController,
        fifthMnemonicController,
        sixthMnemonicController,
        seventhMnemonicController,
        eighthMnemonicController,
        ninthMnemonicController,
        tenthMnemonicController,
        eleventhMnemonicController,
        twelfthMnemonicController
      ];
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      width: width,
      constraints: const BoxConstraints(
        minWidth: 440,
        maxWidth: 1100,
        minHeight: 330,
        maxHeight: 700,
      ),
      // margin: const EdgeInsets.symmetric(horizontal: 60),
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
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: height / 20),
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
              width: 120,
              image: AssetImage(widget.imageURL),
            ),
          ),
          Container(
            height: 0,
            constraints: const BoxConstraints(minHeight: 10),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            for (var input in firstRowinputs)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Input(
                  controller: input["controller"],
                  label: input["label"],
                  maxWidth: 150,
                ),
              ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            for (var input in secondRowinputs)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Input(
                  controller: input["controller"],
                  label: input["label"],
                  maxWidth: 150,
                ),
              ),
          ]),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            for (var input in thirdRowinputs)
              Container(
                margin: const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                child: Input(
                  controller: input["controller"],
                  label: input["label"],
                  maxWidth: 150,
                ),
              ),
          ]),
          Container(
            height: 0,
            constraints: const BoxConstraints(minHeight: 30),
          ),
          Container(
            margin: EdgeInsets.only(top: height / 20, bottom: 30),
            child: MaterialButton(
              hoverColor: LIGHT_BLUE,
              onPressed: () {},
              child: const Text(
                "Criar",
                style: TextStyle(color: WHITE, fontSize: 30),
              ),
              height: 60,
              minWidth: 250,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              elevation: 5,
              color: DARK_BLUE,
            ),
          ),
        ],
      ),
    );
  }
}
