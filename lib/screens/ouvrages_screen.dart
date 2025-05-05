import 'package:flutter/material.dart';

class OuvragesScreen extends StatelessWidget {
  const OuvragesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Liste des Ouvrages')),
      body: Center(
        child: Text(
          'Ici tu pourras voir et gérer les ouvrages.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
