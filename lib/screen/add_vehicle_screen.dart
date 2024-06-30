import 'package:flutter/material.dart';

import '../c_vehicle/form_controller_vehicle.dart';

///[AddVehicleScreen] é a tela responsável por adicionar veículos

class AddVehicleScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Cadastrar Veículos',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(18),
          child: Container(
            height: 748,
            width: 380,
            decoration: BoxDecoration(
              color: Theme.of(context).hintColor,
              borderRadius: BorderRadius.circular(23),
            ),
            child: FormsControllerVehicle(
              isEditing: false,
            ),
          ),
        ),
      ),
    );
  }
}
