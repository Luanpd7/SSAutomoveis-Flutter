import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/client.dart';


Future<void> resetDatabase() async {
  final path = join(
    await getDatabasesPath(),
    'mydb.db',
  );

  await deleteDatabase(path);
}


Future<Database> getDatabase() async {
  final path = join(
    await getDatabasesPath(),
    'mydb.db',
  );

  return openDatabase(
    path,
    version: 2, // Aumente a versão do banco de dados
    onCreate: (db, version) {
      db.execute(TableClient.createTable);
    },
    onUpgrade: (db, oldVersion, newVersion) async {
      if (oldVersion < newVersion) {
        await db.execute('DROP TABLE IF EXISTS ${TableClient.tableName}');
        db.execute(TableClient.createTable);
      }
    },
  );
}

class TableClient {
  static const String createTable = '''
   CREATE TABLE $tableName(
   $cnpj TEXT PRIMARY KEY NOT NULL,
   $razaoSocial TEXT NOT NULL,
   $telefone TEXT NOT NULL,
   $estado TEXT NOT NULL,
   $cidade TEXT NOT NULL
   );
   ''';

  static const String tableName = 'cliente';
  static const String cnpj = 'cnpj';
  static const String razaoSocial = 'razaoSocial';
  static const String telefone = 'telefone';
  static const String estado = 'estado';
  static const String cidade = 'cidade';
   
  // Método para mapear os dados do Client para um Map
  static Map<String, dynamic> toMap(Client client) {
    final map = <String, dynamic>{};

    map[TableClient.cnpj] = client.cnpj;
    map[TableClient.razaoSocial] = client.razaoSocial;
    map[TableClient.telefone] = client.telefone;
    map[TableClient.estado] = client.estado;
    map[TableClient.cidade] = client.cidade;

    return map;
  }
}