import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import '../models/client.dart';
import '../models/manager.dart';
import '../models/brand.dart';
import '../models/rent.dart';
import '../models/vehicle.dart';

///Método para resetar o banco caso precise

Future<void> resetDatabase() async {
  final database = await getDatabase();
  await _dropTables(database);
  await _createTables(database);
  await printMarcaData(database);
}

Future<Database> getDatabase() async {
  final path = join(await getDatabasesPath(), 'mydb.db');

  return openDatabase(
    path,
    version: 3, // Incrementar a versão do banco de dados
    onCreate: (db, version) async {
      await _createTables(db);
      await printMarcaData(db);
    },
    onUpgrade: (db, oldVersion, newVersion) async {
      if (oldVersion < newVersion) {
        await _dropTables(db);
        await _createTables(db);
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
  await db.execute(TableVehicle.createTable);
   await db.execute(TableRent.createTable);
  print('Tables created');
}

Future<void> _dropTables(Database db) async {
  await db.execute('DROP TABLE IF EXISTS ${TableClient.tableName}');
  await db.execute('DROP TABLE IF EXISTS ${TableManager.tableName}');
  await db.execute('DROP TABLE IF EXISTS ${TableBrand.tableName}');
  await db.execute('DROP TABLE IF EXISTS ${TableVehicle.tableName}');
  await db.execute('DROP TABLE IF EXISTS ${TableRent.tableName}');
  print('Tables dropped');
}


class TableClient {
  static const String createTable = '''
   CREATE TABLE $tableName(
   $id INTEGER PRIMARY KEY AUTOINCREMENT,
   $dataRegistro TEXT NOT NULL,
   $cnpj TEXT NOT NULL,
   $razaoSocial TEXT NOT NULL,
   $telefone TEXT NOT NULL,
   $estado TEXT NOT NULL,
   $cidade TEXT NOT NULL,
   $gerenteId INTEGER,
   FOREIGN KEY($gerenteId) REFERENCES ${TableManager.tableName}(${TableManager.id})
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
  static const String gerenteId = 'gerenteId';

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
    map[TableClient.gerenteId] = client.gerenteId;

    return map;
  }

  // Método para criar um objeto Client a partir de um Map
  static Client fromMap(Map<String, dynamic> map) {
    return Client(
      id: map[id] as int?,
      dataRegistro: DateTime.parse(map[dataRegistro] as String),
      cnpj: map[cnpj] as String,
      razaoSocial: map[razaoSocial] as String,
      telefone: map[telefone] as String,
      estado: map[estado] as String,
      cidade: map[cidade] as String,
      gerenteId: map[gerenteId] as int?,
    );
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

class TableVehicle {
  static const String createTable = '''
   CREATE TABLE $tableName(
   $id INTEGER PRIMARY KEY AUTOINCREMENT,
   $modelo TEXT NOT NULL,
   $marca TEXT NOT NULL,
   $placa TEXT NOT NULL,
   $ano TEXT NOT NULL,
   $diaria TEXT NOT NULL,
   $imagePath TEXT NOT NULL
   );
   ''';

  static const String tableName = 'vehicle';
  static const String id = 'id';
  static const String modelo = 'modelo';
  static const String marca = 'marca';
  static const String placa = 'placa';
  static const String ano = 'ano';
  static const String diaria = 'diaria';
  static const String imagePath = 'imagePath';

  // Método para mapear os dados do Vehicle para um Map
  static Map<String, dynamic> toMap(Vehicle vehicle) {
    final map = <String, dynamic>{};

    map[TableVehicle.id] = vehicle.id;
    map[TableVehicle.modelo] = vehicle.modelo;
    map[TableVehicle.marca] = vehicle.marca;
    map[TableVehicle.placa] = vehicle.placa;
    map[TableVehicle.ano] = vehicle.ano;
    map[TableVehicle.diaria] = vehicle.diaria;
    map[TableVehicle.imagePath] = vehicle.imagePath;

    return map;
  }
}

class TableRent {
  static const String createTable = ''' 
  CREATE TABLE $tableName(
   $id INTEGER PRIMARY KEY AUTOINCREMENT,
   $clientId INTEGER,
   $veiculoId INTEGER,
   $dataRegistro TEXT NOT NULL,
   $dataInicio TEXT NOT NULL,
   $dataFim TEXT NOT NULL,
   $dias TEXT NOT NULL,
   $valorTotal TEXT NOT NULL,
   $comissao TEXT NOT NULL
   );
  ''';

  static const String tableName = 'rent';
  static const String id = 'id';
  static const String clientId = 'clientId';
  static const String veiculoId = 'veiculoId';
  static const String dataRegistro = 'dataRegistro';
  static const String dataInicio = 'dataInicio';
  static const String dataFim = 'dataFim';
  static const String dias = 'dias';
  static const String valorTotal = 'valorTotal'; 
  static const String comissao = 'comissao'; 


  // Método para mapear os dados do aluguel para um Map
  static Map<String, dynamic> toMap(Rent rent) {
    final map = <String, dynamic>{};

    map[id] = rent.id;
    map[clientId] = rent.clientId;
    map[veiculoId] = rent.vehicleId;
    map[dataRegistro] = rent.dataRegistro?.toIso8601String();
    map[dataInicio] = rent.dataInicio.toIso8601String();
    map[dataFim] = rent.dataFim.toIso8601String();
    map[dias] = rent.dias;
    map[valorTotal] = rent.valorTotal;
    map[comissao] = rent.comissao;

    return map;
  }
}



