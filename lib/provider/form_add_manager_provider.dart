import 'package:flutter/material.dart';

import '../models/manager.dart';
import '../repositories/manager_repository.dart';

class FormAddManagerProvider with ChangeNotifier {
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController percentualController = TextEditingController();

  Future<void> saveForm(BuildContext context) async {
    print('salvando');
    var manager = Manager(
        cpf: cpfController.text,
        nome: nomeController.text,
        telefone: telefoneController.text,
        estado: estadoController.text,
        percentual: percentualController.text);

    ManagerRepository().insertManager(manager);
  }

  void cleanText() {
    print('limpando campos');
  }
}
