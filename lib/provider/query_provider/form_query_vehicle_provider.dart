import 'package:flutter/material.dart';

///[FormsQueryVehicleProvider] gerencia o formulário de consulta 
///do client para todas as classes que chamar ela.

class FormsQueryVehicleProvider with ChangeNotifier{
  final TextEditingController marcaController = TextEditingController();
  final TextEditingController modeloController = TextEditingController();
  final TextEditingController placaController = TextEditingController();
  final TextEditingController diariaController = TextEditingController();

    String? selectedYear;
     String? selectedDiary;


  List<String> anos = ['2018', '2015', '2013', '2011'];
  List<String> diarias = ['61,99 ', '50,29', '80,32', '55,21'];

  void setAno(String? ano) {
    if (anos.contains(ano)) {
      selectedYear = ano;
      notifyListeners();
    } else {
      print('Estado inválido: ');
    }
  }

  void setDiaria(String? diaria) {
    if (diarias.contains(diaria)) {
      selectedDiary = diaria;
      notifyListeners();
    } else {
      print('Estado inválido: ');
    }
  }
}