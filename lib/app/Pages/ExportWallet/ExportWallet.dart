import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/Pages/AddWallet/widgets/AddWalletCard.dart';
import 'package:my_pendrive_wallet_desktop/app/Pages/ExportWallet/ExportWalletCard.dart';
import 'package:my_pendrive_wallet_desktop/app/constants.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/Menu.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/whatermarkLogo.dart';

class ExportWalletPage extends StatefulWidget {
  const ExportWalletPage({Key key}) : super(key: key);

  @override
  State<ExportWalletPage> createState() => _AddWalletPageState();
}

class _AddWalletPageState extends State<ExportWalletPage> {
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
                ExportWalletCard(),
              ],
            ),
          ),
          const WatermarkLogo()
        ],
      ),
    );
  }
}
