import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/whatermarkLogo.dart';
import 'package:my_pendrive_wallet_desktop/app/ui/Pages/LoginWithPassword/widgets/LoginWithPasswordCard.dart';
import 'package:my_pendrive_wallet_desktop/app/ui/Pages/LoginWithPassword/widgets/NoWalletCard.dart';

import '../../../constants.dart';
import '../../../global/widgets/Menu.dart';

class LoginWithPasswordPage extends StatefulWidget {
  const LoginWithPasswordPage({Key key}) : super(key: key);

  @override
  State<LoginWithPasswordPage> createState() => _LoginWithPasswordPageState();
}

class _LoginWithPasswordPageState extends State<LoginWithPasswordPage> {
  var wallets = [];
  @override
  void initState() {
    super.initState();
    var list = [];
    // for (var i = 1; i < 5; i++) {
    //   list.add("carteira " + i.toString());
    // }
    setState(() {
      wallets = list;
    });
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
                  for (var wallet in wallets)
                    LoginWithPasswordCard(
                      onClick: () {
                        print("add");
                        Navigator.pushNamed(context, "/addWallet");
                      },
                      label: wallet,
                    ),
                  if (wallets.length == 0)
                    const NoWalletCard(
                      imageURL: "assets/user.png",
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
