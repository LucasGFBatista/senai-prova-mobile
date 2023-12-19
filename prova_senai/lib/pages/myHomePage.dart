import 'package:flutter/material.dart';
import 'package:prova_senai/pages/onboard.page.dart';
import 'package:prova_senai/pages/profile.page.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _selectedIndex = 0;

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    WelcomePage(),
    //ProfilePage(), // Adicione a página de perfil aqui
    // Adicione outras páginas conforme necessário
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        title: Text(widget.title),
        backgroundColor: Colors.blue[50],
      ),
      body: Center(
        child: _widgetOptions[_selectedIndex],
      ),
      drawer: Drawer(
        backgroundColor: Colors.blue[50],
        child: Column(
          children: [
            UserAccountsDrawerHeader(
              accountName: Text('Nome do Usuário'),
              accountEmail: Text('email@example.com'),
              currentAccountPicture: CircleAvatar(
                backgroundColor: Colors.white,
                child: Icon(
                  Icons.person,
                  color: Colors.blue,
                ),
              ),
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
            ),
            ListTile(
              title: const Text('Home'),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Perfil'),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Progresso'),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Alterar Nível de Dificuldade'),
              onTap: () {
                _onItemTapped(3);
                Navigator.pop(context);
              },
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ListTile(
                    title: const Text('Logout'),
                    leading: Icon(
                      Icons.logout_rounded,
                      color: Colors.black26,
                    ),
                    onTap: () {
                      // Adicione a lógica para desfazer o login aqui
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
