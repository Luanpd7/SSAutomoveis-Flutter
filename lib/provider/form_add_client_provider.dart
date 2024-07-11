import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/client.dart';
import '../routes/appRoutes.dart';
import '../services/api_brasil.dart';
import '../services/input_formatter.dart';
import 'client_provider.dart';

///[FormAddClientProvider] gerencia o formulário de adicionar
///do client para todas as classes que chamar ela.

class FormAddClientProvider with ChangeNotifier {
  final TextEditingController cnpjController = TextEditingController();
  final TextEditingController razaoSocialController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController cidadeController = TextEditingController();

  String? selectedEstado;
  List<String> estados = ['SC', 'SP', 'RJ', 'MG'];
  List<String> cidades = ['Blumenau', 'Gaspar', 'Indaial', 'Nova Russia'];

  Future<void> saveForm(BuildContext context) async {
    var maskFormatter = InputFormatter();

    final api = Provider.of<ApiBrasil>(context, listen: false);
    try {
      final clientData = await api
          .validateCNPJ(maskFormatter.removeCnpjMask(cnpjController.text));

            if (!validateForm(context)) {
      return;
    }

      if (clientData != null) {
        razaoSocialController.text = clientData.razaoSocial;
        telefoneController.text = clientData.telefone;
        estadoController.text = clientData.estado;
        cidadeController.text = clientData.cidade;
        var client = Client(
            id: clientData.id,
            dataRegistro: DateTime.now(),
            cnpj: maskFormatter.addCnpjMask(clientData.cnpj),
            razaoSocial: clientData.razaoSocial,
            telefone: maskFormatter.addPhoneMask(clientData.telefone),
            estado: clientData.estado,
            cidade: clientData.cidade);
        ClientProvider().addClient(client);

       
        final load = Provider.of<ClientProvider>(context, listen: false);
        load.select();
        cleanText();

        Navigator.popAndPushNamed(context, AppRoute.queryClients);
      }

      print('Validação concluída');
    } catch (error) {
      print('Erro durante a validação');
    }

    notifyListeners();
  }

   bool validateForm(BuildContext context) {
    if (cnpjController.text.isEmpty 
        ) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Todos os campos devem ser preenchidos')),
      );
      return false;
    }
    return true;
  }

  void setEstado(String? estado) {
    if (estados.contains(estado)) {
      selectedEstado = estado;
      notifyListeners();
    } else {
      print('Estado inválido: $estado');
    }
  }

  void cleanText() {
    cnpjController.clear();
    razaoSocialController.clear();
    telefoneController.clear();
    estadoController.clear();
    cidadeController.clear();
  }
}
