import 'package:flutter/material.dart';
import '../clients/forms_controller_client.dart';
import '../models/client.dart';

class UpdateClientScreen extends StatelessWidget {
  UpdateClientScreen();
  @override
  Widget build(BuildContext context) {
    var client = ModalRoute.of(context)!.settings.arguments as Client;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Editar ${client.razaoSocial}',
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
              isEditing: true,
              client: client,
            ),
          ),
        ),
      ),
    );
  }
}
