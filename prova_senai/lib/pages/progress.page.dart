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
