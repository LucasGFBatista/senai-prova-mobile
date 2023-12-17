import 'package:flutter/material.dart';
//import 'package:prova_senai/pages/login.page.dart';
import 'package:prova_senai/services/databaseLinguas.dart';
//import 'package:prova_senai/pages/onboard.page.dart';
//import 'package:prova_senai/pages/singup.page.dart';
import 'package:prova_senai/pages/Teaching1.dart';

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
      //home: WelcomePage (),

      //Testar a página de login
      //home: LoginPage(),

      //Testar o banco de dados
      //home: SignupPage(),
    );
  }
}
