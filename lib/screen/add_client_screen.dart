import 'package:flutter/material.dart';
import '../clients/forms_controller_client.dart';

///[AddClientScreen] é a tela responsável por adicionar clientes

class AddClientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Cadastrar Cliente',
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
            child: FormsControllerClient(
              isEditing: false,
            ),
          ),
        ),
      ),
    );
  }
}
