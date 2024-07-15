import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/client.dart';
import '../../models/manager.dart';
import '../../models/rent.dart';
import '../../models/vehicle.dart';
import '../../repositories/rent_repository.dart';
import '../../routes/appRoutes.dart';
import '../rent_provider.dart';

class FormAddRentProvider with ChangeNotifier {
  final initController = TextEditingController();
  final findController = TextEditingController();

  Manager? manager;

  dynamic dateTest;
  DateTime? dateInit;
  DateTime? dateFind;

  void setDataInit() {
    dateTest = dateInit!.toIso8601String().split('T')[0];
    initController.text = dateTest;
    notifyListeners();
  }

  void setDataFind() {
    var dateTests = dateFind!.toIso8601String().split('T')[0];
    findController.text = dateTests;
    notifyListeners();
  }

  int diasSobrando()  {
    final initDateParse = DateTime.parse(initController.text);
    final findDateParse = DateTime.parse(findController.text);
   final differenceTime = findDateParse.difference(initDateParse);
    
    return differenceTime.inDays;
  }

  double valorPagar() {
    if (selectedVehicle == null || selectedVehicle!.diaria.isEmpty) {
      return 0.0;
    }
    double? diary = double.tryParse(selectedVehicle!.diaria);
    double value = (diary ?? 0) * diasSobrando();
    return value;
  }

  Future<void> retornarManager() async {
    if (selectedClient != null && selectedClient!.gerenteId != null) {
      manager = await RentRepository().getManager(selectedClient!.gerenteId!);
      
    } else {
      print("Cliente ou gerenteId não pode ser nulo");
    }
  }

  double comissaoGerente() {
    if (manager != null) {
      double? percentual = double.tryParse(manager!.percentual);
      double valorTotal = valorPagar();
      double comissao = (percentual ?? 0) / 100 * valorTotal;
      return comissao;
    } else {
      print("Gerente não pode ser nulo");
      return 0.0;
    }
  }

  Client? selectedClient;

  void setClient(Client? client) {
    selectedClient = client;
    notifyListeners();
  }

  Vehicle? selectedVehicle;

  void setVehicle(Vehicle? vehicle) {
    selectedVehicle = vehicle;
    notifyListeners();
  }

  Future<void> saveForm(BuildContext context) async {
    await retornarManager();

    print(initController.text);
    print(findController.text);
    print(diasSobrando());
   

   
    

    if (selectedClient == null ||
        selectedVehicle == null ||
        dateInit == null ||
        dateFind == null) {
      print('Todos os campos devem ser preenchidos');
      return;
    }

    var rent = Rent(
      id: null,
      clientId: selectedClient!.id!,
      vehicleId: selectedVehicle!.id!,
      dataRegistro: DateTime.now(),
      dataInicio: dateInit!,
      dataFim: dateFind!,
      dias:  diasSobrando(),
      valorTotal: valorPagar(),
      comissao: comissaoGerente(),
    );

    RentProvider().addRent(rent);
    Provider.of<RentProvider>(context, listen: false).select();

    cleanText();

    Navigator.popAndPushNamed(context, AppRoute.queryRents);
  }

  void cleanText() {
    initController.clear();
    initController.clear();
    selectedClient = null;
    selectedVehicle = null;
  }
}
