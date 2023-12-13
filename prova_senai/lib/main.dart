import 'package:flutter/material.dart';
import 'package:prova_senai/pages/onboard.page.dart';

void main() {
  runApp(MyApp());
}

@override
class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HiperLínguas',
      theme: ThemeData(primarySwatch: Colors.teal),
      home: WelcomePage(),
    );
  }
}
