import 'package:flutter/material.dart';
import 'package:my_pendrive_wallet_desktop/app/Custom/Menu.dart';
import 'package:my_pendrive_wallet_desktop/app/constants.dart';
import 'package:pie_chart/pie_chart.dart';

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
      home:
          Directionality(textDirection: TextDirection.ltr, child: MyHomePage()),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key key}) : super(key: key);

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  bool isOpen = false;
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;
    return Scaffold(
      backgroundColor: BACKGROUND,
      floatingActionButtonLocation: FloatingActionButtonLocation.endDocked,
      floatingActionButton: MenuBubble(),
      body: Stack(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                color: TRANSPARENT,
                height: height,
                width: width / 2,
              ),
              // PieChart(
              //   dataMap: const {"bitcoin": 300, "ethereum": 170, "litecoin": 70},
              //   ringStrokeWidth: 10,
              //   chartValuesOptions: ChartValuesOptions(
              //     showChartValueBackground: false,
              //     // chartValueBackgroundColor: TRANSPARENT,
              //     // showChartValuesInPercentage: true,
              //     // showChartValuesOutside: true,
              //     showChartValues: false,
              //     decimalPlaces: 0,
              //     chartValueStyle: TextStyle(
              //         color: Colors.black,
              //         fontWeight: FontWeight.bold,
              //         fontSize: width / 60),
              //   ),
              //   chartType: ChartType.ring,

              //   // colorList: const [Colors.red, Colors.blue, Colors.amber],
              //   gradientList: const [
              //     BITCOIN_GRADIENT_COLOR,
              //     ETHEREUM_GRADIENT_COLOR,
              //     LITECOIN_GRADIENT_COLOR
              //   ],
              //   centerText: "\$999.999.999🇧🇷",
              //   centerTextStyle:
              //       TextStyle(color: Colors.white, fontSize: width / 25),
              //   legendOptions: const LegendOptions(
              //     showLegends: false,
              //   ),
              //   animationDuration: const Duration(milliseconds: 1200),
              //   chartRadius: width / 2.7,
              // ),
            ],
          ),
          Row(
            children: [
              Container(
                color: BACKGROUND,
                constraints: BoxConstraints(
                    minHeight: 100, minWidth: width, maxHeight: 400),
                padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                alignment: Alignment.centerLeft,
                width: width - 40,
                height: (height / 10),
                child: ConstrainedBox(
                  constraints: BoxConstraints(
                    minHeight: 100,
                  ),
                  child: Image(
                    // height: height / 10,
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
