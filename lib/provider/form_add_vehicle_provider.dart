import 'package:flutter/material.dart';

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
}
