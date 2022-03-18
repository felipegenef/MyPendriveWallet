import 'package:encrypted_shared_preferences/encrypted_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/Custom/lib/src/easy_loading.dart';
import 'package:my_pendrive_wallet_desktop/app/Pages/LoginWithPassword/widgets/LoginCard.dart';
import 'package:my_pendrive_wallet_desktop/app/Pages/LoginWithPassword/widgets/LoginWithPasswordCard.dart';
import 'package:my_pendrive_wallet_desktop/app/Pages/LoginWithPassword/widgets/NoWalletCard.dart';
import 'package:my_pendrive_wallet_desktop/app/constants.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/Menu.dart';
import 'package:my_pendrive_wallet_desktop/app/global/widgets/whatermarkLogo.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginWithPasswordPage extends StatefulWidget {
  const LoginWithPasswordPage({Key key}) : super(key: key);

  @override
  State<LoginWithPasswordPage> createState() => _LoginWithPasswordPageState();
}

class _LoginWithPasswordPageState extends State<LoginWithPasswordPage> {
  var wallets = [];
  String currentWalletName = "";
  bool isBeenDraged = false;
  bool trashHoved = false;

  @override
  void initState() {
    super.initState();
    getWallets();
  }

  void getWallets() async {
    checkCurrentWalletExistence();
    var prefs = await SharedPreferences.getInstance();
    var walletNames = prefs.getStringList("walletNames");
    if (walletNames != null) {
      setState(() {
        wallets = walletNames;
      });
    }
  }

  deleteWallet(DragTargetDetails<String> details) async {
    var prefs = await SharedPreferences.getInstance();
    var walletNames = prefs.getStringList("walletNames");
    walletNames.remove(details.data);
    prefs.setStringList("walletNames", walletNames);
    prefs.remove("Password " + details.data);
    prefs.remove("Seed " + details.data);
    getWallets();
    await EasyLoading.showSuccess('Carteira excluida com sucesso!');
  }

  void checkCurrentWalletExistence() async {
    var prefs = await SharedPreferences.getInstance();
    var currentWallet = prefs.getString("currentWallet");
    prefs.remove("currentWallet");
    if (currentWallet == null) {
    } else {
      setState(() {
        currentWalletName = currentWallet;
      });
    }
  }

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
          AnimatedContainer(
            duration: const Duration(milliseconds: 500),
            width: width,
            height: height,
            alignment: Alignment.center,
            constraints: BoxConstraints(maxWidth: width, maxHeight: height),
            padding: EdgeInsets.only(top: appBarHeight),
            child: SingleChildScrollView(
              controller: ScrollController(
                  initialScrollOffset: 0, keepScrollOffset: false),
              child: Wrap(
                alignment:
                    width < 825 ? WrapAlignment.center : WrapAlignment.start,
                direction: width < 450 ? Axis.vertical : Axis.horizontal,
                children: [
                  if (currentWalletName == "")
                    for (var wallet in wallets)
                      Draggable<String>(
                        data: wallet,
                        onDragStarted: () {
                          setState(() {
                            isBeenDraged = true;
                          });
                        },
                        onDragEnd: (details) {
                          setState(() {
                            isBeenDraged = false;
                          });
                        },
                        feedback: Opacity(
                            opacity: 0.8,
                            child: Material(
                              color: Colors.transparent,
                              child: LoginWithPasswordCard(
                                onClick: () {},
                                label: wallet,
                              ),
                            )),
                        child: LoginWithPasswordCard(
                          onClick: () {
                            setState(() {
                              currentWalletName = wallet;
                            });
                          },
                          label: wallet,
                        ),
                      ),
                  if (wallets.isEmpty && currentWalletName == "")
                    const NoWalletCard(
                      imageURL: "assets/user.png",
                    ),
                  if (currentWalletName != "")
                    LoginCard(
                      back: () {
                        setState(() {
                          currentWalletName = "";
                        });
                      },
                      imageURL: "assets/user.png",
                      walletName: currentWalletName,
                    )
                ],
              ),
            ),
          ),
          if (isBeenDraged)
            Positioned(
              bottom: 30,
              left: width / 2,
              child: DragTarget<String>(
                  onAcceptWithDetails: deleteWallet,
                  builder: (BuildContext context, List<String> list,
                          List<dynamic> dynamicist) =>
                      const Image(
                          image: AssetImage("assets/trash.png"), height: 70)),
            ),
          const WatermarkLogo()
        ],
      ),
    );
  }
}
