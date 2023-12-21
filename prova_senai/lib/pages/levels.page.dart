import 'package:flutter/material.dart';
import 'package:prova_senai/pages/questions.page.dart';
import 'package:prova_senai/pages/customDrawer.dart';

class LevelChoice extends StatefulWidget {
  const LevelChoice({Key? key, required this.userName, required this.userEmail})
      : super(key: key);

  final String userName;
  final String userEmail;

  @override
  State<LevelChoice> createState() => _LevelChoiceState();
}

class _LevelChoiceState extends State<LevelChoice> {
  late String _userName;
  late String _userEmail;
  String selectedLevel = "";

  @override
  void initState() {
    super.initState();
    _userName = widget.userName;
    _userEmail = widget.userEmail;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text("Escolha seu Nível"),
        backgroundColor: Colors.blue[50],
      ),
      drawer: CustomDrawer(
        userName: _userName,
        userEmail: _userEmail,
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
                  selectLevel("Iniciante");
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
                  selectLevel("Intermediario");
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
                  selectLevel("Avancado");
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
      selectedLevel = level; 
    });

    Navigator.push(
      context,
      MaterialPageRoute(
        
        builder: (context) => QuestionScreen(level: selectedLevel),
      ),
    );
  }
}
