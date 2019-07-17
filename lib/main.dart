import 'package:flutter/material.dart';
import 'package:methodist_hymn/Pages/HomeScreen.dart';
import 'package:methodist_hymn/Pages/HymnSelection.dart';
import 'package:methodist_hymn/Pages/HymnTypes.dart';

import 'Pages/HymnInput.dart';
import 'Pages/Languages.dart';




void main() => runApp(new MyApp()); // running the main class MyApp

class MyApp extends StatelessWidget { // class MyApp contains the home page
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new HymnSelection(),
    );
  }
}


class Home extends StatelessWidget { // class MyApp contains the home page
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: new HomeScreen(),
    );
  }
}


