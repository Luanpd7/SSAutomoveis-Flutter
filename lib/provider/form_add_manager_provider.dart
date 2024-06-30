import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/manager.dart';
import '../routes/appRoutes.dart';
import 'manager_provider.dart';

///[FormAddManagerProvider] gerencia o formulário de adicionar
///do Manager para todas as classes que chamar ela.

class FormAddManagerProvider with ChangeNotifier {
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController percentualController = TextEditingController();

  Future<void> saveForm(BuildContext context) async {
    var manager = Manager(
        cpf: cpfController.text,
        dataRegistro: DateTime.now(),
        nome: nomeController.text,
        telefone: telefoneController.text,
        estado: estadoController.text,
        percentual: percentualController.text);

    ManagerProvider().addManager(manager);

    Provider.of<ManagerProvider>(context, listen: false).select();
    cleanText();
    Navigator.popAndPushNamed(context, AppRoute.queryManagers);
  }

  void cleanText() {
    print('limpando campos');
  }
}
