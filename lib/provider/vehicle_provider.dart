import 'package:flutter/material.dart';
import '../models/brand.dart';
import '../models/vehicle.dart';
import '../repositories/brand_repository.dart';
import '../repositories/vehicle_repository.dart';
import '../services/api_fipe.dart';

class VehicleProvider with ChangeNotifier {
  var brandRepository = BrandRepository();
  List<Brand> _list = [];
  List<Brand> get listBrand => _list;
 bool? isLoading;
  List<Vehicle> _listVehicle = [];
  List<Vehicle> get listVehicle => _listVehicle;
 

  VehicleProvider() {
    select();
  }

  var vehicleRepository = VehicleRepository();

   void addVehicle(Vehicle vehicle) {
    vehicleRepository.insertVehicle(vehicle);
    print('inserido');
    notifyListeners();
  }

  Future<void> select() async {
    _listVehicle = await  vehicleRepository.load();
       isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    isLoading = false;
    notifyListeners();
  }




  final ApiFipe _fipeService = ApiFipe();

  Future<void> selectMarca() async {
    _list = await brandRepository.load();
    notifyListeners();
  }

  Future<void> fetchBrand() async {
    List<dynamic> fetchedBranch = await _fipeService.getMarcas();
    

    _list = fetchedBranch.map((data) => Brand.fromMap(data)).toList();
    
    notifyListeners();
  }

Future<List<Map<String, String>>> fetchModels(int brandCode) async {
  List<dynamic> fetchedModels = await _fipeService.getCarrosByMarca(brandCode.toString());
  if (fetchedModels.isNotEmpty) {
    List<Map<String, String>> models = fetchedModels.map((model) => {
      'code': model['code'] as String,
      'name': model['name'] as String
    }).toList();
    return models;
  }
  return [];
}



Future<List<String>> fetchYears(int brandCode, ) async {
  print('brandId: $brandCode ');

  List<dynamic> fetchedYears = await _fipeService.getYearsByModels(brandCode.toString());
  if (fetchedYears.isNotEmpty) {
    List<String> yearNames = fetchedYears.map((year) => year['name'] as String).toList();
    print('Anos retornados: $yearNames');
    return yearNames;
  }
  return [];
}

  Future<void> delete(Vehicle vehicle) async {
    vehicleRepository.delete(vehicle.id!);
    select();

    print('removido');
    notifyListeners();
  }

    Future<void> update(Vehicle Vehicle) async {
    vehicleRepository.updateVehicle(Vehicle);
    print('atualizado');
    select();
    notifyListeners();
  }

}
