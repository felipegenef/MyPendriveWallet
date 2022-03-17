import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/Custom/menu.dart';
import 'package:my_pendrive_wallet_desktop/app/constants.dart';

import 'menuIcon.dart';

class MenuBubble extends StatefulWidget {
  const MenuBubble({Key key}) : super(key: key);

  @override
  State<MenuBubble> createState() => _MenuBubbleState();
}

class _MenuBubbleState extends State<MenuBubble>
    with SingleTickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _animationController;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var route = ModalRoute.of(context).settings.name;
    return Container(
      margin: const EdgeInsets.only(bottom: 30),
      child: FloatingActionBubble(
        // Menu items
        items: <Bubble>[
          if (route == "")
            Bubble(
              title: "Export",
              bubbleColor: DARK_BLUE,
              icon: const MenuItem(assetImageURL: "assets/export.png"),
              titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                _animationController.reverse();
              },
            ),
          // Floating action menu item
          Bubble(
            title: "Help",
            bubbleColor: DARK_BLUE,
            icon: const MenuItem(assetImageURL: "assets/help.png"),
            titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
            onPress: () {
              _animationController.reverse();
            },
          ),
          if (route == "/wallets")
            Bubble(
              title: "Export",
              bubbleColor: DARK_BLUE,
              icon: const MenuItem(assetImageURL: "assets/export.png"),
              titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                _animationController.reverse();
              },
            ),
          if (route == "")
            Bubble(
              title: "Back",
              bubbleColor: DARK_BLUE,
              icon: const MenuItem(assetImageURL: "assets/arrow_back.png"),
              titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                _animationController.reverse();
              },
            ),
          if (route == "/addWallet" ||
              route == "/loginWithSeed" ||
              route == "/loginWithPassword")
            Bubble(
              title: "Home",
              bubbleColor: DARK_BLUE,
              icon: const MenuItem(assetImageURL: "assets/home.png"),
              titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                _animationController.reverse();
                Navigator.pop(context);
              },
            ),
          if (route == "/myWallets")
            Bubble(
              title: "Logout",
              bubbleColor: DARK_BLUE,
              icon: const MenuItem(assetImageURL: "assets/logout.png"),
              titleStyle: const TextStyle(fontSize: 16, color: Colors.white),
              onPress: () {
                _animationController.reverse();
                Navigator.pop(context);
              },
            ),
        ],

        // animation controller
        animation: _animation,

        // On pressed change animation state
        onPress: () => _animationController.isCompleted
            ? _animationController.reverse()
            : _animationController.forward(),

        // Floating Action button Icon color
        iconColor: Colors.blue,

        // Flaoting Action button Icon
        iconData: const Image(
          image: AssetImage("assets/menu.png"),
        ),
        backGroundColor: Colors.white,
      ),
    );
  }
}
