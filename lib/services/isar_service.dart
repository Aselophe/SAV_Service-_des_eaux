import 'package:isar/isar.dart';
import 'package:path_provider/path_provider.dart';
import '../models/client.dart';

class IsarService {
  static final IsarService _instance = IsarService._internal();
  factory IsarService() => _instance;

  IsarService._internal() {
    db = _initDb();
  }

  late Future<Isar> db;

  Future<Isar> _initDb() async {
    final dir = await getApplicationDocumentsDirectory();

    if (Isar.instanceNames.isEmpty) {
      return await Isar.open([ClientSchema], directory: dir.path);
    }
    return Future.value(Isar.getInstance()!);
  }

  Future<void> saveClient(Client client) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.clients.put(client);
    });
  }

  Future<void> deleteClient(Client client) async {
    final isar = await db;
    await isar.writeTxn(() async {
      await isar.clients.delete(client.id);
    });
  }

  Future<List<Client>> getAllClients() async {
    final isar = await db;
    return await isar.clients.where().findAll();
  }
}
