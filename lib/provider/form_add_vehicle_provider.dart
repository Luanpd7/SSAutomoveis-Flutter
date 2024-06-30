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
  String? selectedAno;

  List<Brand> marcas = [];
  List<String> modelos = [];
  List<String> anos = [];

  FormAddVehicleProvider() {
    // Constructor to initialize any necessary data
  }

  Future<void> initialize(BuildContext context) async {
    await Provider.of<VehicleProvider>(context, listen: false).selectMarca();
    marcas = Provider.of<VehicleProvider>(context, listen: false).listBrand;
    notifyListeners();
  }

  Future<void> fetchModelosByMarca(BuildContext context, String marcaId) async {
    await Provider.of<VehicleProvider>(context, listen: false).fetchCarrosByMarca(marcaId);
    modelos = Provider.of<VehicleProvider>(context, listen: false).listModel.map((carro) => carro['nome'] as String).toList();
    notifyListeners();
  }

  void setMarca(BuildContext context, String? marca) async {
    selectedMarca = marca;
    if (marca != null) {
      await fetchModelosByMarca(context, marca);
    }
    notifyListeners();
  }

  void setModelo(String? modelo) {
    if (modelos.contains(modelo)) {
      selectedModelo = modelo;
      notifyListeners();
    } else {
      print('Estado inválido: ');
    }
  }

  void setAno(String? ano) {
    if (anos.contains(ano)) {
      selectedAno = ano;
      notifyListeners();
    } else {
      print('Estado inválido: ');
    }
  }

  void cleanText() {
    marcaController.clear();
    modeloController.clear();
    placaController.clear();
    anoController.clear();
    diariaController.clear();
  }
}
