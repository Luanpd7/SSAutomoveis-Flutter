import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/client.dart';
import '../client_provider.dart';

///[FormsQueryManagerProvider] gerencia o formulário de consulta 
///do client para todas as classes que chamar ela.

class FormsQueryRentProvider with ChangeNotifier {
  final TextEditingController clientController = TextEditingController();
  final TextEditingController veiculoController = TextEditingController();
  final TextEditingController initController = TextEditingController();
  final TextEditingController findController = TextEditingController();


  String? selectedEstado;


    List<Client>? clients = [];

Future<void> obterListClient(BuildContext context) async{
     clients =  Provider.of<ClientProvider>(context, listen: false).list;
     
}



  

  List<String> vehicles = ['Cruze', 'Sonata', 'Volkswagen', 'Montana'];


}
