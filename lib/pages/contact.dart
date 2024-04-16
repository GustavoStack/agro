import 'package:flutter/material.dart';
import 'package:my_ong/utils/app_routes.dart';
import 'package:my_ong/widgets/app_logo.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const AppLogo('ONG XYZ'),
      ),
      body: const Center(
        child: Text('Contact'),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, AppRoutes.ong);
        },
        child: Icon(Icons.usb_rounded),
      ),
    );
  }
}
