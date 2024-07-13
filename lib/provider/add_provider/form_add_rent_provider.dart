import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../models/client.dart';
import '../../models/vehicle.dart';

class FormAddRentProvider with ChangeNotifier {
  final initController = TextEditingController();
  final findController = TextEditingController();

  dynamic dateTest;
  DateTime? dateInit;
  DateTime? dateFind;

  void setDataInit() {
    dateTest = dateInit!.toIso8601String().split('T')[0];
    initController.text = dateTest;
    notifyListeners();
  }

  void setDataFind() {
    print(dateFind);
    dateTest = dateFind!.toIso8601String().split('T')[0];

    findController.text = dateTest;
    notifyListeners();
  }

  int diasSobrando() {
    final initDateParse = DateTime.parse(initController.text);
    final findDateParse = DateTime.parse(findController.text);
    final differenceTime = findDateParse.difference(initDateParse);

    return differenceTime.inDays;
  }

  double valorPagar() {
    double? diary = double.tryParse(selectedVehicle!.diaria);
    double value = (diary ?? 0) * diasSobrando();

    return value;
  }

  double comissaoGerente() {
    print('id do gerente = ${selectedClient!.gerenteId}');
    return 0;
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

  saveForm() {
    print('cliente');
    print(selectedClient!.razaoSocial);
    print(selectedClient!.cnpj);
    print('veiculo ');
    print(selectedVehicle!.marca);
    print(selectedVehicle!.modelo);
    print('Dias sobrando ');
    print(diasSobrando());
    print('cálculo dias com a diária ');
    print(valorPagar());
    comissaoGerente();
  }
}
