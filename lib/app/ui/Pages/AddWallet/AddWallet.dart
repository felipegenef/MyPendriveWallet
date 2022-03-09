import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/whatermarkLogo.dart';
import 'package:my_pendrive_wallet_desktop/app/ui/Pages/AddWallet/widgets/AddWalletCard.dart';
import 'package:my_pendrive_wallet_desktop/app/ui/Pages/Home/widgets/HomeCard.dart';
import '../../../constants.dart';
import '../../../global/widgets/Menu.dart';

class AddWalletPage extends StatefulWidget {
  const AddWalletPage({Key key}) : super(key: key);

  @override
  State<AddWalletPage> createState() => _AddWalletPageState();
}

class _AddWalletPageState extends State<AddWalletPage> {
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
          Container(
            height: height,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: const [
                AddWalletCard(
                  imageURL: "assets/add.png",
                ),
              ],
            ),
          ),
          WatermarkLogo()
        ],
      ),
    );
  }
}
