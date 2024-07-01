import 'package:flutter/material.dart';
import '../models/brand.dart';
import '../repositories/brand_repository.dart';
import '../services/api_fipe.dart';

class VehicleProvider with ChangeNotifier {
  var brandRepository = BrandRepository();
  List<Brand> _list = [];
  List<Brand> get listBrand => _list;

  final ApiFipe _fipeService = ApiFipe();

  Future<void> selectMarca() async {
    _list = await brandRepository.load();
    notifyListeners();
  }

  Future<void> fetchBrand() async {
    List<dynamic> fetchedBranch = await _fipeService.getMarcas();

    List<dynamic> selectBrand = [
      fetchedBranch[6],
      fetchedBranch[8],
      fetchedBranch[31],
      fetchedBranch[33],
      fetchedBranch[37],
    ];
    _list = selectBrand.map((data) => Brand.fromMap(data)).toList();
    print('--- Marcas Selecionadas ---');
    _list.forEach((brand) {
      print('Marca: ${brand.nome}, ID: ${brand.id}');
    });
    notifyListeners();
  }

  Future<List<String>> fetchModels(int brandCode) async {
    List<dynamic> fetchedModels =
        await _fipeService.getCarrosByMarca(brandCode.toString());
    if (fetchedModels.isNotEmpty) {
      List<String> modelNames =
          fetchedModels.map((model) => model['name'] as String).toList();
      print('Modelos para a marca $brandCode: $modelNames');
      return modelNames;
    }
    return [];
  }
}
