import 'package:flutter/material.dart';
import '../models/client.dart';

class AjouterClientScreen extends StatefulWidget {
  final Client? client;

  const AjouterClientScreen({this.client, super.key});

  @override
  _AjouterClientScreenState createState() => _AjouterClientScreenState();
}

class _AjouterClientScreenState extends State<AjouterClientScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _contratController = TextEditingController();
  final _clesPossedeesController = TextEditingController();
  final _clesADemanderController = TextEditingController();
  bool _abonnement = false;

  @override
  void initState() {
    super.initState();
    if (widget.client != null) {
      _nomController.text = widget.client!.nom;
      _contratController.text = widget.client!.numeroContrat;
      _abonnement = widget.client!.abonnementMaintenance;
      _clesPossedeesController.text = widget.client!.clesDisponibles.join(', ');
      _clesADemanderController.text = widget.client!.clesADemander.join(', ');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.client == null ? 'Ajouter un client' : 'Modifier le client',
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              TextFormField(
                controller: _nomController,
                decoration: InputDecoration(labelText: 'Nom du client'),
                validator: (value) => value!.isEmpty ? 'Nom requis' : null,
              ),
              TextFormField(
                controller: _contratController,
                decoration: InputDecoration(labelText: 'N° de contrat'),
              ),
              SwitchListTile(
                title: Text('Abonnement maintenance annuelle'),
                value: _abonnement,
                onChanged: (val) => setState(() => _abonnement = val),
              ),
              TextFormField(
                controller: _clesPossedeesController,
                decoration: InputDecoration(
                  labelText: 'Clés en possession (séparées par des virgules)',
                ),
              ),
              TextFormField(
                controller: _clesADemanderController,
                decoration: InputDecoration(
                  labelText: 'Clés à demander (séparées par des virgules)',
                ),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final client = Client();

                    client.nom = _nomController.text;
                    client.numeroContrat = _contratController.text;
                    client.abonnementMaintenance = _abonnement;
                    client.clesDisponibles =
                        _clesPossedeesController.text
                            .split(',')
                            .map((e) => e.trim())
                            .toList();
                    client.clesADemander =
                        _clesADemanderController.text
                            .split(',')
                            .map((e) => e.trim())
                            .toList();
                    client.ouvrages = widget.client?.ouvrages ?? [];
                    client.fontainiers = widget.client?.fontainiers ?? [];

                    Navigator.pop(context, client);
                  }
                },
                child: Text('Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
