import 'package:flutter/material.dart';
import '../c_vehicle/forms_query_vehicle.dart';

///Essa classe será responsavel para ser a tela
///de registro do cliente, o usuário poderá
///tanto cadastrar um novo cliente e também filtrar.

class RegisterVehicleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Veículos',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
                height: 680,
                width: 380,
                decoration: BoxDecoration(
                    color: Theme.of(context).hintColor,
                    borderRadius: BorderRadius.circular(23)),
                child: FormsQueryVehicle()),
          ),
        ),
      ),
    );
  }
}
