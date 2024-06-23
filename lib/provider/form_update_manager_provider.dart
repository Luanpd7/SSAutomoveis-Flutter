import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/manager.dart';
import 'manager_provider.dart';

///[FormUpdateManagerProvider] gerencia o formulário de editar
///do gerente para todas as classes que chamar ela.

class FormUpdateManagerProvider with ChangeNotifier {
  final TextEditingController cpfController;
  final TextEditingController nomeController;
  final TextEditingController telefoneController;
  final TextEditingController estadoController;
  final TextEditingController percentualController;
  final int? id;

  FormUpdateManagerProvider(Manager manager)
      : cpfController = TextEditingController(text: manager.cpf),
        nomeController = TextEditingController(text: manager.nome),
        telefoneController = TextEditingController(text: manager.telefone),
        estadoController = TextEditingController(text: manager.estado),
        id = manager.id!,
        percentualController = TextEditingController(text: manager.percentual);

  Future<void> updateForm(BuildContext context) async {
    var managerProvider = ManagerProvider();
    managerProvider.update(Manager(
        id: this.id,
        cpf: cpfController.text,
        nome: nomeController.text,
        telefone: telefoneController.text,
        estado: estadoController.text,
        percentual: percentualController.text));

    final load = Provider.of<ManagerProvider>(context, listen: false);
    load.select();
    Navigator.pop(context);

    notifyListeners();
  }
}
