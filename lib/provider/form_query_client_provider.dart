import 'package:flutter/material.dart';

///[FormsQueryClientProvider] gerencia o formulário de consulta 
///do client para todas as classes que chamar ela.

class FormsQueryClientProvider with ChangeNotifier {
  final TextEditingController cnpjController = TextEditingController();
  final TextEditingController razaoSocialController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();

  String? selectedEstado;
  List<String> estados = ['SC', 'SP', 'RJ', 'MG'];
  List<String> cidades = ['Blumenau', 'Gaspar', 'Indaial', 'Nova Russia'];

  void setEstado(String? estado) {
    if (estados.contains(estado)) {
      selectedEstado = estado;
      notifyListeners();
    } else {
      print('Estado inválido: $estado');
    }
  }
}
