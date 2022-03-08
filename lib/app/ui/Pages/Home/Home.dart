import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/ui/Pages/Home/widgets/HomeCard.dart';
import '../../../constants.dart';
import '../../../global/widgets/Menu.dart';

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
                HomeCard(
                  onClick: () {
                    print("add");
                  },
                  imageURL: "assets/add.png",
                  label: "Create new Wallet",
                ),
                HomeCard(
                  onClick: () {
                    print("seed");
                  },
                  imageURL: "assets/user.png",
                  label: "Login with Seed",
                ),
                HomeCard(
                  onClick: () {
                    print("password");
                  },
                  imageURL: "assets/lock.png",
                  label: "Enter password",
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
