import 'package:flutter/material.dart';
import '../../models/manager.dart';
import '../manager_provider.dart';

///[FormUpdateManagerProvider] gerencia o formulário de editar
///do gerente para todas as classes que chamar ela.

class FormUpdateManagerProvider with ChangeNotifier {
  final TextEditingController cpfController;
  final TextEditingController nomeController;
  final TextEditingController telefoneController;

  final int? id;

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

  String? selectedEstado;
   String? selectedPercentual;

   setEstado(String? estado){
    if(estados.contains(estado)){
      selectedEstado = estado;
      notifyListeners();
    }
   }

   setPercentual(String? percentual){
    if(estados.contains(percentual)){
      selectedPercentual = percentual;
      notifyListeners();
    }
   }

  FormUpdateManagerProvider(Manager manager)
      : cpfController = TextEditingController(text: manager.cpf),
        nomeController = TextEditingController(text: manager.nome),
        telefoneController = TextEditingController(text: manager.telefone),
        
        selectedEstado = manager.estado,
        id = manager.id!,
        selectedPercentual = manager.percentual;

  Future<void> updateForm(BuildContext context) async {
    var managerProvider = ManagerProvider();
     

    managerProvider.update(Manager(
        id: this.id,
        cpf: cpfController.text,
        nome: nomeController.text,
        telefone: telefoneController.text,
        estado: selectedEstado!,
        //dataRegistro: DateTime.now(),
        percentual: selectedPercentual!));

       /*  final load = Provider.of<ManagerProvider>(context, listen: false);
         load.select();*/
         managerProvider.select();

   
   Navigator.pop(context);
  
    notifyListeners();
     
  }
}
