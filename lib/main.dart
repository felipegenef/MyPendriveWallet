import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:localized/localized.dart';
import 'package:my_pendrive_wallet_desktop/app/Custom/lib/src/easy_loading.dart';
import 'package:my_pendrive_wallet_desktop/app/Pages/AddWallet/AddWallet.dart';
import 'package:my_pendrive_wallet_desktop/app/Pages/ExportWallet/ExportWallet.dart';
import 'package:my_pendrive_wallet_desktop/app/Pages/Home/Home.dart';
import 'package:my_pendrive_wallet_desktop/app/Pages/LoginWithPassword/LoginWithPassword.dart';
import 'package:my_pendrive_wallet_desktop/app/Pages/LoginWithSeed/LoginWithSeed.dart';
import 'package:my_pendrive_wallet_desktop/app/Pages/Wallets/Wallets.dart';

// create files
//flutter pub run localized:main -c -l en,de,ru,pt,it
// generate translations from api key
//flutter pub run localized:main -t -l ru,en,de,pt -p Microsoft -m YOUR_MICROSOFT_KEY -r YOUR_REGION -n 100

void main() {
  runApp(const MyApp());
}

const locales = [
  Locale('de', 'DE'),
  Locale('en', 'EN'),
  Locale('ru', 'RU'),
  Locale('pt', 'PT'),
  Locale('pt', 'BR'),
];

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        supportedLocales: locales,
        locale: const Locale('pt', 'BR'),
        localizationsDelegates: [
          GlobalCupertinoLocalizations.delegate,
          GlobalMaterialLocalizations.delegate,
          LocalizationService.delegate(locales: locales),
        ],
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        initialRoute: "/",
        builder: EasyLoading.init(),
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
          '/wallets': (context) => const Directionality(
              textDirection: TextDirection.ltr, child: WalletsPage()),
          '/exportWallet': (context) => const Directionality(
              textDirection: TextDirection.ltr, child: ExportWalletPage()),
        });
  }
}
