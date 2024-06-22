import 'package:flutter/material.dart';
import '../models/client.dart';
import '../repositories/client_repository.dart';

/// [ClientProvider] é um provider responsável por gerenciar o estado
/// relacionado a [Client]. Ele utiliza o [ChangeNotifier] para notificar

class ClientProvider with ChangeNotifier {
  ///utilizei select no construtor para garantir que assim for instânciado
  ///se atualiazado o select para pegar a lista de clientes atualizado
  ClientProvider() {
    select();
  }

  var clientRepository = ClientRepository();
  List<Client> _list = [];

  List<Client> get list => _list;

  void addClient(Client client) {
    clientRepository.insertClient(client);

    notifyListeners();
  }

  Future<void> select() async {
    _list = await clientRepository.load();
    notifyListeners();
  }

  Future<void> delete(Client client) async {
    clientRepository.delete(client.id!);
    select();

    print('removido');
    notifyListeners();
  }

  Future<void> update(Client client) async {
    clientRepository.updateClient(client);
    print('atualizado');
    select();
    notifyListeners();
  }
}
