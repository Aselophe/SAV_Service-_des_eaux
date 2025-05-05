import 'package:flutter/material.dart';
import '../models/fontainier.dart';
import '../models/client.dart';
import '../main.dart'; // Pour accéder à isarService

class GestionFontainiersScreen extends StatefulWidget {
  final Client client;

  const GestionFontainiersScreen({super.key, required this.client});

  @override
  State<GestionFontainiersScreen> createState() =>
      _GestionFontainiersScreenState();
}

class _GestionFontainiersScreenState extends State<GestionFontainiersScreen> {
  void _ajouterOuModifierFontainier({Fontainier? existant, int? index}) {
    final formKey = GlobalKey<FormState>();
    final nomController = TextEditingController(text: existant?.nom ?? '');
    final prenomController = TextEditingController(
      text: existant?.prenom ?? '',
    );
    final telephoneController = TextEditingController(
      text: existant?.telephone ?? '',
    );
    final emailController = TextEditingController(text: existant?.email ?? '');

    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text(
              existant == null
                  ? 'Ajouter un fontainier'
                  : 'Modifier le fontainier',
            ),
            content: Form(
              key: formKey,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    TextFormField(
                      controller: nomController,
                      decoration: InputDecoration(labelText: 'Nom'),
                      validator:
                          (value) =>
                              value == null || value.trim().isEmpty
                                  ? 'Nom requis'
                                  : null,
                    ),
                    TextFormField(
                      controller: prenomController,
                      decoration: InputDecoration(labelText: 'Prénom'),
                    ),
                    TextFormField(
                      controller: telephoneController,
                      decoration: InputDecoration(labelText: 'Téléphone'),
                    ),
                    TextFormField(
                      controller: emailController,
                      decoration: InputDecoration(labelText: 'Email'),
                    ),
                  ],
                ),
              ),
            ),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Annuler'),
              ),
              ElevatedButton(
                onPressed: () {
                  if (formKey.currentState!.validate()) {
                    final nouveau = Fontainier.fromFields(
                      nomController.text,
                      prenomController.text,
                      telephoneController.text,
                      emailController.text,
                    );

                    setState(() {
                      final nouvelleListe = [...widget.client.fontainiers];
                      if (index != null) {
                        nouvelleListe[index] = nouveau;
                      } else {
                        nouvelleListe.add(nouveau);
                      }
                      widget.client.fontainiers = nouvelleListe;
                    });

                    isarService.saveClient(widget.client);
                    Navigator.pop(context);
                  }
                },
                child: Text('Enregistrer'),
              ),
            ],
          ),
    );
  }

  void _confirmerSuppression(int index) {
    showDialog(
      context: context,
      builder:
          (context) => AlertDialog(
            title: Text('Supprimer ce fontainier ?'),
            content: Text('Cette action est irréversible.'),
            actions: [
              TextButton(
                onPressed: () => Navigator.pop(context),
                child: Text('Annuler'),
              ),
              TextButton(
                onPressed: () {
                  setState(() {
                    final nouvelleListe = [...widget.client.fontainiers]
                      ..removeAt(index);
                    widget.client.fontainiers = nouvelleListe;
                  });
                  isarService.saveClient(widget.client);
                  Navigator.pop(context);
                },
                child: Text('Supprimer', style: TextStyle(color: Colors.red)),
              ),
            ],
          ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final fontainiers = widget.client.fontainiers;

    return Scaffold(
      appBar: AppBar(title: Text('Fontainiers')),
      body: ListView.builder(
        itemCount: fontainiers.length,
        itemBuilder: (context, index) {
          final f = fontainiers[index];
          return ListTile(
            title: Text('${f.prenom} ${f.nom}'),
            subtitle: Text('${f.telephone} • ${f.email}'),
            trailing: Wrap(
              spacing: 8,
              children: [
                IconButton(
                  icon: Icon(Icons.edit, color: Colors.blue),
                  onPressed:
                      () => _ajouterOuModifierFontainier(
                        existant: f,
                        index: index,
                      ),
                ),
                IconButton(
                  icon: Icon(Icons.delete, color: Colors.grey),
                  onPressed: () => _confirmerSuppression(index),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _ajouterOuModifierFontainier(),
        tooltip: 'Ajouter un fontainier',
        child: Icon(Icons.add),
      ),
    );
  }
}
