import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:my_ong/utils/app_routes.dart'; // Importe o arquivo de rotas

class LoginPage extends StatelessWidget {
  LoginPage({Key? key}) : super(key: key);

  // Instância do FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _signInWithEmailAndPassword(BuildContext context, String email, String password) async {
    try {
      // Autenticar com e-mail e senha
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      // Navegar para a tela de chat após o login bem-sucedido
      Navigator.pushReplacementNamed(context, AppRoutes.chat); // Aqui é onde a navegação ocorre
      // Exibir um diálogo ou uma snackbar indicando que o login foi bem-sucedido
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Login bem-sucedido!'),
        ),
      );
    } catch (e) {
      // Lidar com erros de autenticação
      print('Erro ao fazer login: $e');
      // Exibir um diálogo ou uma snackbar indicando que ocorreu um erro ao fazer login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Erro ao fazer login: $e'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    String _email = '';
    String _password = '';

    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/R.jpeg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(Colors.black.withOpacity(0.4), BlendMode.dstATop),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                const SizedBox(height: 24),
                Align(
                  alignment: Alignment.topLeft,
                  child: IconButton(
                    icon: Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
                Text(
                  'Preencha seus dados para entrar',
                  style: TextStyle(fontSize: 24, color: Color(0xFF34344E)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),
                TextField(
                  onChanged: (value) => _email = value,
                  decoration: InputDecoration(
                    labelText: 'Email',
                  ),
                ),
                const SizedBox(height: 26),
                TextField(
                  onChanged: (value) => _password = value,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                  ),
                  obscureText: true,
                ),
                const SizedBox(height: 45),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () => _signInWithEmailAndPassword(context, _email, _password),
                  child: Text('Entrar', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                const SizedBox(height: 16),
                TextButton(
                  onPressed: () {
                    // lógica para redefinir a senha do usuário aqui
                  },
                  child: Text('Esqueci a senha', style: TextStyle(fontSize: 18, color: Colors.green[900])),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
