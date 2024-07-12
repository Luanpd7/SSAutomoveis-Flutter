import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/client.dart';
import '../client_provider.dart';


///[FormUpdateClientProvider] gerencia o formulário de editar 
///do client para todas as classes que chamar ela.

class FormUpdateClientProvider with ChangeNotifier {
  final TextEditingController cnpjController;
  final TextEditingController razaoSocialController;
  final TextEditingController telefoneController;
  final TextEditingController estadoController;
  final TextEditingController cidadeController;
  final int? id;

  FormUpdateClientProvider(Client client)
      : cnpjController = TextEditingController(text: client.cnpj),
        razaoSocialController = TextEditingController(text: client.razaoSocial),
        telefoneController = TextEditingController(text: client.telefone),
        estadoController = TextEditingController(text: client.estado),
        id = client.id,
        cidadeController = TextEditingController(text: client.cidade);

  Future<void> updateForm(BuildContext context) async {
    var clientProvider = ClientProvider();
    clientProvider.update(Client(
        id: this.id,
        cnpj: cnpjController.text,
        razaoSocial: razaoSocialController.text,
        telefone: telefoneController.text,
        estado: estadoController.text,
        cidade: cidadeController.text));

    final load = Provider.of<ClientProvider>(context, listen: false);
    load.select();
    Navigator.pop(context);

    notifyListeners();
  }
}
