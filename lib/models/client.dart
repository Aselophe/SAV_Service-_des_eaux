import 'package:isar/isar.dart';
import 'ouvrage.dart';
import 'fontainier.dart';

part 'client.g.dart';

@Collection()
class Client {
  Id id = Isar.autoIncrement;

  late String nom;
  late String numeroContrat;
  late bool abonnementMaintenance;
  List<String> clesDisponibles = [];
  List<String> clesADemander = [];
  List<Ouvrage> ouvrages = [];
  List<Fontainier> fontainiers = [];

  Client();

  factory Client.create({
    required String nom,
    required String numeroContrat,
    required bool abonnementMaintenance,
    required List<String> clesDisponibles,
    required List<String> clesADemander,
    required List<Ouvrage> ouvrages,
    required List<Fontainier> fontainiers,
  }) {
    final c = Client();
    c.nom = nom;
    c.numeroContrat = numeroContrat;
    c.abonnementMaintenance = abonnementMaintenance;
    c.clesDisponibles = clesDisponibles;
    c.clesADemander = clesADemander;
    c.ouvrages = ouvrages;
    c.fontainiers = fontainiers;
    return c;
  }
}