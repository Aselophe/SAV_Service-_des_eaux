import 'package:isar/isar.dart';

part 'ouvrage.g.dart';

@embedded
class Ouvrage {
  late String nom;
  late String type;
  late double latitude;
  late double longitude;

  DateTime? dateInstallationBatterie;
  bool aUneAlarme = false;
  String notes = '';

  Ouvrage();
}