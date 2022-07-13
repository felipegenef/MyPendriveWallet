import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_pendrive_wallet_desktop/app/constants.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/input.dart';

class ShowSeedCard extends StatefulWidget {
  const ShowSeedCard({Key key, this.imageURL, this.mnemonic}) : super(key: key);
  final String imageURL;
  final String mnemonic;

  @override
  State<ShowSeedCard> createState() => _ShowSeedCardState();
}

class _ShowSeedCardState extends State<ShowSeedCard> {
  TextEditingController walletNameController = TextEditingController();
  TextEditingController walletPasswordController = TextEditingController();
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
  List<FocusNode> nodes;

  List<Map<String, dynamic>> firstRowinputs = [];
  List<Map<String, dynamic>> secondRowinputs = [];
  List<Map<String, dynamic>> thirdRowinputs = [];

  bool submitedValidSeed = false;
  @override
  void initState() {
    super.initState();
    initInputs();
  }

  void initInputs() {
    var mnemonics = widget.mnemonic.split(" ");
    setState(() {
      // set first row of inputs data
      firstRowinputs = [
        {
          "label": "1",
          "controller": firstMnemonicController,
        },
        {
          "label": "2",
          "controller": secondMnemonicController,
        },
        {
          "label": "3",
          "controller": thirdMnemonicController,
        },
        {
          "label": "4",
          "controller": fourthMnemonicController,
        },
      ];
      // set second row of inputs data
      secondRowinputs = [
        {
          "label": "5",
          "controller": fifthMnemonicController,
        },
        {
          "label": "6",
          "controller": sixthMnemonicController,
        },
        {
          "label": "7",
          "controller": seventhMnemonicController,
        },
        {
          "label": "8",
          "controller": eighthMnemonicController,
        },
      ];
      // set third row of inputs data
      thirdRowinputs = [
        {
          "label": "9",
          "controller": ninthMnemonicController,
        },
        {
          "label": "10",
          "controller": tenthMnemonicController,
        },
        {
          "label": "11",
          "controller": eleventhMnemonicController,
        },
        {
          "label": "12",
          "controller": twelfthMnemonicController,
        }
      ];
      // set controllers in a list for grabing all mnemonics in one for in loop
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
    firstMnemonicController.text = mnemonics[0];
    secondMnemonicController.text = mnemonics[1];
    thirdMnemonicController.text = mnemonics[2];
    fourthMnemonicController.text = mnemonics[3];
    fifthMnemonicController.text = mnemonics[4];
    sixthMnemonicController.text = mnemonics[5];
    seventhMnemonicController.text = mnemonics[6];
    eighthMnemonicController.text = mnemonics[7];
    ninthMnemonicController.text = mnemonics[8];
    tenthMnemonicController.text = mnemonics[9];
    eleventhMnemonicController.text = mnemonics[10];
    twelfthMnemonicController.text = mnemonics[11];
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
          if (!submitedValidSeed)
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              for (var input in firstRowinputs)
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Input(
                    readOnly: true,
                    controller: input["controller"],
                    label: input["label"],
                    maxWidth: 150,
                  ),
                ),
            ]),
          if (!submitedValidSeed)
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              for (var input in secondRowinputs)
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Input(
                    readOnly: true,
                    controller: input["controller"],
                    label: input["label"],
                    maxWidth: 150,
                  ),
                ),
            ]),
          if (!submitedValidSeed)
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              for (var input in thirdRowinputs)
                Container(
                  margin:
                      const EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                  child: Input(
                    readOnly: true,
                    controller: input["controller"],
                    label: input["label"],
                    maxWidth: 150,
                  ),
                ),
            ]),
          if (submitedValidSeed)
            Container(
              height: 0,
              constraints: const BoxConstraints(minHeight: 44),
            ),
          if (submitedValidSeed)
            Input(
              controller: walletNameController,
              label: "Nome da Carteira",
            ),
          if (submitedValidSeed)
            Container(
              height: 0,
              constraints: const BoxConstraints(minHeight: 10),
            ),
          if (submitedValidSeed)
            Input(
              controller: walletPasswordController,
              label: "Senha",
              obscureText: true,
            ),
          Container(
            height: 0,
            constraints: BoxConstraints(minHeight: submitedValidSeed ? 90 : 30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin:
                    EdgeInsets.only(top: height / 20, bottom: 30, right: 30),
                child: MaterialButton(
                  hoverColor: Colors.transparent,
                  onPressed: () => Navigator.pop(context),
                  child: const Text(
                    "Voltar",
                    style: TextStyle(color: LIGHT_BLUE, fontSize: 30),
                  ),
                  height: 60,
                  minWidth: 190,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: height / 20, bottom: 30),
                child: MaterialButton(
                  hoverColor: LIGHT_BLUE,
                  onPressed: () =>
                      Navigator.popAndPushNamed(context, "/loginWithPassword"),
                  child: const Text(
                    "Eu Anotei todas",
                    style: TextStyle(color: WHITE, fontSize: 30),
                  ),
                  height: 60,
                  minWidth: 190,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  elevation: 5,
                  color: DARK_BLUE,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
