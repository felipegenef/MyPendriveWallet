import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/input.dart';

import '../../../../constants.dart';

class NoWalletCard extends StatefulWidget {
  const NoWalletCard({
    Key key,
    this.imageURL,
  }) : super(key: key);
  final String imageURL;

  @override
  State<NoWalletCard> createState() => _NoWalletCardState();
}

class _NoWalletCardState extends State<NoWalletCard> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      height: 550,
      width: 650,
      constraints: const BoxConstraints(
        minWidth: 650,
        maxWidth: 650,
        minHeight: 550,
        maxHeight: 550,
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
              width: 150,
              image: AssetImage(widget.imageURL),
            ),
          ),
          Container(
            height: 0,
            constraints: const BoxConstraints(minHeight: 30),
          ),
          const Text(
            "Oops, parece que você ainda não possui uma carteira registrada. Crie uma agora mesmo!",
            style: TextStyle(
              fontSize: 30,
              color: WHITE,
            ),
            textAlign: TextAlign.center,
          ),
          Container(
            height: 0,
            constraints: const BoxConstraints(minHeight: 20),
          ),
          Container(
            margin: EdgeInsets.only(top: height / 20, bottom: 30),
            child: MaterialButton(
              hoverColor: LIGHT_BLUE,
              onPressed: () {
                Navigator.popAndPushNamed(context, "/addWallet");
              },
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
