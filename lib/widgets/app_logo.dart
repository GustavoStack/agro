import 'package:flutter/material.dart';

class AppLogo extends StatelessWidget {
  final String label;

  const AppLogo(this.label, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      label.toUpperCase(),
      style: const TextStyle(
        fontSize: 32.0,
        fontWeight: FontWeight.bold,
        color: Colors.blueGrey,
      ),
    );
  }
}
