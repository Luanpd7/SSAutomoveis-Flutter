import 'package:flutter/material.dart';

import '../../models/client.dart';
import '../../models/vehicle.dart';

class FormAddRentProvider with ChangeNotifier {
  final TextEditingController clientController = TextEditingController();
  final TextEditingController veiculoController = TextEditingController();
  final TextEditingController initController = TextEditingController();
  final TextEditingController findController = TextEditingController();

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

  saveForm(){
    print(selectedClient!.razaoSocial);
        print(selectedClient!.cnpj);
          print(selectedClient!.gerenteId);
    print(selectedVehicle!.diaria);
  }
}
