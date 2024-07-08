import 'package:flutter/material.dart';
import '../c_vehicle/form_update_vehicle.dart';
import '../models/vehicle.dart';

class UpdateVehicleScreen extends StatelessWidget {
  UpdateVehicleScreen();
  @override
  Widget build(BuildContext context) {
    var vehicle = ModalRoute.of(context)!.settings.arguments as Vehicle;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Editar ',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            height: 680,
            width: 380,
            decoration: BoxDecoration(
              color: Theme.of(context).hintColor,
              borderRadius: BorderRadius.circular(23),
            ),
            child: FormsUpdateControllerVehicle(
      
              vehicle: vehicle,
            ),
          ),
        ),
      ),
    );
  }
}
