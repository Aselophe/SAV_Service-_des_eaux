import 'package:flutter/material.dart';
import '../models/client.dart';
import 'ajouter_client_screen.dart';
import 'fiche_client_screen.dart';
import '../main.dart' as main; // permet d'accéder à isarService

class ClientsScreen extends StatefulWidget {
  const ClientsScreen({super.key});

  @override
  State<ClientsScreen> createState() => _ClientsScreenState();
}

class _ClientsScreenState extends State<ClientsScreen> {
  late Future<List<Client>> _clientsFuture;

  @override
  void initState() {
    super.initState();
    _loadClients();
  }

  void _loadClients() {
    _clientsFuture = main.isarService.getAllClients();
  }

  Future<void> _ajouterClient() async {
    final newClient = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const AjouterClientScreen()),
    );

    if (newClient != null) {
      await main.isarService.saveClient(newClient);
      setState(() {
        _loadClients();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Clients')),
      body: FutureBuilder<List<Client>>(
        future: _clientsFuture,
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: CircularProgressIndicator());
          }

          final clients = snapshot.data!;
          if (clients.isEmpty) return const Center(child: Text('Aucun client'));

          return ListView.builder(
            itemCount: clients.length,
            itemBuilder: (_, index) {
              final c = clients[index];
              return ListTile(
                title: Text(c.nom),
                subtitle: Text('Contrat : ${c.numeroContrat}'),
                trailing:
                    c.abonnementMaintenance
                        ? const Icon(Icons.check_circle, color: Colors.green)
                        : const Icon(Icons.cancel, color: Colors.red),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => FicheClientScreen(client: c),
                    ),
                  );
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _ajouterClient,
        child: const Icon(Icons.add),
      ),
    );
  }
}
