import 'package:prova_senai/services/databaseLinguas.dart';

class AuthService {
  Future<bool> login(String email, String password) async {
    Map<String, dynamic>? user = await DatabaseLinguas.getUserByEmail(email);

    if (user != null && user['password'] == password) {
      // Usuário autenticado com sucesso
      return true;
    } else {
      // Senha incorreta ou usuário não encontrado
      return false;
    }
  }

  // Metodo para verificação se email já está cadastrado
  Future<bool> verifyNewAccount(String email) async {
    Map<String, dynamic>? user = await DatabaseLinguas.getUserByEmail(email);

    if (user != null && user['email'] == email) {
      //email já cadastrado,
      return true;
    } else {
      //email não cadastrado, pode cadastrar nova conta
      return false;
    }
  }
}
