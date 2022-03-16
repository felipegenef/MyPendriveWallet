import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/whatermarkLogo.dart';
import 'package:my_pendrive_wallet_desktop/app/ui/Pages/LoginWithPassword/widgets/LoginCard.dart';
import 'package:my_pendrive_wallet_desktop/app/ui/Pages/LoginWithPassword/widgets/LoginWithPasswordCard.dart';
import 'package:my_pendrive_wallet_desktop/app/ui/Pages/LoginWithPassword/widgets/NoWalletCard.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../constants.dart';
import '../../../global/widgets/Menu.dart';

class LoginWithPasswordPage extends StatefulWidget {
  const LoginWithPasswordPage({Key key}) : super(key: key);

  @override
  State<LoginWithPasswordPage> createState() => _LoginWithPasswordPageState();
}

class _LoginWithPasswordPageState extends State<LoginWithPasswordPage> {
  var wallets = [];
  String currentWalletName = "";
  @override
  void initState() {
    super.initState();
    getWallets();
  }

  void getWallets() async {
    var currentWalletExists = await checkCurrentWalletExistence();
    var prefs = await SharedPreferences.getInstance();
    var walletNames = prefs.getStringList("walletNames");
    if (walletNames != null && currentWalletExists) {
      setState(() {
        wallets = walletNames;
      });
    }
  }

  Future<bool> checkCurrentWalletExistence() async {
    var prefs = await SharedPreferences.getInstance();
    var currentWallet = prefs.getString("currentWallet");
    if (currentWallet == null) {
      return false;
    } else {
      setState(() {
        currentWalletName = currentWallet;
      });
      return true;
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var appBarHeight = (height / 10);
    return Scaffold(
      backgroundColor: BACKGROUND,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: const MenuBubble(),
      body: Stack(
        children: [
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: width,
            height: height,
            alignment: Alignment.center,
            constraints: BoxConstraints(maxWidth: width, maxHeight: height),
            padding: EdgeInsets.only(top: appBarHeight),
            child: SingleChildScrollView(
              controller: ScrollController(
                  initialScrollOffset: 0, keepScrollOffset: false),
              child: Wrap(
                alignment:
                    width < 825 ? WrapAlignment.center : WrapAlignment.start,
                direction: width < 450 ? Axis.vertical : Axis.horizontal,
                children: [
                  if (currentWalletName == "")
                    for (var wallet in wallets)
                      LoginWithPasswordCard(
                        onClick: () {
                          print("add");
                          setState(() {
                            currentWalletName = wallet;
                          });
                        },
                        label: wallet,
                      ),
                  if (wallets.isEmpty && currentWalletName == "")
                    const NoWalletCard(
                      imageURL: "assets/user.png",
                    ),
                  if (currentWalletName != "")
                    LoginCard(
                      back: () {
                        setState(() {
                          currentWalletName = "";
                        });
                      },
                      imageURL: "assets/user.png",
                      walletName: currentWalletName,
                    )
                ],
              ),
            ),
          ),
          const WatermarkLogo()
        ],
      ),
    );
  }
}
