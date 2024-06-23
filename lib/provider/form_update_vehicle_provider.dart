import 'package:flutter/material.dart';
import '../models/vehicle.dart';

class FormUpdateVehicleProvider with ChangeNotifier {
  final int? id;
  final TextEditingController marcaController;
  final TextEditingController modeloController;
  final TextEditingController placaController;
  final TextEditingController anoController;
  final TextEditingController diariaController;

  FormUpdateVehicleProvider(Vehicle vehicle)
      : id = vehicle.id!,
        marcaController = TextEditingController(text: vehicle.marca),
        modeloController = TextEditingController(text: vehicle.modelo),
        placaController = TextEditingController(text: vehicle.placa),
        anoController = TextEditingController(text: vehicle.ano),
        diariaController = TextEditingController(text: vehicle.diaria);
}
