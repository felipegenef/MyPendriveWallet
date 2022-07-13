import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/Pages/AddWallet/widgets/AddWalletCard.dart';
import 'package:my_pendrive_wallet_desktop/app/Pages/AddWallet/widgets/ShowSeedCard.dart';
import 'package:my_pendrive_wallet_desktop/app/constants.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/Menu.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/whatermarkLogo.dart';

class AddWalletPage extends StatefulWidget {
  const AddWalletPage({Key key}) : super(key: key);

  @override
  State<AddWalletPage> createState() => _AddWalletPageState();
}

class _AddWalletPageState extends State<AddWalletPage> {
  String mnemonic;
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
              children: [
                if (mnemonic == null)
                  AddWalletCard(
                    callbackWithSeeds: (newMnemonic) {
                      setState(() {
                        mnemonic = newMnemonic;
                      });
                    },
                    imageURL: "assets/add.png",
                  ),
                if (mnemonic != null)
                  ShowSeedCard(
                    imageURL: "assets/add.png",
                    mnemonic: mnemonic,
                  )
              ],
            ),
          ),
          const WatermarkLogo()
        ],
      ),
    );
  }
}
