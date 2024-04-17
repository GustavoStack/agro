import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:my_ong/app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: FirebaseOptions(
      apiKey: "AIzaSyAcL_7s9HIdZuhmw69pgrUlV2m0h1y0Img", 
      authDomain: "agro-9a37c.firebaseapp.com", 
      databaseURL: "https://agro-9a37c.firebaseio.com", 
      projectId: "agro-9a37c", 
      storageBucket: "agro-9a37c.appspot.com", 
      messagingSenderId: "723351812404", 
      appId: "1:723351812404:android:35c05c6eebb4725797cd61", 
    ),
  );
  runApp(const App());
}
