import 'package:flutter/material.dart';

import '../models/client.dart';

class FormAddRentProvider with ChangeNotifier{
  final TextEditingController clientController = TextEditingController();
  final TextEditingController veiculoController = TextEditingController();
  final TextEditingController initController = TextEditingController();
  final TextEditingController findController = TextEditingController();

        List<String> clients = [''];
         List<String> vehicles = [''];
         
  String? selectedClient;

  void setClient(String? newClient) {
    selectedClient = newClient;
    notifyListeners();
  }

  void addClient(String client) {
    clients.add(client);
    notifyListeners();
  }

}