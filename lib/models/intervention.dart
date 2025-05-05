class Intervention {
  final String id;
  final String type; // "Maintenance" ou "Panne"
  final DateTime date;
  final Duration duree;
  final String remarques;

  Intervention({
    required this.id,
    required this.type,
    required this.date,
    required this.duree,
    this.remarques = '',
  });
}
