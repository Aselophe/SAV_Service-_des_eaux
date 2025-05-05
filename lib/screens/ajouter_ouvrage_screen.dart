import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:intl/intl.dart';

import '../models/ouvrage.dart';
import 'carte_selection_screen.dart';

class AjouterOuvrageScreen extends StatefulWidget {
  final Ouvrage? ouvrage;

  const AjouterOuvrageScreen({this.ouvrage, super.key});

  @override
  _AjouterOuvrageScreenState createState() => _AjouterOuvrageScreenState();
}

class _AjouterOuvrageScreenState extends State<AjouterOuvrageScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nomController = TextEditingController();
  final _typeController = TextEditingController();
  final _latitudeController = TextEditingController();
  final _longitudeController = TextEditingController();
  final _notesController = TextEditingController();

  DateTime? _dateBatterie;
  bool _aUneAlarme = false;

  @override
  void initState() {
    super.initState();
    if (widget.ouvrage != null) {
      _nomController.text = widget.ouvrage!.nom;
      _typeController.text = widget.ouvrage!.type;
      _latitudeController.text = widget.ouvrage!.latitude.toString();
      _longitudeController.text = widget.ouvrage!.longitude.toString();
      _aUneAlarme = widget.ouvrage!.aUneAlarme;
      _dateBatterie = widget.ouvrage!.dateInstallationBatterie;
      _notesController.text = widget.ouvrage!.notes;
    }
  }

  void _choisirDateInstallation() async {
    final picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime.now(),
    );

    if (picked != null) {
      setState(() => _dateBatterie = picked);
    }
  }

  Future<void> _obtenirPositionActuelle() async {
    final position = await Geolocator.getCurrentPosition();
    setState(() {
      _latitudeController.text = position.latitude.toString();
      _longitudeController.text = position.longitude.toString();
    });
  }

  void _ouvrirCartePourChoix() async {
    final LatLng? resultat = await Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => CarteSelectionScreen()),
    );

    if (resultat != null) {
      setState(() {
        _latitudeController.text = resultat.latitude.toString();
        _longitudeController.text = resultat.longitude.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final dateFormatted =
        _dateBatterie != null
            ? DateFormat('dd.MM.yyyy').format(_dateBatterie!)
            : 'Pas de batterie';

    return Scaffold(
      appBar: AppBar(
        title: Text(
          widget.ouvrage == null ? 'Ajouter un ouvrage' : 'Modifier un ouvrage',
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
                decoration: InputDecoration(labelText: 'Nom de l\'ouvrage'),
                validator: (value) => value!.isEmpty ? 'Nom requis' : null,
              ),
              TextFormField(
                controller: _typeController,
                decoration: InputDecoration(labelText: 'Type'),
              ),
              TextFormField(
                controller: _latitudeController,
                decoration: InputDecoration(labelText: 'Latitude'),
                keyboardType: TextInputType.number,
              ),
              TextFormField(
                controller: _longitudeController,
                decoration: InputDecoration(labelText: 'Longitude'),
                keyboardType: TextInputType.number,
              ),
              Row(
                children: [
                  ElevatedButton(
                    onPressed: _obtenirPositionActuelle,
                    child: Text('📍 Position actuelle'),
                  ),
                  SizedBox(width: 10),
                  ElevatedButton(
                    onPressed: _ouvrirCartePourChoix,
                    child: Text('🗺️ Choisir sur carte'),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Row(
                children: [
                  Text('Date batterie : $dateFormatted'),
                  Spacer(),
                  ElevatedButton(
                    onPressed: _choisirDateInstallation,
                    child: Text('📅 Choisir date'),
                  ),
                ],
              ),
              SwitchListTile(
                title: Text('Présence d\'une alarme'),
                value: _aUneAlarme,
                onChanged: (val) => setState(() => _aUneAlarme = val),
              ),
              TextFormField(
                controller: _notesController,
                decoration: InputDecoration(labelText: 'Notes'),
                maxLines: 3,
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    final ouvrage =
                        Ouvrage()
                          ..nom = _nomController.text
                          ..type = _typeController.text
                          ..latitude =
                              double.tryParse(_latitudeController.text) ?? 0.0
                          ..longitude =
                              double.tryParse(_longitudeController.text) ?? 0.0
                          ..dateInstallationBatterie = _dateBatterie
                          ..aUneAlarme = _aUneAlarme
                          ..notes = _notesController.text;

                    Navigator.pop(context, ouvrage);
                  }
                },
                child: Text('✅ Enregistrer'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
