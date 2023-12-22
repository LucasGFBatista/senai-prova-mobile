import 'package:flutter/material.dart';
import 'package:prova_senai/pages/levels.page.dart';
import 'package:prova_senai/pages/login.page.dart';
import 'package:prova_senai/services/databaseLinguas.dart';
import 'package:prova_senai/pages/onboard.page.dart';
import 'package:prova_senai/pages/singup.page.dart';
import 'package:prova_senai/pages/customDrawer.dart';

void main() {
  runApp(MyApp());
}

@override
class MyApp extends StatelessWidget {
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'HiperLínguas',
      theme: ThemeData(primarySwatch: Colors.teal),

      //Tem que iniciar com essa tela, mas para teste tô colocando como login
      home: WelcomePage(),

      /*home: LevelChoice(
        userName: "Lucas",
        userEmail: "lucas@email",
      ),

      */
    );
  }
}
