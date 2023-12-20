import 'package:flutter/material.dart';
import 'package:prova_senai/pages/onboard.page.dart';
import 'package:prova_senai/pages/profile.page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.userName, required this.userEmail}) : super(key: key);

  final String userName;
  final String userEmail;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late String _userName;
  late String _userEmail;
  int _selectedIndex = 0;

  static const List<String> _pageTitles = ['Home', 'Perfil', 'Progresso', 'Alterar Nível de Dificuldade'];

  static const TextStyle optionStyle =
      TextStyle(fontSize: 30, fontWeight: FontWeight.bold);

  static const List<Widget> _widgetOptions = <Widget>[
    WelcomePage(),
    //Profile(), 
  ];

  @override
  void initState() {
    super.initState();
    _userName = widget.userName;
    _userEmail = widget.userEmail;
  }

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
        title: Text(_pageTitles[_selectedIndex]),
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
              accountName: Text(_userName),
              accountEmail: Text(_userEmail), 
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
              leading: Icon(Icons.home),
              onTap: () {
                _onItemTapped(0);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Perfil'),
              leading: Icon(Icons.person),
              onTap: () {
                _onItemTapped(1);
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Profile()), 
                );
              },
            ),
            ListTile(
              title: const Text('Progresso'),
              leading: Icon(Icons.timeline),
              onTap: () {
                _onItemTapped(2);
                Navigator.pop(context);
              },
            ),
            ListTile(
              title: const Text('Alterar Nível de Dificuldade'),
              leading: Icon(Icons.settings),
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
