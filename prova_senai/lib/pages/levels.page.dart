import 'package:flutter/material.dart';
import 'package:prova_senai/pages/questions.page.dart';  

class LevelChoice extends StatefulWidget {
  const LevelChoice({Key? key}) : super(key: key);

  @override
  State<LevelChoice> createState() => _LevelChoiceState();
}

class _LevelChoiceState extends State<LevelChoice> {
  String selectedLevel = "";  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                "Qual o seu nível atual em Inglês?",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.blue,
                ),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 50),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  selectLevel("iniciante");  
                },
                child: Text(
                  "Iniciante",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  selectLevel("intermediario");  
                },
                child: Text(
                  "Intermediário",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
              SizedBox(height: 15),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: EdgeInsets.symmetric(vertical: 15),
                ),
                onPressed: () {
                  selectLevel("avancado");  
                },
                child: Text(
                  "Avançado",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void selectLevel(String level) {
    setState(() {
      selectedLevel = level;  // Atualiza o nível selecionado
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => Questions(level: selectedLevel),  // Passa o nível selecionado para a tela Questions
      ),
    );
  }
}
