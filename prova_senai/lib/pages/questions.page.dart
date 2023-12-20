import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:dio/dio.dart';

class Question {
  final String questionText;
  final List<String> options;
  final int correctOptionIndex;

  Question({
    required this.questionText,
    required this.options,
    required this.correctOptionIndex,
  });
}

class QuestionScreen extends StatefulWidget {
  final String level;

  const QuestionScreen({Key? key, required this.level}) : super(key: key);

  @override
  _QuestionScreenState createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {
  late List<Question> questions;
  int? selectedOption;

  @override
  void initState() {
    super.initState();
    loadQuestions();
  }

  Future<void> loadQuestions() async {
    try {
      final response = await Dio().get('../../assets/question.json');

      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.data.toString());
        final List<Question> loadedQuestions = data.map((item) {
          return Question(
            questionText: item['questionText'],
            options: List<String>.from(item['options']),
            correctOptionIndex: item['correctOptionIndex'],
          );
        }).toList();

        setState(() {
          questions = loadedQuestions;
        });
      } else {
        print('Erro ao carregar perguntas. Código de status: ${response.statusCode}');
      }
    } catch (e) {
      print('Erro ao carregar perguntas: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Perguntas - ${widget.level}"),
      ),
      body: Center(
        child: questions == null
            ? CircularProgressIndicator()
            : ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  return Card(
                    child: ListTile(
                      title: Text(question.questionText),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: question.options
                            .asMap()
                            .entries
                            .map((entry) => RadioListTile<String>(
                                  title: Text(entry.value),
                                  value: entry.key.toString(),
                                  groupValue: selectedOption?.toString(),
                                  onChanged: (value) {
                                    setState(() {
                                      selectedOption = int.parse(value!);
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
    );
  }
}
