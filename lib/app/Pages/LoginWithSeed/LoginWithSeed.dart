import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/Pages/LoginWithSeed/widgets/LoginWithSeedCard.dart';
import 'package:my_pendrive_wallet_desktop/app/constants.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/Menu.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/whatermarkLogo.dart';

class LoginWithSeedPage extends StatefulWidget {
  const LoginWithSeedPage({Key key}) : super(key: key);

  @override
  State<LoginWithSeedPage> createState() => _LoginWithSeedPageState();
}

class _LoginWithSeedPageState extends State<LoginWithSeedPage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: BACKGROUND,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: const MenuBubble(),
      body: Stack(
        children: [
          SizedBox(
            height: height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                LoginWithSeedCard(
                  imageURL: "assets/user.png",
                ),
              ],
            ),
          ),
          const WatermarkLogo()
        ],
      ),
    );
  }
}
