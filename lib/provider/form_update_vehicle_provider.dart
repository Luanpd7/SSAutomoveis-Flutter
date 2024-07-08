import 'package:flutter/material.dart';
import '../models/vehicle.dart';
import 'vehicle_provider.dart';

class FormUpdateVehicleProvider with ChangeNotifier {
  final int? id;
  final TextEditingController marcaController;
  final TextEditingController modeloController;
   final TextEditingController placaController;
   final TextEditingController diariaController;
     final TextEditingController anoController;
      String? imagePath;



  FormUpdateVehicleProvider(Vehicle vehicle)
      : id = vehicle.id!,
        marcaController = TextEditingController(text: vehicle.marca),
        modeloController = TextEditingController(text: vehicle.modelo),
        placaController = TextEditingController(text: vehicle.placa),
        anoController = TextEditingController(text: vehicle.ano),
        diariaController = TextEditingController(text: vehicle.diaria),
        imagePath = vehicle.imagePath;


     Future<void> updateForm(BuildContext context, Vehicle vehicle) async {
    var vehicleProvider = VehicleProvider();

    vehicleProvider.update(Vehicle(
        id: this.id,
        marca: marcaController.text,
         
        modelo: modeloController.text,
        placa: placaController.text,
        ano: anoController.text,
        diaria: diariaController.text,
        imagePath: vehicle.imagePath));


  
         vehicleProvider.select();

   
   Navigator.pop(context);
  
    notifyListeners();
     
  }

  


     void cleanText() {
    marcaController.clear();
    modeloController.clear();
    placaController.clear();
    anoController.clear();
    diariaController.clear();
 
   
    notifyListeners();
  }
}
