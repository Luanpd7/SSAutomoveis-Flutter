import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/client.dart';
import '../models/manager.dart';

///Método para resetar o banco caso precise



Future<void> resetDatabase() async {
  final path = join(await getDatabasesPath(), 'mydb.db');

  await deleteDatabase(path);
  print('Database deleted at $path');
}


Future<Database> getDatabase() async {
  final path = join(await getDatabasesPath(), 'mydb.db');

  return openDatabase(
    path,
    version: 2, 
    onCreate: (db, version) async {
      await db.execute(TableClient.createTable);
      await db.execute(TableManager.createTable); 
      print('Tables created');
    },
  );
}

//Classe para tabela
class TableClient {
  static const String createTable = '''
   CREATE TABLE $tableName(
   $id INTEGER PRIMARY KEY NOT NULL,
   $cnpj TEXT NOT NULL,
   $razaoSocial TEXT NOT NULL,
   $telefone TEXT NOT NULL,
   $estado TEXT NOT NULL,
   $cidade TEXT NOT NULL
   );
   ''';

  static const String tableName = 'cliente';
  static const String id = 'id';
  static const String cnpj = 'cnpj';
  static const String razaoSocial = 'razaoSocial';
  static const String telefone = 'telefone';
  static const String estado = 'estado';
  static const String cidade = 'cidade';

  // Método para mapear os dados do Client para um Map
  static Map<String, dynamic> toMap(Client client) {
    final map = <String, dynamic>{};

    map[TableClient.id] = client.id;
    map[TableClient.cnpj] = client.cnpj;
    map[TableClient.razaoSocial] = client.razaoSocial;
    map[TableClient.telefone] = client.telefone;
    map[TableClient.estado] = client.estado;
    map[TableClient.cidade] = client.cidade;

    return map;
  }
}

class TableManager {
  static const String createTable = '''
   CREATE TABLE $tableName(
   $id INTEGER PRIMARY KEY NOT NULL,
   $cpf TEXT NOT NULL,
   $nome TEXT NOT NULL,
   $telefone TEXT NOT NULL,
   $estado TEXT NOT NULL,
   $percentual TEXT NOT NULL
   );
   ''';

  static const String tableName = 'gerente';
  static const String id = 'id';
  static const String cpf = 'cpf';
  static const String nome = 'nome';
  static const String telefone = 'telefone';
  static const String estado = 'estado';
  static const String percentual = 'percentual';

  // Método para mapear os dados do Mana para um Map
  static Map<String, dynamic> toMap(Manager manager) {
    final map = <String, dynamic>{};

    map[TableManager.id] = manager.id;
    map[TableManager.cpf] = manager.cpf;
    map[TableManager.nome] = manager.nome;
    map[TableManager.telefone] = manager.telefone;
    map[TableManager.estado] = manager.estado;
    map[TableManager.percentual] = manager.percentual;

    return map;
  }
}
