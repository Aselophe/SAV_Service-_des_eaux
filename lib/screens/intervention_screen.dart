import 'package:flutter/material.dart';

class InterventionScreen extends StatelessWidget {
  const InterventionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Intervention du Jour')),
      body: Center(
        child: Text(
          'Ici tu pourras enregistrer une intervention.',
          style: TextStyle(fontSize: 18),
        ),
      ),
    );
  }
}
