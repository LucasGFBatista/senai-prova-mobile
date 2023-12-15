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

  static salvarUsuario(String name, String email, String password) async {
    Database bd = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario = {
      "name": name,
      "email": email,
      "password": password,
    };

    int id = await bd.insert("users", dadosUsuario);
    print("Usuário cadastrado com ID: $id");
  }

  static listarusers() async {
    Database bd = await _recuperarBancoDados();
    String sql = "select * from users";
    List<Map<String, dynamic>> users = await bd.rawQuery(sql);

    for (var usuario in users) {
      print("ID: ${usuario['id']}, name: ${usuario['name']}, E-mail: ${usuario['email']}");
    }
  }

  static atualizarUsuario(int id, String newName, String newEmail, String newPassword) async {
    Database bd = await _recuperarBancoDados();
    Map<String, dynamic> dadosUsuario = {
      "name": newName,
      "email": newEmail,
      "password": newPassword,
    };
    int retorno = await bd.update("users", dadosUsuario,
        where: "id=?", whereArgs: [id]);
    print(retorno);
  }
}
