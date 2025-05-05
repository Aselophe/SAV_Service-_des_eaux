import 'package:isar/isar.dart';

part 'fontainier.g.dart';

@embedded
class Fontainier {
  late String nom;
  late String prenom;
  late String telephone;
  late String email;

  Fontainier();

  factory Fontainier.fromFields(
    String nom,
    String prenom,
    String telephone,
    String email,
  ) {
    final f = Fontainier();
    f.nom = nom;
    f.prenom = prenom;
    f.telephone = telephone;
    f.email = email;
    return f;
  }
}