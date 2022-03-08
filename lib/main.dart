import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/ui/global/widgets/Menu.dart';
import 'package:my_pendrive_wallet_desktop/app/constants.dart';
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
      home: Directionality(textDirection: TextDirection.ltr, child: HomePage()),
    );
  }
}
