import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/constants.dart';
import 'package:my_pendrive_wallet_desktop/app/ui/Pages/AddWallet/AddWallet.dart';
import 'package:my_pendrive_wallet_desktop/app/ui/Pages/LoginWithPassword/LoginWithPassword.dart';
import 'package:my_pendrive_wallet_desktop/app/ui/Pages/LoginWithPassword/widgets/LoginWithPasswordCard.dart';
import 'package:my_pendrive_wallet_desktop/app/ui/Pages/LoginWithSeed/LoginWithSeed.dart';
import 'package:pie_chart/pie_chart.dart';

import 'app/ui/Pages/Home/Home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        routes: {
          // When navigating to the "/" route, build the FirstScreen widget.
          '/': (context) => const Directionality(
              textDirection: TextDirection.ltr, child: HomePage()),
          // When navigating to the "/second" route, build the SecondScreen widget.
          '/addWallet': (context) => const Directionality(
              textDirection: TextDirection.ltr, child: AddWalletPage()),
          '/loginWithSeed': (context) => const Directionality(
              textDirection: TextDirection.ltr, child: LoginWithSeedPage()),
          '/loginWithPassword': (context) => const Directionality(
              textDirection: TextDirection.ltr, child: LoginWithPasswordPage()),
        });
  }
}
