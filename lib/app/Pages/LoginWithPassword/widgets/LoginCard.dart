// import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/Custom/lib/src/easy_loading.dart';
import 'package:my_pendrive_wallet_desktop/app/constants.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/input.dart';
import 'package:my_pendrive_wallet_desktop/helpers/encryption.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginCard extends StatefulWidget {
  const LoginCard({
    Key key,
    this.imageURL,
    this.walletName = "",
    this.back,
  }) : super(key: key);
  final String imageURL;
  final String walletName;
  final Function back;

  @override
  State<LoginCard> createState() => _AddWalletCardState();
}

class _AddWalletCardState extends State<LoginCard> {
  TextEditingController walletPasswordController = TextEditingController();
  FocusNode walletPasswordNode = FocusNode();
  @override
  void initState() {
    super.initState();
    walletPasswordNode.requestFocus();
  }

  @override
  void dispose() {
    super.dispose();
    walletPasswordNode.dispose();
  }

  void login() async {
    var prefs = await SharedPreferences.getInstance();
    var seed = prefs.getString("Seed " + widget.walletName);
    try {
      Encryption.decryptFromPassword(walletPasswordController.text, seed);
      Navigator.popAndPushNamed(context, "/wallets");
      prefs.setString("LoggedWallet", widget.walletName);
    } catch (e) {
      EasyLoading.showError("Senha incorreta.");
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    return Container(
      height: height,
      width: width,
      constraints: const BoxConstraints(
        minWidth: 290,
        maxWidth: 750,
        minHeight: 195,
        maxHeight: 560,
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
          Text(
            widget.walletName,
            overflow: TextOverflow.ellipsis,
            textAlign: TextAlign.center,
            style: const TextStyle(
                color: DARK_BLUE, fontSize: 47, fontWeight: FontWeight.w600),
          ),
          Container(
            height: 0,
            constraints: const BoxConstraints(minHeight: 10),
          ),
          Input(
            controller: walletPasswordController,
            label: "",
            obscureText: true,
            node: walletPasswordNode,
            onSubmited: () {
              walletPasswordNode.unfocus();
              login();
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
                    if (widget.back != null) widget.back();
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
                  onPressed: login,
                  child: const Text(
                    "Login",
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
