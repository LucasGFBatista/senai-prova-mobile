import 'package:flutter/material.dart';
import 'package:prova_senai/services/databaseLinguas.dart';
import 'package:prova_senai/services/auth_service.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {

  //Controllers
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController ConfirmPasswordController = TextEditingController();

  //Autenticação
  AuthService authService = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[50],
      appBar: AppBar(
        backgroundColor: Colors.blue[50],
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(20),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text(
                  "Criar Conta",
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                  textAlign: TextAlign.center,
                ),
                SizedBox(height: 30),
                TextFormField(
                  controller: nameController,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
                    labelText: "E-mail",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
                    labelText: "Senha",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),
                TextFormField(
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: TextStyle(color: Colors.black, fontSize: 18),
                  decoration: InputDecoration(
                    labelText: "Confirmar Senha",
                    labelStyle: TextStyle(color: Colors.black),
                    border: OutlineInputBorder(),
                  ),
                ),
                SizedBox(height: 20),

                //Botão de criar conta
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue,
                    padding: EdgeInsets.symmetric(vertical: 15),
                  ),
                  onPressed: () async {
                    String name = nameController.text;
                    String email = emailController.text;
                    String password= passwordController.text;
                    String confitmPassword = ConfirmPasswordController.text;

                    // Verifica se o e-mail já está cadastrado
                    bool emailExists = await authService.verifyNewAccount(email);

                    if (emailExists) {
                      // Exibe mensagem de erro
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text("Erro de Cadastro"),
                            content: Text(
                                "E-mail já cadastrado. Por favor, escolha outro."),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.of(context).pop();
                                },
                                child: Text("OK"),
                              ),
                            ],
                          );
                        },
                      );
                    } else {
                      
                      //Salvar no banco de dados
                      DatabaseLinguas.saveUser(name, email, password);
                      print("Conta criada");
                    }
                  },
                  child: Text(
                    "Criar Conta",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
