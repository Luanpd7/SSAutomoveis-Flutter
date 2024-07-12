import 'package:flutter/material.dart';

///[FormsQueryManagerProvider] gerencia o formulário de consulta 
///do client para todas as classes que chamar ela.

class FormsQueryManagerProvider with ChangeNotifier {
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController percentualController = TextEditingController();

  String? selectedEstado;

  List<String> estados = ['SC', 'SP', 'RJ', 'MG'];
  List<String> percentual = ['5%', '10%', '15%', '20%'];

  void setEstado(String? estado) {
    if (estados.contains(estado)) {
      selectedEstado = estado;
      notifyListeners();
    } else {
      print('Estado inválido: $estado');
    }
  }
}
