import 'package:flutter/material.dart';
import '../models/brand.dart';
import '../repositories/brand_repository.dart';
import '../services/api_fipe.dart';

class VehicleProvider with ChangeNotifier {
  var brandRepository = BrandRepository();
  List<Brand> _list = [];
  List<Brand> get listBrand => _list;

  Future<void> selectMarca() async {
    _list = await brandRepository.load();
    notifyListeners();
  }

  final ApiFipe _fipeService = ApiFipe();
  List<dynamic> _listModel = [];

  List<dynamic> get listModel => _listModel;

  Future<void> fetchCarrosByMarca(String marcaId) async {
    _listModel = await _fipeService.getCarrosByMarca("5585");
    notifyListeners();
  }
}

