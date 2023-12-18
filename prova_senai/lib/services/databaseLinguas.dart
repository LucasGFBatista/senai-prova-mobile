// databaseLinguas.dart

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

class DatabaseLinguas {
  static _recuperarBancoDados() async {
    final caminhoBancoDados = await getDatabasesPath();
    final localBancoDados = join(caminhoBancoDados, "hiper_linguas");

    var bd = await openDatabase(
      localBancoDados,
      version: 1,
      onCreate: (db, dbVersaoAtual) {
        String sql =
            'CREATE TABLE users(id INTEGER PRIMARY KEY AUTOINCREMENT, name VARCHAR, email VARCHAR, password VARCHAR)';
        db.execute(sql);
      },
    );
    return bd;
  }

  // Salvar user
  static saveUser(String name, String email, String password) async {
    Database bd = await _recuperarBancoDados();
    Map<String, dynamic> dataUser = {
      "name": name,
      "email": email,
      "password": password,
    };

    int id = await bd.insert("users", dataUser);
    print("Usuário cadastrado com ID: $id");
  }

  // Listar users
  static listUsers() async {
    Database bd = await _recuperarBancoDados();
    String sql = "select * from users";
    List<Map<String, dynamic>> users = await bd.rawQuery(sql);

    for (var user in users) {
      print(
          "ID: ${user['id']}, name: ${user['name']}, E-mail: ${user['email']}");
    }
  }

  // Atualizar user
  static updateUser(
      int id, String newName, String newEmail, String newPassword) async {
    Database bd = await _recuperarBancoDados();
    Map<String, dynamic> dataUser = {
      "name": newName,
      "email": newEmail,
      "password": newPassword,
    };
    int retorno =
        await bd.update("users", dataUser, where: "id=?", whereArgs: [id]);
    print(retorno);
  }

  // Esse aqui é para pegar o user por nome
  static Future<Map<String, dynamic>?> getUserByName(String name) async {
    Database bd = await _recuperarBancoDados();

    List<Map<String, dynamic>> users = await bd.query(
      "users",
      where: "name = ?",
      whereArgs: [name],
    );

    if (users.isNotEmpty) {
      return users.first;
    } else {
      return null;
    }
  }

// Função pegar usuario por email, para usar no loggin
  static Future<Map<String, dynamic>?> getUserByEmail(String email) async {
    Database bd = await _recuperarBancoDados();

    List<Map<String, dynamic>> users = await bd.query(
      "users",
      where: "email = ?",
      whereArgs: [email],
    );

    if (users.isNotEmpty) {
      return users.first;
    } else {
      return null;
    }
  }
}
