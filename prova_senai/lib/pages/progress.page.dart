/*
import 'package:flutter/material.dart';
import 'package:prova_senai/pages/customDrawer.dart';

class ProgressPage extends StatelessWidget {
  final String userName;
  final String userEmail;

  const ProgressPage(
      {Key? key, required this.userName, required this.userEmail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text("Progresso"),
        backgroundColor: Colors.blue[50],
      ),
      drawer: CustomDrawer(
        userName: userName,
        userEmail: userEmail,
        selectedIndex: 2,
        onItemTapped: (index) {
          print("Item $index selecionado");
        },
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Progresso",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
*/

// progress.page.dart

import 'package:flutter/material.dart';
import 'package:prova_senai/models/progress.model.dart';
import 'package:prova_senai/pages/customDrawer.dart';


class ProgressPage extends StatelessWidget {
  final String userName;
  final String userEmail;
  final Progress? progress;

  const ProgressPage({
    Key? key,
    required this.userName,
    required this.userEmail,
    this.progress,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text("Progresso"),
        backgroundColor: Colors.blue[50],
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Progresso",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Sua pontuação é: ${progress?.percentage.toStringAsFixed(2) ?? "N/A"}%',
                style: TextStyle(fontSize: 18.0),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 20),
              Text(
                'Você acertou ${progress?.correctAnswers ?? 0} de ${progress?.totalQuestions ?? 0} perguntas!',
                style: TextStyle(fontSize: 20.0, fontWeight: FontWeight.bold),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
      drawer: CustomDrawer(
        userName: userName,
        userEmail: userEmail,
        selectedIndex: 0,
        onItemTapped: (index) {
          // Adicione a lógica para lidar com a seleção do item
          print("Item $index selecionado");
        },
      ),
    );
  }
}
