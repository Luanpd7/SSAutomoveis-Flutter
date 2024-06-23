import '../models/vehicle.dart';

/// [VehicleRepository] é responsável por gerenciar a persistência dos dados
/// da entidade [Vehicle] no banco de dados.
///
class VehicleRepository {
  final List<Vehicle> _listVehicle = [];

  List<Vehicle> get listVehicle => _listVehicle;
}
