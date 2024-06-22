import '../models/client.dart';
import '../services/database.dart';

/// [ClientRepository] é responsável por gerenciar a persistência dos dados
/// da entidade [Client] no banco de dados.
class ClientRepository {
  final List<Client> _listClient = [];

  List<Client> get listClient => _listClient;

  Future<void> insertClient(Client client) async {
    final database = await getDatabase();
    final map = TableClient.toMap(client);

    await database.insert(TableClient.tableName, map);

    print('Inserido no banco = ${map[TableClient.cnpj]}');
    print('Inserido no banco = ${map[TableClient.razaoSocial]}');
    print('Inserido no banco = ${map[TableClient.id]}');
  }

  Future<List<Client>> load() async {
    final database = await getDatabase();
    final List<Map<String, dynamic>> maps =
        await database.query(TableClient.tableName);

    final List<Client> clients =
        maps.map((map) => Client.fromMap(map)).toList();

    listClient.clear();
    listClient.addAll(clients);

    return listClient;
  }

  Future<void> delete(int id) async {
    final database = await getDatabase();
    await database.delete(
      TableClient.tableName,
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future<void> updateClient(Client client) async {
    final database = await getDatabase();
    await database.update(
      TableClient.tableName,
      client.toMap(),
      where: 'id = ?',
      whereArgs: [client.id],
    );
  }
}
