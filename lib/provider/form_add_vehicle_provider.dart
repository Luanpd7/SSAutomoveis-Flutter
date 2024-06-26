

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'form_query_client_provider.dart';

class FormAddVehicleProvider with ChangeNotifier {
  final TextEditingController marcaController = TextEditingController();
  final TextEditingController modeloController = TextEditingController();
  final TextEditingController placaController = TextEditingController();
  final TextEditingController anoController = TextEditingController();
  final TextEditingController diariaController = TextEditingController();

  cleanText() {
    marcaController.clear();
    modeloController.clear();
    placaController.clear();
    anoController.clear();
    diariaController.clear();
  }
  
    String? selectedMarca;
    String? selectedModelo;
    String? selectedAno;


  List<String> marcas = ['Volkswagen', 'Chevrolet', 'Hyundai', 'Peugeot','Fiat','Toyota'];
  List<String> modelos = [];
  List<String> anos = [];

  void setMarca(String? marca) {
    if (marcas.contains(marca)) {
      selectedMarca = marca;
      notifyListeners();
    } else {
      print('Estado inválido: ');
    }
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
}
