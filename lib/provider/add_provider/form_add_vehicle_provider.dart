import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/brand.dart';
import '../../models/vehicle.dart';
import '../../routes/appRoutes.dart';
import '../image_picker_provider.dart';
import '../vehicle_provider.dart';

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
  int? brandCode;

  FormAddVehicleProvider();


  Future<void> saveForm(BuildContext context) async {
    final imagePath = Provider.of<ImagePickerProvider>(context, listen: false).getImagePath();

    if (imagePath == null) {
      print('Selecione uma imagem antes de salvar');
      return;
    }

    final vehicle = Vehicle(
      id: null,
      modelo: selectedModelo ?? '',
      marca: selectedMarca ?? '',
      placa: placaController.text,
      ano: selectedAno ?? '',
      diaria: diariaController.text,
      imagePath: imagePath,
    );
    
    VehicleProvider().addVehicle(vehicle);

    print('Veículo salvo com sucesso:');
    print('Marca: ${vehicle.marca}');
    print('Modelo: ${vehicle.modelo}');
    print('Placa: ${vehicle.placa}');
    print('Ano: ${vehicle.ano}');
    print('Diária: ${vehicle.diaria}');
    print('Caminho da Imagem: ${vehicle.imagePath}');

    
    Provider.of<VehicleProvider>(context, listen: false).select();
    cleanText();
    Navigator.popAndPushNamed(context, AppRoute.queryVehicles);
  }

  Future<void> initialize(BuildContext context) async {
    VehicleProvider vehicleProvider =
        Provider.of<VehicleProvider>(context, listen: false);
    await vehicleProvider.fetchBrand();
    marcas = vehicleProvider.listBrand;

    notifyListeners();
  }

  Future<void> setMarca(String? marca, BuildContext context) async {
    selectedMarca = marca;
    if (marca != null) {
      brandCode = marcas.firstWhere((b) => b.nome == marca).id;
      if (brandCode != null) {
        VehicleProvider vehicleProvider =
            Provider.of<VehicleProvider>(context, listen: false);
        modelos = await vehicleProvider.fetchModels(brandCode!);

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
      VehicleProvider vehicleProvider =
          Provider.of<VehicleProvider>(context, listen: false);
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
