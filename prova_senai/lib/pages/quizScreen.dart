import 'dart:convert';
import 'package:flutter/material.dart';

class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  List<Map<String, dynamic>> questions = [];
  int currentQuestionIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadQuestions();
  }

  Future<void> _loadQuestions() async {
    String data = await DefaultAssetBundle.of(context)
        .loadString('/../../assets/questions.json');
    setState(() {
      questions = json.decode(data);
    });
  }

  @override
  Widget build(BuildContext context) {
    if (questions.isEmpty) {
      return _buildLoadingScreen();
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Aprendendo Inglês'),
      ),
      drawer: _buildDrawer(), // Adiciona o menu lateral
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            _buildQuestionText(),
            SizedBox(height: 20),
            // Exibir opções de resposta como botões
            ..._buildAnswerButtons(),
            SizedBox(height: 20),
            _buildNextButton(),
          ],
        ),
      ),
    );
  }

  Widget _buildDrawer() {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: BoxDecoration(
              color: Colors.blue,
            ),
            child: Text(
              'Menu',
              style: TextStyle(
                color: Colors.white,
                fontSize: 24,
              ),
            ),
          ),
          ListTile(
            title: Text('Home'),
            onTap: () {
              Navigator.pop(context); // Fecha o menu lateral
              // Implemente a navegação para a tela inicial se necessário
            },
          ),
          ListTile(
            title: Text('Alterar Nível'),
            onTap: () {
              Navigator.pop(context); // Fecha o menu lateral
              // Implemente a navegação para a tela de alteração de nível se necessário
            },
          ),
          ListTile(
            title: Text('Atualizar Perfil'),
            onTap: () {
              Navigator.pop(context); // Fecha o menu lateral
              // Implemente a navegação para a tela de atualização de perfil se necessário
            },
          ),
        ],
      ),
    );
  }

  Widget _buildLoadingScreen() {
    return Scaffold(
      body: Center(
        child: CircularProgressIndicator(),
      ),
    );
  }

  Widget _buildQuestionText() {
    return Text(
      questions[currentQuestionIndex]['question'],
      style: TextStyle(fontSize: 18),
    );
  }

  List<Widget> _buildAnswerButtons() {
    return (questions[currentQuestionIndex]['options'] as List<String>)
        .map((option) {
      return ElevatedButton(
        onPressed: () {
          _showExplanationDialog(
              questions[currentQuestionIndex]['explanation']);
        },
        child: Text(option),
      );
    }).toList();
  }

  Widget _buildNextButton() {
    return ElevatedButton(
      onPressed: () {
        _handleNextButton();
      },
      child: Text('Avançar'),
    );
  }

  void _handleNextButton() {
    setState(() {
      if (currentQuestionIndex < questions.length - 1) {
        currentQuestionIndex++;
      } else {
        _showEndOfQuizDialog();
      }
    });
  }

  void _showExplanationDialog(String explanation) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Explicação'),
          content: Text(explanation),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }

  void _showEndOfQuizDialog() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Fim do Quiz'),
          content: Text('Parabéns! Você concluiu o quiz.'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Fechar'),
            ),
          ],
        );
      },
    );
  }
}
