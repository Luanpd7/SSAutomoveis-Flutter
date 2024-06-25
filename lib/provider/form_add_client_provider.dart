import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/client.dart';
import '../routes/appRoutes.dart';
import '../services/api_brasil.dart';
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
    final api = Provider.of<ApiBrasil>(context, listen: false);
    try {
      final clientData = await api.validateCNPJ(cnpjController.text);

      if (clientData != null) {
        razaoSocialController.text = clientData.razaoSocial;
        telefoneController.text = clientData.telefone;
        estadoController.text = clientData.estado;
        cidadeController.text = clientData.cidade;
        var client = Client(
            id: clientData.id,
            cnpj: clientData.cnpj,
            razaoSocial: clientData.razaoSocial,
            telefone: clientData.telefone,
            estado: clientData.estado,
            cidade: clientData.cidade);
        ClientProvider().addClient(client);

        //fazer uma mensagem de sucesso ou falha e apos isso retornar a mesma tela de salvar clientes;
        //Limpar todos os campos apos ser inserido
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
