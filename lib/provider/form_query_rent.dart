import 'package:flutter/material.dart';

///[FormsQueryManagerProvider] gerencia o formulário de consulta 
///do client para todas as classes que chamar ela.

class FormsQueryRentProvider with ChangeNotifier {
  final TextEditingController clientController = TextEditingController();
  final TextEditingController veiculoController = TextEditingController();
  final TextEditingController initController = TextEditingController();
  final TextEditingController findController = TextEditingController();


  String? selectedEstado;

  List<String> clients = ['Lince', 'Philips', 'AutoCar', 'Prefeitura'];
  List<String> vehicles = ['Cruze', 'Sonata', 'Volkswagen', 'Montana'];


}
