import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/client.dart';
import '../repositories/client_repository.dart';
import 'client_provider.dart';

class FormUpdateProvider with ChangeNotifier {




  final TextEditingController cnpjController;
  final TextEditingController razaoSocialController;
  final TextEditingController telefoneController;
  final TextEditingController estadoController;
  final TextEditingController cidadeController;
  final int? id ;

  FormUpdateProvider(Client client)
      : cnpjController = TextEditingController(text: client.cnpj),
        razaoSocialController = TextEditingController(text: client.razaoSocial),
        telefoneController = TextEditingController(text: client.telefone),
        estadoController = TextEditingController(text: client.estado),
        id = client.id,
        cidadeController = TextEditingController(text: client.cidade);


  Future<void> updateForm(BuildContext context) async {
    var clientRepository = ClientRepository();
    print('antes = ${cidadeController}');
    clientRepository.updateClient(Client(
      
        id: this.id,
        cnpj: cnpjController.text,
        razaoSocial: razaoSocialController.text,
        telefone: telefoneController.text,
        estado: estadoController.text,
        cidade: cidadeController.text));
         print('depois = ${cidadeController}');
         final load = Provider.of<ClientProvider>(context, listen: false);
           load.select();

            Navigator.pop(context); 
           

    notifyListeners();
  }
}


/*Passar por argumento : 
 Navigator.of(context).pushNamed(AppRoute.queryClient, arguments: client,),
*/ 