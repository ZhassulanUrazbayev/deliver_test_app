import 'package:deliver_test_app/screens/animation.dart';
import 'package:deliver_test_app/screens/menu_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
//    SystemChrome.setSystemUIOverlayStyle(
//        SystemUiOverlayStyle(statusBarColor: Colors.white));
    return MaterialApp(
//      theme: ThemeData(
//        primarySwatch: Colors.black,
//      ),
      home: HomePage(),
    );
  }
}
