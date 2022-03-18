import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/Pages/Home/widgets/HomeCard.dart';
import 'package:my_pendrive_wallet_desktop/app/constants.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/Menu.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/whatermarkLogo.dart';

import 'package:localized/localized.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    var appBarHeight = (height / 10);
    var isSmallScreen = width < 800;
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
            constraints: BoxConstraints(maxWidth: width, maxHeight: height),
            padding: EdgeInsets.only(top: appBarHeight + 20),
            // color: Colors.red,
            child: Container(
              constraints: BoxConstraints(maxWidth: width, maxHeight: height),
              alignment: Alignment.center,
              child: SingleChildScrollView(
                controller: ScrollController(
                    initialScrollOffset: 0, keepScrollOffset: false),
                child: Flex(
                  direction: isSmallScreen ? Axis.vertical : Axis.horizontal,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    HomeCard(
                      onClick: () {
                        Navigator.pushNamed(context, "/addWallet");
                      },
                      imageURL: "assets/add.png",
                      label: "Create new Wallet".localized(context),
                    ),
                    HomeCard(
                      onClick: () {
                        Navigator.pushNamed(context, "/loginWithSeed");
                      },
                      imageURL: "assets/user.png",
                      label: "Login with Seed",
                    ),
                    HomeCard(
                      onClick: () {
                        print("password");
                        Navigator.pushNamed(context, "/loginWithPassword");
                      },
                      imageURL: "assets/lock.png",
                      label: "Enter password",
                    ),
                  ],
                ),
              ),
            ),
          ),
          const WatermarkLogo()
        ],
      ),
    );
  }
}
