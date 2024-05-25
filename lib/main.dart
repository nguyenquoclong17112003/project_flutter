import 'package:flutter/material.dart';
import 'home_page.dart';
import 'home.dart';
import 'light_control_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Em Hieu toi choi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: ControlLightPage(),
    );
  }
}
