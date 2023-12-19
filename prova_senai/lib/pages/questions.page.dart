import 'package:flutter/material.dart';

class Questions extends StatelessWidget {
  final String level;

  const Questions({Key? key, required this.level}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: Text("Perguntas - $level"),
      ),
      body: Center(
        child: Text("Lógica de perguntas aqui para o nível: $level"),
      ),
    );
  }
}