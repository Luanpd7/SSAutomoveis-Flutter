import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../models/client.dart';
import '../repositories/client_repository.dart';

class ClientProvider with ChangeNotifier{
  var clientRepository = ClientRepository();
  List<Client> list = [];
  
  void addClient(Client client){
     clientRepository.insertClient(client);
     notifyListeners();
  }

  Future<void> select() async {
   list = await clientRepository.load();
    notifyListeners();
  }
}