import 'package:flutter/material.dart';

import '../components/forms_add_client.dart';

///[AddClientScreen] é a tela responsável por adicionar clients



class AddClientScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Cadastrar Cliente',
              style: Theme.of(context).textTheme.titleMedium),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: Theme.of(context).canvasColor,
        body: Center(
            child: Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            height: 680,
            width: 380,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(23)),
            child: FormsAddClient(),
          ),
        )));
  }
}
