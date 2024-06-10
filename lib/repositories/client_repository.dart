import '../models/client.dart';
import '../services/database.dart';

class ClientRepository {
   
 final List<Client> _listClient = [];

  List<Client> get listClient=> _listClient;

  Future<void> insertClient(Client client) async {
    final database = await getDatabase();
    final map = TableClient.toMap(client);

    await database.insert(TableClient.tableName, map);

    print('Inserido no banco = ${map[TableClient.cnpj]}');
    print('Inserido no banco = ${map[TableClient.razaoSocial]}');
  }



   Future<List<Client>> load() async {
    final database = await getDatabase();
    final List<Map<String, dynamic>> maps = await database.query(TableClient.tableName);

    final List<Client> clients = maps.map((map) => Client(
      cnpj: map[TableClient.cnpj],
      razaoSocial: map[TableClient.razaoSocial],
      telefone: map[TableClient.telefone],
      estado: map[TableClient.estado],
      cidade: map[TableClient.cidade],
    )).toList();

    _listClient.clear();
    _listClient.addAll(clients);

    return _listClient;
  }


}


