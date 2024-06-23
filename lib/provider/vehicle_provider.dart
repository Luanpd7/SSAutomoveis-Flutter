import 'package:flutter/material.dart';
import '../models/Vehicle.dart';
import '../repositories/vehicle_repository.dart';

/// [VehicleProvider] é um provider responsável por gerenciar o estado
/// relacionado a [Vehicle]. Ele utiliza o [ChangeNotifier] para notificar

class VehicleProvider with ChangeNotifier {
  ///utilizei select no construtor para garantir que assim for instânciado
  ///se atualiazado o select para pegar a lista de Veiculos atualizado

  var vehicleRepository = VehicleRepository();
  List<Vehicle> _list = [];

  List<Vehicle> get list => _list;
}
