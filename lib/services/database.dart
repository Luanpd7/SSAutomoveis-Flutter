import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/client.dart';
import '../models/manager.dart';
import '../models/brand.dart';

///Método para resetar o banco caso precise

Future<void> resetDatabase() async {
  final database = await getDatabase();
  await _dropTables(database);
  await _createTables(database);
  await _insertInitialData(database);
  await printMarcaData(database);
}

Future<Database> getDatabase() async {
  final path = join(await getDatabasesPath(), 'mydb.db');

  return openDatabase(
    path,
    version: 3, // Incrementar a versão do banco de dados
    onCreate: (db, version) async {
      await _createTables(db);
      await _insertInitialData(db);
      await printMarcaData(db);
    },
    onUpgrade: (db, oldVersion, newVersion) async {
      if (oldVersion < newVersion) {
        await _dropTables(db);
        await _createTables(db);
        await _insertInitialData(db);
        await printMarcaData(db);
      }
    },
  );
}

Future<void> printMarcaData(Database db) async {
  final List<Map<String, dynamic>> maps = await db.query(TableBrand.tableName);

  if (maps.isEmpty) {
    print('No data found in ${TableBrand.tableName}');
  } else {
    maps.forEach((map) {
      final brand = Brand.fromMap(map);
      print('ID: ${brand.id}, Nome: ${brand.nome}');
    });
  }
}

Future<void> _createTables(Database db) async {
  await db.execute(TableClient.createTable);
  await db.execute(TableManager.createTable);
  await db.execute(TableBrand.createTable);
  print('Tables created');
}

Future<void> _dropTables(Database db) async {
  await db.execute('DROP TABLE IF EXISTS ${TableClient.tableName}');
  await db.execute('DROP TABLE IF EXISTS ${TableManager.tableName}');
  await db.execute('DROP TABLE IF EXISTS ${TableBrand.tableName}');
  print('Tables dropped');
}

Future<void> _insertInitialData(Database db) async {
  // Inserindo dados iniciais na tabela Marca
  await db.insert(
      TableBrand.tableName, TableBrand.toMap(Brand(id: 1, nome: 'Volkswagen')));
  await db.insert(
      TableBrand.tableName, TableBrand.toMap(Brand(id: 2, nome: 'Chevrolet')));
  await db.insert(
      TableBrand.tableName, TableBrand.toMap(Brand(id: 3, nome: 'Peugeot')));
  await db.insert(
      TableBrand.tableName, TableBrand.toMap(Brand(id: 4, nome: 'Honda')));
  await db.insert(
      TableBrand.tableName, TableBrand.toMap(Brand(id: 5, nome: 'Toyota')));
  print('Initial data inserted');
}

//Classe para tabela
class TableClient {
  static const String createTable = '''
   CREATE TABLE $tableName(
   $id INTEGER PRIMARY KEY NOT NULL,
   $dataRegistro TEXT NOT NULL,
   $cnpj TEXT NOT NULL,
   $razaoSocial TEXT NOT NULL,
   $telefone TEXT NOT NULL,
   $estado TEXT NOT NULL,
   $cidade TEXT NOT NULL
   );
   ''';

  static const String tableName = 'cliente';
  static const String id = 'id';
  static const String dataRegistro = 'dataRegistro';
  static const String cnpj = 'cnpj';
  static const String razaoSocial = 'razaoSocial';
  static const String telefone = 'telefone';
  static const String estado = 'estado';
  static const String cidade = 'cidade';

  // Método para mapear os dados do Client para um Map
  static Map<String, dynamic> toMap(Client client) {
    final map = <String, dynamic>{};

    map[TableClient.id] = client.id;
    map[TableClient.dataRegistro] = client.dataRegistro?.toIso8601String();
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
   $dataRegistro TEXT NOT NULL,
   $cpf TEXT NOT NULL,
   $nome TEXT NOT NULL,
   $telefone TEXT NOT NULL,
   $estado TEXT NOT NULL,
   $percentual TEXT NOT NULL
   );
   ''';

  static const String tableName = 'gerente';
  static const String id = 'id';
  static const String dataRegistro = 'dataRegistro';
  static const String cpf = 'cpf';
  static const String nome = 'nome';
  static const String telefone = 'telefone';
  static const String estado = 'estado';
  static const String percentual = 'percentual';

  // Método para mapear os dados do Mana para um Map
  static Map<String, dynamic> toMap(Manager manager) {
    final map = <String, dynamic>{};

    map[TableManager.id] = manager.id;
    map[TableManager.dataRegistro] = manager.dataRegistro?.toIso8601String();
    map[TableManager.cpf] = manager.cpf;
    map[TableManager.nome] = manager.nome;
    map[TableManager.telefone] = manager.telefone;
    map[TableManager.estado] = manager.estado;
    map[TableManager.percentual] = manager.percentual;

    return map;
  }
}

class TableBrand {
  static const String createTable = '''
   CREATE TABLE $tableName(
   $id INTEGER PRIMARY KEY NOT NULL,
   $nome TEXT NOT NULL
   );
   ''';

  static const String tableName = 'marca';
  static const String id = 'id';
  static const String nome = 'nome';

  // Método para mapear os dados do Mana para um Map
  static Map<String, dynamic> toMap(Brand marca) {
    final map = <String, dynamic>{};

    map[TableBrand.id] = marca.id;
    map[TableBrand.nome] = marca.nome;

    return map;
  }
}
