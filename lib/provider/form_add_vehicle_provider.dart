import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/brand.dart';
import 'vehicle_provider.dart';

class FormAddVehicleProvider with ChangeNotifier {
  final TextEditingController marcaController = TextEditingController();
  final TextEditingController modeloController = TextEditingController();
  final TextEditingController placaController = TextEditingController();
  final TextEditingController anoController = TextEditingController();
  final TextEditingController diariaController = TextEditingController();

  String? selectedMarca;
  String? selectedModelo;
  String? selectedModeloCode;
  String? selectedAno;

  List<Brand> marcas = [];
  List<Map<String, String>> modelos = [];
  List<String> anos = [];

  FormAddVehicleProvider();

  Future<void> initialize(BuildContext context) async {
    VehicleProvider vehicleProvider = Provider.of<VehicleProvider>(context, listen: false);
    await vehicleProvider.fetchBrand();
    marcas = vehicleProvider.listBrand;
  
    notifyListeners();
  }

  Future<void> setMarca(String? marca, BuildContext context) async {
    selectedMarca = marca;
    if (marca != null) {
      int? brandCode = marcas.firstWhere((b) => b.nome == marca).id;
      if (brandCode != null) {
        VehicleProvider vehicleProvider = Provider.of<VehicleProvider>(context, listen: false);
        modelos = await vehicleProvider.fetchModels(brandCode);
         
        selectedModelo = null;
        selectedModeloCode = null;
      }
    }
    notifyListeners();
  }

  void setModelo(String? modelo, BuildContext context) async {
    selectedModelo = modelo;
   
    selectedModeloCode = modelos.firstWhere((m) => m['name'] == modelo)['code'];
     if (selectedModeloCode != null) {
        VehicleProvider vehicleProvider = Provider.of<VehicleProvider>(context, listen: false);
        anos = await vehicleProvider.fetchYears(int.parse(selectedModeloCode!));
     }
    notifyListeners();
  }

  
  


  Future<void> setAno(String? ano, BuildContext context) async {
    selectedAno = ano;
    
    notifyListeners();
  }

  void cleanText() {
    marcaController.clear();
    modeloController.clear();
    placaController.clear();
    anoController.clear();
    diariaController.clear();
    selectedMarca = null;
    selectedModelo = null;
    selectedModeloCode = null;
    selectedAno = null;
    notifyListeners();
  }
}
