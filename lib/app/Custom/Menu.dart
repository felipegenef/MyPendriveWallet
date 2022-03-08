import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/Custom/Menu/code.dart';
import 'package:my_pendrive_wallet_desktop/app/constants.dart';

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
      duration: Duration(milliseconds: 260),
    );

    final curvedAnimation =
        CurvedAnimation(curve: Curves.easeInOut, parent: _animationController);
    _animation = Tween<double>(begin: 0, end: 1).animate(curvedAnimation);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return FloatingActionBubble(
      // Menu items
      items: <Bubble>[
        // Floating action menu item
        Bubble(
          title: "Export",
          bubbleColor: DARK_BLUE,
          icon: Container(
            margin: const EdgeInsets.only(right: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10000),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 15),
                  color: Colors.black.withOpacity(0.6),
                  spreadRadius: 0,
                  blurRadius: 15,
                ),
              ],
            ),
            child: Image(
              height: 40,
              image: AssetImage("assets/export.png"),
            ),
          ),
          titleStyle: TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            _animationController.reverse();
          },
        ),
        // Floating action menu item
        Bubble(
          title: "Help",
          bubbleColor: DARK_BLUE,
          icon: Container(
            margin: const EdgeInsets.only(right: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10000),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 15),
                  color: Colors.black.withOpacity(0.6),
                  spreadRadius: 0,
                  blurRadius: 15,
                ),
              ],
            ),
            child: Image(
              height: 40,
              image: AssetImage("assets/help.png"),
            ),
          ),
          titleStyle: TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            _animationController.reverse();
          },
        ),
        //Floating action menu item
        Bubble(
          title: "Back",
          bubbleColor: DARK_BLUE,
          icon: Container(
            margin: const EdgeInsets.only(right: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10000),
              boxShadow: [
                BoxShadow(
                  offset: Offset(0, 15),
                  color: Colors.black.withOpacity(0.6),
                  spreadRadius: 0,
                  blurRadius: 15,
                ),
              ],
            ),
            child: Image(
              height: 40,
              image: AssetImage("assets/arrow_back.png"),
            ),
          ),
          titleStyle: TextStyle(fontSize: 16, color: Colors.white),
          onPress: () {
            _animationController.reverse();
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
      iconData: Image(
        image: AssetImage("assets/menu.png"),
      ),
      backGroundColor: Colors.white,
    );
  }
}
