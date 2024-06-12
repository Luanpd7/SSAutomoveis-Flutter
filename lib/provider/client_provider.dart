import 'package:flutter/material.dart';
import '../models/client.dart';
import '../repositories/client_repository.dart';

class ClientProvider with ChangeNotifier{
   

   ///utilizei select no construtor para garantir que assim for instânciado 
   ///se atualiazado o select para pegar a lista de clientes atualizado
   ClientProvider(){
    select();
   }


  var clientRepository = ClientRepository();
  List<Client> _list = [];

  List<Client> get list => _list;
  
  void addClient(Client client){
     clientRepository.insertClient(client);
     notifyListeners();
  }

  

  Future<void> select() async {
   _list = await clientRepository.load();
    notifyListeners();
  }
}