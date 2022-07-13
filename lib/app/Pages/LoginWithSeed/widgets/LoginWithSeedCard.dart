import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_pendrive_wallet_desktop/app/constants.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/input.dart';
import 'package:my_pendrive_wallet_desktop/helpers/encryption.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
  FocusNode walletNameNode;
  FocusNode walletPasswordNode;
  FocusNode firstMnemonicNode;
  FocusNode secondMnemonicNode;
  FocusNode thirdMnemonicNode;
  FocusNode fourthMnemonicNode;
  FocusNode fifthMnemonicNode;
  FocusNode sixthMnemonicNode;
  FocusNode seventhMnemonicNode;
  FocusNode eighthMnemonicNode;
  FocusNode ninthMnemonicNode;
  FocusNode tenthMnemonicNode;
  FocusNode eleventhMnemonicNode;
  FocusNode twelfthMnemonicNode;
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
    firstMnemonicNode.requestFocus();
  }

  void submitSeeds() {
    setState(() {
      submitedValidSeed = true;
    });
  }

  void createWallet() async {
    var mnemonicArray = [
      firstMnemonicController.text.replaceAll(" ", ""),
      secondMnemonicController.text.replaceAll(" ", ""),
      thirdMnemonicController.text.replaceAll(" ", ""),
      fourthMnemonicController.text.replaceAll(" ", ""),
      fifthMnemonicController.text.replaceAll(" ", ""),
      sixthMnemonicController.text.replaceAll(" ", ""),
      seventhMnemonicController.text.replaceAll(" ", ""),
      eighthMnemonicController.text.replaceAll(" ", ""),
      ninthMnemonicController.text.replaceAll(" ", ""),
      tenthMnemonicController.text.replaceAll(" ", ""),
      eleventhMnemonicController.text.replaceAll(" ", ""),
      twelfthMnemonicController.text.replaceAll(" ", ""),
    ];
    var mnemonic = mnemonicArray.join(" ");
    var prefs = await SharedPreferences.getInstance();
    var walletNames = prefs.getStringList("walletNames");
    if (walletNames == null) {
      prefs.setStringList("walletNames", [walletNameController.text]);
    } else {
      prefs.setStringList(
          "walletNames", [...walletNames, walletNameController.text]);
    }

    prefs.setString(
        "Seed " + walletNameController.text,
        Encryption.encryptFromPassword(
            walletPasswordController.text, mnemonic));
    prefs.setString("currentWallet", walletNameController.text);
    // TODO change to original network
    //TODO pass wallet data as params
    // var wallet = btc.HDWallet.fromSeed(bip39.mnemonicToSeed(mnemonic),
    //     network: btc.testnet);
    Navigator.popAndPushNamed(context, "/loginWithPassword");
  }

  @override
  void dispose() {
    // Clean up the focus nodes when the Form is disposed.
    for (var node in nodes) {
      node.dispose();
    }

    super.dispose();
  }

  void initInputs() {
    // initiate nodes
    walletNameNode = FocusNode();
    walletPasswordNode = FocusNode();
    firstMnemonicNode = FocusNode();
    secondMnemonicNode = FocusNode();
    thirdMnemonicNode = FocusNode();
    fourthMnemonicNode = FocusNode();
    fifthMnemonicNode = FocusNode();
    sixthMnemonicNode = FocusNode();
    seventhMnemonicNode = FocusNode();
    eighthMnemonicNode = FocusNode();
    ninthMnemonicNode = FocusNode();
    tenthMnemonicNode = FocusNode();
    eleventhMnemonicNode = FocusNode();
    twelfthMnemonicNode = FocusNode();
    setState(() {
      // group nodes
      nodes = [
        walletNameNode,
        walletPasswordNode,
        firstMnemonicNode,
        secondMnemonicNode,
        thirdMnemonicNode,
        fourthMnemonicNode,
        fifthMnemonicNode,
        sixthMnemonicNode,
        seventhMnemonicNode,
        eighthMnemonicNode,
        ninthMnemonicNode,
        tenthMnemonicNode,
        eleventhMnemonicNode,
        twelfthMnemonicNode
      ];
      // set first row of inputs data
      firstRowinputs = [
        {
          "label": "1",
          "controller": firstMnemonicController,
          "node": firstMnemonicNode,
          "submit": () {
            firstMnemonicNode.unfocus();
            secondMnemonicNode.requestFocus();
          }
        },
        {
          "label": "2",
          "controller": secondMnemonicController,
          "node": secondMnemonicNode,
          "submit": () {
            secondMnemonicNode.unfocus();
            thirdMnemonicNode.requestFocus();
          }
        },
        {
          "label": "3",
          "controller": thirdMnemonicController,
          "node": thirdMnemonicNode,
          "submit": () {
            thirdMnemonicNode.unfocus();
            fourthMnemonicNode.requestFocus();
          }
        },
        {
          "label": "4",
          "controller": fourthMnemonicController,
          "node": fourthMnemonicNode,
          "submit": () {
            fourthMnemonicNode.unfocus();
            fifthMnemonicNode.requestFocus();
          }
        },
      ];
      // set second row of inputs data
      secondRowinputs = [
        {
          "label": "5",
          "controller": fifthMnemonicController,
          "node": fifthMnemonicNode,
          "submit": () {
            fifthMnemonicNode.unfocus();
            sixthMnemonicNode.requestFocus();
          }
        },
        {
          "label": "6",
          "controller": sixthMnemonicController,
          "node": sixthMnemonicNode,
          "submit": () {
            sixthMnemonicNode.unfocus();
            seventhMnemonicNode.requestFocus();
          }
        },
        {
          "label": "7",
          "controller": seventhMnemonicController,
          "node": seventhMnemonicNode,
          "submit": () {
            seventhMnemonicNode.unfocus();
            eighthMnemonicNode.requestFocus();
          }
        },
        {
          "label": "8",
          "controller": eighthMnemonicController,
          "node": eighthMnemonicNode,
          "submit": () {
            eighthMnemonicNode.unfocus();
            ninthMnemonicNode.requestFocus();
          }
        },
      ];
      // set third row of inputs data
      thirdRowinputs = [
        {
          "label": "9",
          "controller": ninthMnemonicController,
          "node": ninthMnemonicNode,
          "submit": () {
            ninthMnemonicNode.unfocus();
            tenthMnemonicNode.requestFocus();
          }
        },
        {
          "label": "10",
          "controller": tenthMnemonicController,
          "node": tenthMnemonicNode,
          "submit": () {
            tenthMnemonicNode.unfocus();
            eleventhMnemonicNode.requestFocus();
          }
        },
        {
          "label": "11",
          "controller": eleventhMnemonicController,
          "node": eleventhMnemonicNode,
          "submit": () {
            eleventhMnemonicNode.unfocus();
            twelfthMnemonicNode.requestFocus();
          }
        },
        {
          "label": "12",
          "controller": twelfthMnemonicController,
          "node": twelfthMnemonicNode,
          "submit": () {
            twelfthMnemonicNode.unfocus();
            submitSeeds();
          },
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
                    node: input["node"],
                    controller: input["controller"],
                    label: input["label"],
                    onSubmited: input["submit"],
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
                    node: input["node"],
                    controller: input["controller"],
                    label: input["label"],
                    onSubmited: input["submit"],
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
                    node: input["node"],
                    controller: input["controller"],
                    label: input["label"],
                    onSubmited: input["submit"],
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
              node: walletNameNode,
              onSubmited: () {
                walletNameNode.unfocus();
                walletPasswordNode.requestFocus();
              },
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
              node: walletPasswordNode,
              onSubmited: createWallet,
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
                  onPressed: () {
                    if (submitedValidSeed) {
                      setState(() {
                        submitedValidSeed = false;
                      });
                    } else {
                      Navigator.pop(context);
                    }
                  },
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
                  onPressed: !submitedValidSeed ? submitSeeds : createWallet,
                  child: Text(
                    !submitedValidSeed ? "Próximo" : "Criar",
                    style: const TextStyle(color: WHITE, fontSize: 30),
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
