import '../models/manager.dart';
import '../services/database.dart';

class ManagerRepository {
  final List<Manager> _listManager = [];
  List<Manager> get listManager => _listManager;

  Future<void> insertManager(Manager manager) async {
    final database = await getDatabase();
    final map = TableManager.toMap(manager);

    await database.insert(TableManager.tableName, map);

    print('Inserido no banco = ${map[TableManager.cpf]}');
    print('Inserido no banco = ${map[TableManager.nome]}');
    print('Inserido no banco = ${map[TableManager.id]}');
  }

  Future<List<Manager>> load() async {
    final database = await getDatabase();
    final List<Map<String, dynamic>> maps =
        await database.query(TableClient.tableName);

    final List<Manager> manager =
        maps.map((map) => Manager.fromMap(map)).toList();

    listManager.clear();
    listManager.addAll(manager);

    return listManager;
  }
}
