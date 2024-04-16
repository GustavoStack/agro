import 'package:flutter/material.dart';
import 'package:my_ong/widgets/app_logo.dart';

class OngPage extends StatelessWidget {
  const OngPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppLogo('ONG XYZ'),
      ),
      body: const Center(
        child: Text('ONG'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: Icon(Icons.back_hand),
      ),
    );
  }
}
