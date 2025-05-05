import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:intl/intl.dart';
import '../models/client.dart';
import '../models/ouvrage.dart';
import '../screens/ajouter_ouvrage_screen.dart';
import '../screens/ajouter_client_screen.dart';
import '../screens/gestion_fontainiers_screen.dart';
import '../screens/carte_selection_screen.dart';
import '../services/isar_service.dart';

// Declare an instance of IsarService
final IsarService isarService = IsarService();

class FicheClientScreen extends StatefulWidget {
  final Client client;
  const FicheClientScreen({super.key, required this.client});

  @override
  State<FicheClientScreen> createState() => _FicheClientScreenState();
}

class _FicheClientScreenState extends State<FicheClientScreen> {
  void _ajouterOuvrage() async {
    final ouvrage = await Navigator.push<Ouvrage>(
      context,
      MaterialPageRoute(builder: (context) => AjouterOuvrageScreen()),
    );

    if (ouvrage != null) {
      setState(() {
        setState(() {
          widget.client.ouvrages = [...widget.client.ouvrages, ouvrage];
        });
      });
      await isarService.saveClient(widget.client);
    }
  }

  void _modifierOuvrage(Ouvrage ouvrage) async {
    final modif = await Navigator.push<Ouvrage>(
      context,
      MaterialPageRoute(builder: (_) => AjouterOuvrageScreen(ouvrage: ouvrage)),
    );

    if (modif != null) {
      setState(() {
        ouvrage.nom = modif.nom;
        ouvrage.type = modif.type;
        ouvrage.latitude = modif.latitude;
        ouvrage.longitude = modif.longitude;
        ouvrage.aUneAlarme = modif.aUneAlarme;
        ouvrage.dateInstallationBatterie = modif.dateInstallationBatterie;
        ouvrage.notes = modif.notes;
      });
      await isarService.saveClient(widget.client);
    }
  }

  void _confirmerSuppressionOuvrage(BuildContext context, Ouvrage ouvrage) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text("Supprimer l'ouvrage"),
            content: Text('Es-tu sûr de vouloir supprimer "${ouvrage.nom}" ?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text("Annuler"),
              ),
              TextButton(
                onPressed: () async {
                  setState(() {
                    widget.client.ouvrages.remove(ouvrage);
                  });
                  await isarService.saveClient(widget.client);
                  Navigator.pop(context);
                },
                child: Text("Supprimer", style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );
  }

  void _modifierClient() async {
    final modifClient = await Navigator.push<Client>(
      context,
      MaterialPageRoute(
        builder: (context) => AjouterClientScreen(client: widget.client),
      ),
    );

    if (modifClient != null) {
      setState(() {
        widget.client.nom = modifClient.nom;
        widget.client.numeroContrat = modifClient.numeroContrat;
        widget.client.abonnementMaintenance = modifClient.abonnementMaintenance;
        widget.client.clesDisponibles = modifClient.clesDisponibles;
        widget.client.clesADemander = modifClient.clesADemander;
      });
      await isarService.saveClient(widget.client);
    }
  }

  void _supprimerClient() {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Supprimer le client'),
            content: Text('Es-tu sûr de vouloir supprimer ce client ?'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Annuler'),
              ),
              TextButton(
                onPressed: () async {
                  await isarService.deleteClient(widget.client);
                  Navigator.pop(context); // Fermer la popup
                  Navigator.pop(context); // Revenir à la liste des clients
                },
                child: Text('Supprimer', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );
  }

  void _voirOuvragesSurCarte() {
    final positions =
        widget.client.ouvrages
            .map((o) => LatLng(o.latitude, o.longitude))
            .toList();
    final noms = widget.client.ouvrages.map((o) => o.nom).toList();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder:
            (_) => CarteSelectionScreen(
              multiplePositions: positions,
              nomsOuvrages: noms,
              lectureSeule: true,
              montrerPositionActuelle: true,
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final client = widget.client;

    return Scaffold(
      appBar: AppBar(
        title: Text('Client : ${client.nom}'),
        actions: [
          IconButton(
            icon: Icon(Icons.delete),
            onPressed: _supprimerClient,
            tooltip: 'Supprimer le client',
          ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: ListView(
          children: [
            ElevatedButton.icon(
              onPressed: _modifierClient,
              icon: Icon(Icons.edit),
              label: Text('Modifier le client'),
            ),
            ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => GestionFontainiersScreen(client: client),
                  ),
                ).then((_) => setState(() {}));
              },
              icon: Icon(Icons.people),
              label: Text('Gérer les fontainiers'),
            ),
            ElevatedButton.icon(
              onPressed: _voirOuvragesSurCarte,
              icon: Icon(Icons.map),
              label: Text('Voir les ouvrages sur la carte'),
            ),
            SizedBox(height: 10),
            Text(
              'Contrat : ${client.numeroContrat}',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 8),
            Text(
              'Abonnement annuel : ${client.abonnementMaintenance ? "Oui" : "Non"}',
              style: TextStyle(fontSize: 16),
            ),
            if (client.clesDisponibles.isNotEmpty)
              Text('Clés disponibles : ${client.clesDisponibles.join(", ")}'),
            if (client.clesADemander.isNotEmpty)
              Text('Clés à demander : ${client.clesADemander.join(", ")}'),
            SizedBox(height: 16),
            Text(
              'Ouvrages :',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            ...client.ouvrages.map(
              (o) => ListTile(
                title: Text(o.nom),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Type : ${o.type}'),
                    Text(
                      'Batterie : ${o.dateInstallationBatterie != null ? DateFormat("dd.MM.yyyy").format(o.dateInstallationBatterie!) : "Non installée"}',
                    ),
                  ],
                ),
                trailing: Wrap(
                  spacing: 4,
                  runSpacing: 0,
                  direction: Axis.vertical,
                  children: [
                    IconButton(
                      icon: Icon(Icons.map, color: Colors.green),
                      tooltip: 'Voir sur carte',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (_) => CarteSelectionScreen(
                                  positionInitiale: LatLng(
                                    o.latitude,
                                    o.longitude,
                                  ),
                                  lectureSeule: true,
                                ),
                          ),
                        );
                      },
                    ),
                    IconButton(
                      icon: Icon(Icons.edit, color: Colors.blue),
                      tooltip: 'Modifier',
                      onPressed: () => _modifierOuvrage(o),
                    ),
                    IconButton(
                      icon: Icon(Icons.delete, color: Colors.grey),
                      tooltip: 'Supprimer',
                      onPressed: () => _confirmerSuppressionOuvrage(context, o),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _ajouterOuvrage,
              icon: Icon(Icons.add),
              label: Text('Ajouter un ouvrage'),
            ),
          ],
        ),
      ),
    );
  }
}
