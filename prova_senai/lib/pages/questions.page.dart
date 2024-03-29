import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:prova_senai/models/question.model.dart';
import 'package:prova_senai/models/progress.model.dart';
import 'package:prova_senai/pages/progress.page.dart';

class QuestionScreen extends StatefulWidget {
  final String level;

  const QuestionScreen({Key? key, required this.level}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late List<Question> _questions = [];
  Map<int, int?> selectedOptions = {};
  int correctAnswersCount = 0;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    final String response = await rootBundle.loadString('assets/question.json');
    print(response);
    final Map<String, dynamic> data = jsonDecode(response);

    if (data.containsKey('questions')) {
      final List<dynamic> questionsData = data['questions'];

      final List<Question> loadedQuestions = questionsData
          .where((item) => item['level'] == widget.level)
          .map((item) {
        String? correctAnswer = item['correctAnswer'];
        if (correctAnswer == null) {
          correctAnswer = '0';
        }

        return Question(
          questionText: item['questionText'],
          options: List<String>.from(item['options']),
          correctAnswer: correctAnswer,
        );
      }).toList();

      setState(() {
        _questions = loadedQuestions;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        title: Text("Perguntas - ${widget.level}"),
      ),
      body: Center(
        child: _questions.isNotEmpty
            ? Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                      itemCount: _questions.length,
                      itemBuilder: (context, index) {
                        final question = _questions[index];
                        return Card(
                          child: ListTile(
                            title: Text(question.questionText),
                            subtitle: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: question.options
                                  .asMap()
                                  .entries
                                  .map((entry) => RadioListTile<int>(
                                        title: Text(entry.value),
                                        value: entry.key,
                                        groupValue: selectedOptions[index],
                                        onChanged: (value) {
                                          setState(() {
                                            selectedOptions[index] = value;

                                            //print(selectedOptions[index]);
                                          });
                                        },
                                      ))
                                  .toList(),
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      checkAnswers();
                    },
                    child: Text('Verificar Respostas'),
                  ),
                ],
              )
            : CircularProgressIndicator(),
      ),
    );
  }

//Verificar quantidade de respostas certas
  void checkAnswers() {
    int count = 0;
    for (int i = 0; i < _questions.length; i++) {
      final question = _questions[i];
      final selectedOptionIndex = selectedOptions[i];

      // Verifica se a opção foi selecionada e se o texto da opção é igual ao texto da opção correta
      if (selectedOptionIndex != null &&
          question.options[selectedOptionIndex] == question.correctAnswer) {
        count++;
      }
    }

    setState(() {
      correctAnswersCount = count;
    });

    // Essas coisas são só para teste em momento de desenvolvimeno, talvez suba junto com o commit
    print('Total de questões ${_questions.length}');
    print('Respostas corretas: $correctAnswersCount');

    // A apartir daqui começa a calcular os dados para tela de progresso
    double percentage = (correctAnswersCount / _questions.length) * 100;

    print('Porcetangem: $percentage%');

    //Instaanciando progress.model.dart
    Progress progress = Progress(
      percentage: percentage,
      correctAnswers: correctAnswersCount,
      totalQuestions: _questions.length,
    );

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProgressPage(
          userName: '',
          userEmail: '',
          progress: progress,
        ),
      ),
    );
  }
}
