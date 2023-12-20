import 'package:flutter/material.dart';
import 'package:prova_senai/pages/customDrawer.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text("Home"),
        backgroundColor: Colors.blue[50],
      ),
      body: Center(
        child: Text(
          "Home",
          style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
      drawer: CustomDrawer(
        userName: "Seu Nome",
        userEmail: "seuemail@example.com",
        selectedIndex: 0,
        onItemTapped: (index) {
          // Adicione a lógica para lidar com a seleção do item
          print("Item $index selecionado");
        },
      ),
    );
  }
}
