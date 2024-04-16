import 'package:flutter/material.dart';
import 'package:my_ong/pages/contact.dart';

import 'package:my_ong/pages/home.dart';
import 'package:my_ong/pages/login_page.dart'; 
import 'package:my_ong/pages/ong.dart';
import 'package:my_ong/utils/app_routes.dart';
import 'package:my_ong/route_transition.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (ctx) => const HomePage(),
        AppRoutes.ong: (ctx) => const OngPage(),
        AppRoutes.contact: (ctx) => const ContactPage(),
        AppRoutes.login: (ctx) => LoginPage(), 
      },
    );
  }
}
