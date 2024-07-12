import 'package:flutter/material.dart';
import '../../c_rent/form_controller_rent.dart';

///[AddManagerScreen] é a tela responsável por adicionar clients

class AddRentScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Registrar Aluguel',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Container(
            height: 680,
            width: 380,
            decoration: BoxDecoration(
              color: Theme.of(context).hintColor,
              borderRadius: BorderRadius.circular(23),
            ),
            child: FormsControllerRent(
              isEditing: false,
            ),
          ),
        ),
      ),
    );
  }
}
