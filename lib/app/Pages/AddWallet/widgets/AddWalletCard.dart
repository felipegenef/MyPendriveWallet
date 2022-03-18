import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:my_pendrive_wallet_desktop/app/constants.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/input.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AddWalletCard extends StatefulWidget {
  const AddWalletCard({
    Key key,
    this.imageURL,
  }) : super(key: key);
  final String imageURL;

  @override
  State<AddWalletCard> createState() => _AddWalletCardState();
}

class _AddWalletCardState extends State<AddWalletCard> {
  TextEditingController walletNameController = TextEditingController();
  TextEditingController walletPasswordController = TextEditingController();
  FocusNode walletNameNode = FocusNode();
  FocusNode walletPasswordNode = FocusNode();
  @override
  void initState() {
    super.initState();
    walletNameNode.requestFocus();
  }

  @override
  void dispose() {
    super.dispose();
    walletNameNode.dispose();
    walletPasswordNode.dispose();
  }

  void createWallet() async {
    var prefs = await SharedPreferences.getInstance();
    var encryptedPrefs = EncryptedSharedPreferences();
    var walletNames = prefs.getStringList("walletNames");
    if (walletNames == null) {
      prefs.setStringList("walletNames", [walletNameController.text]);
    } else {
      prefs.setStringList(
          "walletNames", [...walletNames, walletNameController.text]);
    }
    encryptedPrefs.setString(
        "Password " + walletNameController.text, walletPasswordController.text);
    //  encryptedPrefs.setString("Seed " + walletNameController.text,
    // "TODO: add seed here");
    prefs.setString("currentWallet", walletNameController.text);
    Navigator.popAndPushNamed(context, "/loginWithPassword");
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      width: width,
      constraints: const BoxConstraints(
        minWidth: 390,
        maxWidth: 950,
        minHeight: 295,
        maxHeight: 660,
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
            constraints: const BoxConstraints(minHeight: 30),
          ),
          Input(
            controller: walletNameController,
            label: "Nome da Carteira",
            node: walletNameNode,
            onSubmited: () {
              walletNameNode.unfocus();
              walletPasswordNode.requestFocus();
            },
          ),
          Container(
            height: 0,
            constraints: const BoxConstraints(minHeight: 10),
          ),
          Input(
            controller: walletPasswordController,
            label: "Senha",
            obscureText: true,
            node: walletPasswordNode,
            onSubmited: () {
              walletPasswordNode.unfocus();
              createWallet();
            },
          ),
          Container(
            height: 0,
            constraints: const BoxConstraints(minHeight: 20),
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
                    Navigator.pop(context);
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
                  onPressed: createWallet,
                  child: const Text(
                    "Criar",
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
