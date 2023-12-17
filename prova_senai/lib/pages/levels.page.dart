// Criando a tela para perguntar os levels do usuarrio e depois disso passar para tela de perguntas
import 'package:flutter/material.dart';

class LevelChoise extends StatefulWidget {
  const LevelChoise({super.key});

  @override
  State<LevelChoise> createState() => _LevelChoiseState();
}

class _LevelChoiseState extends State<LevelChoise> {
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
                  /*
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ,
                    ),
                  );
                */
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
                  /*
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ,
                    ),
                  );
                */
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
                  /*
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ,
                    ),
                  );
                */
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
}
