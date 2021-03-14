import 'package:flutter/material.dart';
import 'package:lumi/pages/home/home_page.dart';
import 'utils/utils.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Lumi',
      home: HomePage(),
      routes: {
        HOME_ROUTE: (_) => HomePage(),
      },
    );
  }
}
