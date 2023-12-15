import 'package:prova_senai/services/databaseLinguas.dart';

class AuthService {
  final DatabaseLinguas _databaseLinguas = DatabaseLinguas();

  Future<bool> login(String email, String password) async {
    // Aqui devemos implementar a lógica de autenticação.
    // Pode ser uma chamada a uma API, validação local, etc.

    // Por exemplo, vamos verificar no banco de dados local.
    List<Map<String, dynamic>> users = await _databaseLinguas.getUsers();

    for (var user in users) {
      if (user['email'] == email && user['password'] == password) {
        return true;
      }
    }

    return false;
  }
}
