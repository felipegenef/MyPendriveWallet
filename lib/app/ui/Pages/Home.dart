import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/Custom/Menu.dart';

import '../../constants.dart';

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
      floatingActionButton: MenuBubble(),
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
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: TRANSPARENT,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(10, 20),
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  height: width / 4,
                  width: width / 4.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10000),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(5, 20),
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 0,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Image(
                          width: width / 9,
                          image: const AssetImage("assets/add.png"),
                        ),
                      ),
                      Text(
                        "Create new Wallet",
                        style:
                            TextStyle(color: DARK_BLUE, fontSize: width / 45),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: TRANSPARENT,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(10, 20),
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  height: width / 4,
                  width: width / 4.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10000),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(5, 20),
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 0,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Image(
                          width: width / 9,
                          image: const AssetImage("assets/user.png"),
                        ),
                      ),
                      Text(
                        "Login with Seed",
                        style:
                            TextStyle(color: DARK_BLUE, fontSize: width / 45),
                      )
                    ],
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: TRANSPARENT,
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(10, 20),
                        color: Colors.black.withOpacity(0.1),
                        spreadRadius: 0,
                        blurRadius: 1,
                      ),
                    ],
                  ),
                  height: width / 4,
                  width: width / 4.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10000),
                          boxShadow: [
                            BoxShadow(
                              offset: Offset(5, 20),
                              color: Colors.black.withOpacity(0.3),
                              spreadRadius: 0,
                              blurRadius: 1,
                            ),
                          ],
                        ),
                        child: Image(
                          width: width / 9,
                          image: const AssetImage("assets/lock.png"),
                        ),
                      ),
                      Text(
                        "Enter password",
                        style:
                            TextStyle(color: DARK_BLUE, fontSize: width / 45),
                      )
                    ],
                  ),
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
