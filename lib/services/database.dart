import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/client.dart';



Future<Database> getDatabase() async {
  final path = join(
    await getDatabasesPath(),
    'mydb.db', 
  );

  return openDatabase(
    path,
    onCreate: (db, version) {
      db.execute(TableClient.createTable);
    },
    version: 1,
  );
}


class TableClient{
   static const String createTable = '''
   CREATE TABLE $tableName(
   $cnpj INTEGER PRIMARY KEY NOT NULL,
   $razaoSocial TEXT NOT NULL,
   $telefone TEXT NOT NULL,
   $estado TEXT NOT NULL,
   $cidade TEXT NOT NULL
   );
   ''';

   static const String tableName = 'cliente';
   static const String cnpj = 'cnpj';
   static const String razaoSocial= 'razaoSocial';
   static const String telefone = 'telefone';
   static const String estado = 'estado';
   static const String cidade = 'cidade';
   
   
   //serve para organiza os dados e coloca no banco de dados passando os dados de uma classe intermediaria
   static Map<String, dynamic> toMap(Client client){
     final map = <String, dynamic>{};

     map[TableClient.cnpj] = client.cnpj;
     map[TableClient.razaoSocial] = client.razaoSocial;
     map[TableClient.telefone] = client.telefone;
     map[TableClient.estado] = client.estado;
     map[TableClient.cidade] = client.cidade;
   
     return map;
   }


}






 //serve como uma classe intermediaria, da onde vem os dados da classe de visualização e envia para o banco
class PessoaController{
  
  Future<void> insert(Client client) async{
  final database = await getDatabase();
  final map = TableClient.toMap(client);

  print(' inserido no banco = ${map[TableClient.cnpj]}');
  print(' inserido no banco = ${map[TableClient.razaoSocial]}');

  await database.insert(TableClient.tableName, map);
 
  return;
}


Future<List<Client>> select() async {
  final database = await getDatabase();

  final List<Map<String, dynamic>> result = await database.query(
    TableClient.tableName
  );

  var list = <Client>[];

  for(final item in result){
    list.add(
      Client(
        cnpj: item[TableClient.cnpj], 
        razaoSocial: item[TableClient.razaoSocial], 
        telefone: item[TableClient.telefone],
        estado: item[TableClient.telefone],
        cidade: item[TableClient.cidade],
        )
    );
  }
  return list;
}


}

  