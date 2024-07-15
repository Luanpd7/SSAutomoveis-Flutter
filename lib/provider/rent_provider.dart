import 'package:flutter/foundation.dart';


import '../models/rent.dart';
import '../models/vehicle.dart';
import '../repositories/rent_repository.dart';

class RentProvider with ChangeNotifier{
  var rentRepository = RentRepository();

   List<Rent> _list = [];

  List<Rent> get listRent => _list;

  bool? isLoading;

    RentProvider(){
    select();
  }
  
  Future<void> addRent(Rent rent) async {
    rentRepository.insertRent(rent);
    notifyListeners();
  }


   Future<void> select() async {
    isLoading = true;
    _list  = await rentRepository.load();
    print('tamanho lista ${_list.length}');
    notifyListeners();
    await Future.delayed(Duration(seconds: 1));
    isLoading = false;
    notifyListeners();
  }


}