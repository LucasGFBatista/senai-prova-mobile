import 'package:flutter/material.dart';

class Teaching1 extends StatefulWidget {
  const Teaching1({super.key});

  @override
  State<Teaching1> createState() => _Teaching1State();
}

class _Teaching1State extends State<Teaching1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Cumprimentos em Inglês para Iniciantes",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 30),
                Text(
                  "Hello (Olá): Uma saudação amigável e geral. \nExemplo: Hello, how are you? (Olá, como você está?) \n\nHi (Oi): Uma forma casual e informal de dizer olá. \n  Exemplo: Hi! Nice to meet you (Oi, prazer em te conhecer). \n\nHow are you? (como você está?): Uma maneira de perguntar sobre o bem-estar de alguém.\n  Exemplo: How are you today?(Como você está hoje?).",
                  style: TextStyle(
                    fontSize: 16, //fontWeight: FontWeight.bold,
                    color: Color(0xff104570),
                  ),
                ),
                SizedBox(height: 40),

                //Botão de criar conta
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () {
                    // Adicione lógica para avançar para a próxima etapa
                    print("Click avançar");
                  },
                  child: Text(
                    "Avançar",
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
      ),
    );
  }
}
