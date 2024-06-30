import 'package:flutter/material.dart';
import '../models/manager.dart';
import '../repositories/manager_repository.dart';

/// [ManagerProvider] é um provider responsável por gerenciar o estado
/// relacionado a [Manager]. Ele utiliza o [ChangeNotifier] para notificar

class ManagerProvider with ChangeNotifier {
  var managerRepository = ManagerRepository();
  List<Manager> _list = [];
  bool? isLoading;
 

  ManagerProvider() {
    select();
  }

  List<Manager> get list => _list;
   

  void addManager(Manager manager) {
    print('manager = ${manager}');
    managerRepository.insertManager(manager);
    print(list);

      

    notifyListeners();
  }

  Future<void> select() async {
    _list = await managerRepository.load();
    isLoading = true;
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    isLoading = false;
    notifyListeners();
    
  }

  Future<void> delete(Manager manager) async {
    managerRepository.delete(manager.id!);
    select();

    print('removido');
    notifyListeners();
  }

  Future<void> update(Manager manager) async {
    managerRepository.updateManager(manager);
    print('atualizado');
    select();
    notifyListeners();
  }
}
