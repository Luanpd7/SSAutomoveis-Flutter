import '../models/client.dart';
import '../models/manager.dart';
import '../models/rent.dart';
import '../models/vehicle.dart';
import '../services/database.dart';

class RentRepository{

   final List<Rent> _listRent = [];

  List<Rent> get listRent => _listRent;

  Future<void> insertRent(Rent rent) async {
    final database = await getDatabase();
    final map = TableRent.toMap(rent);
    print('inserido no banco');
    await database.insert(TableRent.tableName, map);


  }

    Future<List<Rent>> load() async {
    final database = await getDatabase();
    final List<Map<String, dynamic>> maps =
        await database.query(TableRent.tableName);

    final List<Rent> rents =
        maps.map((map) => Rent.fromMap(map)).toList();


    listRent.clear();
    listRent.addAll(rents);

    return listRent;
  }




  Future<Manager?> getManager(int id) async {
    final db = await getDatabase();
    String query = 'SELECT * FROM ${TableManager.tableName} WHERE ${TableManager.id} = ?';
    List<Map<String, dynamic>> result = await db.rawQuery(query, [id]);

    if (result.isNotEmpty) {
      return Manager.fromMap(result.first);
    } else {
      return null;
    }


}

 Future<Client?> getClient(int id) async {
    final db = await getDatabase();
    String query = 'SELECT * FROM ${TableClient.tableName} WHERE ${TableManager.id} = ?';
    List<Map<String, dynamic>> result = await db.rawQuery(query, [id]);

    if (result.isNotEmpty) {
      return Client.fromMap(result.first);
    } else {
      return null;
    }
}

 Future<Vehicle?> getVehicle(int id) async {
    final db = await getDatabase();
    String query = 'SELECT * FROM ${TableVehicle.tableName} WHERE ${TableManager.id} = ?';
    List<Map<String, dynamic>> result = await db.rawQuery(query, [id]);

    if (result.isNotEmpty) {
      return Vehicle.fromMap(result.first);
    } else {
      return null;
    }
}



}