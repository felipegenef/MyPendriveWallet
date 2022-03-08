import 'package:flutter/material.dart';
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
            padding: EdgeInsets.only(top: appBarHeight + 20),
            // color: Colors.red,
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                AddWalletCard(
                  onClick: () {
                    print("add");
                  },
                  imageURL: "assets/add.png",
                  label: "Create new Wallet",
                ),
              ],
            ),
          ),
          Row(
            children: [
              Container(
                color: BACKGROUND,
                constraints: BoxConstraints(
                    minHeight: 100, minWidth: width, maxHeight: 400),
                padding:
                    const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                alignment: Alignment.centerLeft,
                width: width - 40,
                height: appBarHeight,
                child: ConstrainedBox(
                  constraints: const BoxConstraints(
                    minHeight: 100,
                  ),
                  child: const Image(
                    image: AssetImage("assets/logo.png"),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
