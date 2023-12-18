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
}
