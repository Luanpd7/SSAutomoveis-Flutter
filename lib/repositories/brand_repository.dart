import '../models/brand.dart';
import '../services/database.dart';

/// [BrandRepository] é responsável por gerenciar a persistência dos dados
/// da entidade [Brand] no banco de dados.
///
class BrandRepository {
  final List<Brand> _listMarca = [];

  List<Brand> get listMarca => _listMarca;

   Future<List<Brand>> load() async {
    final database = await getDatabase();
    final List<Map<String, dynamic>> maps =
        await database.query(TableBrand.tableName);

    final List<Brand> marca =
        maps.map((map) => Brand.fromMap(map)).toList();

    listMarca.clear();
    listMarca.addAll(marca);
   // print('brandrepository ${listMarca[1].nome}');

    return listMarca;
  }

}