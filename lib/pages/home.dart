import 'package:flutter/material.dart';
import 'package:my_ong/route_transition.dart'; 
import 'package:my_ong/pages/login_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
                
                Spacer(flex: 2),
                Image.asset('assets/images/logo_complete.png', height: 120),
                Text(
                  'Bem Vindo ao Agro!',
                  style: TextStyle(fontSize: 24, color: Color(0xFF34344E)),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green[600],
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                     Navigator.of(context).push(createRoute(LoginPage()));
                  },
                  child: Text('Login', style: TextStyle(fontSize: 18, color: Colors.white)),
                ),
                const SizedBox(height: 24),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(color: Colors.green[600]!),
                    minimumSize: Size(double.infinity, 50),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0),
                    ),
                  ),
                  onPressed: () {
                    
                  },
                  child: Text(
                    'Criar uma conta',
                    style: TextStyle(fontSize: 18, color: Colors.green[900]),
                  ),
                ),
                Spacer(flex: 1),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
