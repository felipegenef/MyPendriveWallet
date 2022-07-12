import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/Pages/Wallets/Classes/SupportedCoins.dart';
import 'package:my_pendrive_wallet_desktop/app/Pages/Wallets/widgets/CreateTransactionCard.dart';
// import 'package:my_pendrive_wallet_desktop/app/Pages/ExportWallet/ExportWalletCard.dart';
import 'package:my_pendrive_wallet_desktop/app/Pages/Wallets/widgets/WalletCard.dart';
import 'package:my_pendrive_wallet_desktop/app/constants.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/Menu.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/whatermarkLogo.dart';

class WalletsPage extends StatefulWidget {
  const WalletsPage({Key key}) : super(key: key);

  @override
  State<WalletsPage> createState() => _AddWalletPageState();
}

class _AddWalletPageState extends State<WalletsPage> {
  SuportedCoin transactionCoinData;
  List<SuportedCoin> supportedCoins = [
    SuportedCoin(
        coinName: "Bitcoin",
        imageUrl: "assets/cryptoIcons/256x256/Bitcoin.png",
        walletAddress: "3FZbgi29cpjq2GjdwV8eyHuJJnkLtktZc5"),
    SuportedCoin(
        coinName: "Ethereum",
        imageUrl: "assets/cryptoIcons/256x256/Ethereum.png",
        walletAddress: "3FZbgi29cpjasdaaddadmaksldmkLtktZc5")
  ];
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

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
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    if (transactionCoinData == null)
                      for (var coin in supportedCoins)
                        WalletCard(
                          onTransferClick: (SuportedCoin coinData) {
                            setState(() {
                              transactionCoinData = coinData;
                            });
                          },
                          imageURL: coin.imageUrl,
                          coinName: coin.coinName,
                          walletAddress: coin.walletAddress,
                        ),
                    if (transactionCoinData != null)
                      CreateTransactionCard(
                        imageUrl: transactionCoinData.imageUrl,
                        coinName: transactionCoinData.coinName,
                        walletAddress: transactionCoinData.walletAddress,
                        back: () {
                          setState(() {
                            transactionCoinData = null;
                          });
                        },
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
