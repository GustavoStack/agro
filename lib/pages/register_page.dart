import 'package:flutter/material.dart';

import 'package:my_ong/utils/app_routes.dart'; 
import 'package:firebase_auth/firebase_auth.dart';

class RegisterPage extends StatelessWidget {
  RegisterPage({Key? key}) : super(key: key);

  // Instância do FirebaseAuth
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> _registerWithEmailAndPassword(BuildContext context, String email, String password) async {
  try {
    // Registrar com e-mail e senha
    await _auth.createUserWithEmailAndPassword(email: email, password: password);
    // Navegar para a tela de login após o registro bem-sucedido
    Navigator.pushReplacementNamed(context, AppRoutes.login); 
    // Navegar para a tela de login
    // Exibir um diálogo ou uma snackbar indicando que o registro foi bem-sucedido
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Registro bem-sucedido!'),
      ),
    );
  } catch (e) {
    // Lidar com erros de registro
    print('Erro ao registrar: $e');
    // Exibir um diálogo ou uma snackbar indicando que ocorreu um erro ao registrar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Erro ao registrar: $e'),
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
            colorFilter: ColorFilter.mode(
                Colors.black.withOpacity(0.4), BlendMode.dstATop),
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    IconButton(
                      icon: Icon(Icons.arrow_back), // Ícone de seta para voltar
                      onPressed: () {
                        Navigator.pop(context); // Voltar para a tela anterior
                      },
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                Text(
                  'Crie sua conta',
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
                  onPressed: () =>
                      _registerWithEmailAndPassword(context, _email, _password),
                  child: Text('Registrar',
                      style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
