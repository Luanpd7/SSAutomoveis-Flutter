import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/manager.dart';
import '../../routes/appRoutes.dart';
import '../manager_provider.dart';

///[FormAddManagerProvider] gerencia o formulário de adicionar
///do Manager para todas as classes que chamar ela.

class FormAddManagerProvider with ChangeNotifier {
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  

  List<String> estados = [
    "RS", "SC", "PR", "SP", "RJ",
    "ES","MG","MS","GO","MT","DF",
    "BA","SE","AL","PE","PB","RN",
    "CE","PI","MA","PA","TO","RO",
    "AC","AM","RR","AP"
  ];
  List<String> percentuais = [
    '10','20','30','40','50','60',
    '70','80','90'
  ];

  String? selectedEstado ;
   String? selectedPercentual;

   setEstado(String? estado){
    if(estados.contains(estado)){
      selectedEstado = estado;
      notifyListeners();
    }
   }

   setPercentual(String? percentual){
    if(percentuais.contains(percentual)){
      selectedPercentual = percentual;
      notifyListeners();
    }
   }

  Future<void> saveForm(BuildContext context) async {
     if (!validateForm(context)) {
      return;
    }

    var manager = Manager(
        cpf: cpfController.text,
        dataRegistro: DateTime.now(),
        nome: nomeController.text,
        telefone: telefoneController.text,
        estado: selectedEstado!,
        percentual: selectedPercentual!);

    ManagerProvider().addManager(manager);
  
    Provider.of<ManagerProvider>(context, listen: false).select();
    cleanText();
    Navigator.popAndPushNamed(context, AppRoute.queryManagers);
  }

    bool validateForm(BuildContext context) {
    if (cpfController.text.isEmpty ||
        nomeController.text.isEmpty ||
        telefoneController.text.isEmpty ||
        selectedEstado == null ||
        selectedPercentual == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Todos os campos devem ser preenchidos')),
      );
      return false;
    }
    return true;
  }

  void cleanText() {
    cpfController.clear();
    nomeController.clear();
    telefoneController.clear();
    selectedEstado == null;
    selectedPercentual == null;
  }
}
