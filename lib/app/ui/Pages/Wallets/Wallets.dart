import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/whatermarkLogo.dart';
import 'package:my_pendrive_wallet_desktop/app/ui/Pages/AddWallet/widgets/AddWalletCard.dart';
import 'package:my_pendrive_wallet_desktop/app/ui/Pages/Home/widgets/HomeCard.dart';
import 'package:my_pendrive_wallet_desktop/app/ui/Pages/Wallets/widgets/WalletCard.dart';
import '../../../constants.dart';
import '../../../global/widgets/Menu.dart';

class WalletsPage extends StatefulWidget {
  const WalletsPage({Key key}) : super(key: key);

  @override
  State<WalletsPage> createState() => _AddWalletPageState();
}

class _AddWalletPageState extends State<WalletsPage> {
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
            child: SingleChildScrollView(
              controller: ScrollController(
                  initialScrollOffset: 0, keepScrollOffset: true),
              child: Center(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: const [
                    SizedBox(
                      height: 100,
                    ),
                    WalletCard(
                      imageURL: "assets/cryptoIcons/256x256/Bitcoin.png",
                      coinName: "Bitcoin",
                      walletAddress: "3FZbgi29cpjq2GjdwV8eyHuJJnkLtktZc5",
                    ),
                    WalletCard(
                      imageURL: "assets/cryptoIcons/256x256/Ethereum.png",
                      coinName: "Ethereum",
                      walletAddress: "3FZbgi29cpjasdaaddadmaksldmkLtktZc5",
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
