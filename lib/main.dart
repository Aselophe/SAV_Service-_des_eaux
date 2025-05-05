import 'package:flutter/material.dart';
import 'screens/carte_screen.dart';
import 'screens/clients_screen.dart';
import 'screens/ouvrages_screen.dart';
import 'screens/intervention_screen.dart';
import 'services/isar_service.dart';

final isarService = IsarService();

void main() {
  runApp(const MaintenanceApp());
}

class MaintenanceApp extends StatelessWidget {
  const MaintenanceApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Rittmeyer Maintenance',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const AccueilScreen(),
    );
  }
}

class AccueilScreen extends StatelessWidget {
  const AccueilScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Accueil')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const CarteScreen()),
              );
            },
            child: const Text('Voir la Carte'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const OuvragesScreen()),
              );
            },
            child: const Text('Liste des Ouvrages'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ClientsScreen()),
              );
            },
            child: const Text('Clients'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const InterventionScreen(),
                ),
              );
            },
            child: const Text('Intervention du Jour'),
          ),
          ElevatedButton(
            onPressed: () {
              // À implémenter
            },
            child: const Text('Exporter / Importer'),
          ),
        ],
      ),
    );
  }
}
