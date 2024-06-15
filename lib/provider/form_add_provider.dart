import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/client.dart';
import '../repositories/client_repository.dart';
import '../services/api_brasil.dart';

///[FormAddProvider] gerencia o formulário do client para 
///todas as classes que chamar ela.

class FormAddProvider with ChangeNotifier {
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
       var client =  Client(id:clientData.id,  cnpj: clientData.cnpj, razaoSocial: clientData.razaoSocial, 
        telefone: clientData.telefone, estado: clientData.estado, cidade: clientData.cidade);
        ClientRepository().insertClient(client);
        //fazer uma mensagem de sucesso ou falha e apos isso retornar a mesma tela de salvar clientes;
        //Limpar todos os campos apos ser inserido

        Navigator.pop(context);
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
  void cleanText(){
    cnpjController.clear();
    razaoSocialController.clear();
    telefoneController.clear();
    estadoController.clear();
    cidadeController.clear();

  }
}


