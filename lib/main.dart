import 'package:flutter/material.dart';

import 'modules/stocks/ScreenDisplayAllStocks.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Angel Stocks',
      theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          backgroundColor: Colors.white,
          scaffoldBackgroundColor: Colors.white),
      home: ScreenDisplayAllStocks(),
    );
  }
}
