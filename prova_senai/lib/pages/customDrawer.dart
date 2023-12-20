import 'package:flutter/material.dart';
import 'package:prova_senai/pages/home.page.dart';
import 'package:prova_senai/pages/logout.page.dart';
import 'package:prova_senai/pages/profile.page.dart';
import 'package:prova_senai/pages/levels.page.dart';
import 'package:prova_senai/pages/progress.page.dart';

class CustomDrawer extends StatelessWidget {
  final String userName;
  final String userEmail;
  final int selectedIndex;
  final Function(int) onItemTapped;

  const CustomDrawer({
    Key? key,
    required this.userName,
    required this.userEmail,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Colors.blue[50],
      child: Column(
        children: [
          UserAccountsDrawerHeader(
            accountName: Text(userName),
            accountEmail: Text(userEmail),
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
              onItemTapped(0);
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => HomePage()),
              );
            },
          ),
          ListTile(
            title: const Text('Perfil'),
            leading: Icon(Icons.person),
            onTap: () {
              onItemTapped(1);
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
              onItemTapped(2);
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        ProgressPage(userName: userName, userEmail: userEmail)),
              );
            },
          ),
          ListTile(
            title: const Text('Escolher Nível'),
            leading: Icon(Icons.star),
            onTap: () {
              onItemTapped(3);
              Navigator.pop(context);
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => LevelChoice(
                          userName: userName,
                          userEmail: userEmail,
                        )),
              );
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
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LogoutPage()),
                    );
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
