import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class TesteJson extends StatefulWidget {
  const TesteJson({super.key});

  @override
  State<TesteJson> createState() => _TesteJsonState();
}

class _TesteJsonState extends State<TesteJson> {
  List _questions = [];

  Future<void> readJson() async {
    final String response = await rootBundle.loadString('assets/question.json');
    final data = await json.decode(response);
    setState(() {
      _questions = data["questions"];
      print("..numero de questões ${_questions.length}");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text(
            'Teste de Json nessa porra',
          ),
        ),
        body: Column(
          children: [
            _questions.isNotEmpty
                ? Expanded(
                    child: ListView.builder(
                    itemCount: _questions.length,
                    itemBuilder: (context, index) {
                      return Card(
                        key: ValueKey(_questions[index]["id"]),
                        margin: const EdgeInsets.all(10),
                        color: Colors.amber.shade100,
                        child: ListTile(
                          leading: Text(_questions[index]["id"]),
                          title: Text(_questions[index]["level"]),
                          subtitle: Text(_questions[index]["question"]),
                        ),
                      );
                    }),
                  )
                : ElevatedButton(
                    onPressed: () {
                      readJson();
                    },
                    child: Center(child: Text("Carregando as questões..."))),
          ],
        ));
  }
}
