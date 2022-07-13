import 'dart:ffi';

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
  String walletName;
  String walletPassword;
  String firstMnemonic;
  String secondMnemonic;
  String thirdMnemonic;
  String fourthMnemonic;
  String fifthMnemonic;
  String sixthMnemonic;
  String seventhMnemonic;
  String eighthMnemonic;
  String ninthMnemonic;
  String tenthMnemonic;
  String eleventhMnemonic;
  String twelfthMnemonic;

  List<TextEditingController> controllers;
  List<FocusNode> nodes;

  List<Map<String, dynamic>> mnemonicData = [];

  bool submitedValidSeed = false;
  @override
  void initState() {
    super.initState();
    initInputs();
  }

  void initInputs() {
    var mnemonics = widget.mnemonic.split(" ");

    setState(() {
      firstMnemonic = mnemonics[0];
      secondMnemonic = mnemonics[1];
      thirdMnemonic = mnemonics[2];
      fourthMnemonic = mnemonics[3];
      fifthMnemonic = mnemonics[4];
      sixthMnemonic = mnemonics[5];
      seventhMnemonic = mnemonics[6];
      eighthMnemonic = mnemonics[7];
      ninthMnemonic = mnemonics[8];
      tenthMnemonic = mnemonics[9];
      eleventhMnemonic = mnemonics[10];
      twelfthMnemonic = mnemonics[11];
      mnemonicData = [
        {
          "label": "1-",
          "text": firstMnemonic,
        },
        {
          "label": "2-",
          "text": secondMnemonic,
        },
        {
          "label": "3-",
          "text": thirdMnemonic,
        },
        {
          "label": "4-",
          "text": fourthMnemonic,
        },
        {
          "label": "5-",
          "text": fifthMnemonic,
        },
        {
          "label": "6-",
          "text": sixthMnemonic,
        },
        {"label": "7-", "text": seventhMnemonic},
        {
          "label": "8-",
          "text": eighthMnemonic,
        },
        {
          "label": "9-",
          "text": ninthMnemonic,
        },
        {
          "label": "10-",
          "text": tenthMnemonic,
        },
        {
          "label": "11-",
          "text": eleventhMnemonic,
        },
        {
          "label": "12-",
          "text": twelfthMnemonic,
        },
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
      padding: const EdgeInsets.symmetric(horizontal: 40),
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
          const Text(
            WRITE_SEED_WARNING,
            style: TextStyle(
                color: DARK_BLUE, fontSize: 22, fontWeight: FontWeight.w600),
          ),
          Container(
            height: 0,
            constraints: const BoxConstraints(minHeight: 20),
          ),
          Wrap(
              alignment: WrapAlignment.start,
              direction: Axis.horizontal,
              children: [
                for (var input in mnemonicData)
                  Container(
                    margin:
                        const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                    constraints:
                        const BoxConstraints(minWidth: 130.0, maxWidth: 130.0),
                    child: Row(
                      children: [
                        Text(
                          input["label"],
                          style: const TextStyle(
                              color: DARK_BLUE,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                        Text(
                          input["text"],
                          style: const TextStyle(
                              color: LIGHT_BLUE,
                              fontSize: 22,
                              fontWeight: FontWeight.w600),
                        ),
                      ],
                    ),
                  ),
              ]),
          Container(
            height: 0,
            constraints: BoxConstraints(minHeight: submitedValidSeed ? 90 : 30),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: EdgeInsets.only(top: height / 20, bottom: 30),
                child: MaterialButton(
                  hoverColor: LIGHT_BLUE,
                  onPressed: () {
                    // TODO change to original network
                    //TODO pass wallet data as params
                    // var wallet = btc.HDWallet.fromSeed(bip39.mnemonicToSeed(mnemonic),
                    //     network: btc.testnet);
                    Navigator.popAndPushNamed(context, "/loginWithPassword");
                  },
                  child: const Text(
                    "Eu Anotei",
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
