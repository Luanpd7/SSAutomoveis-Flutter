import 'package:flutter/material.dart';

///Essa classe será responsavel para ser a tela
///de registro do cliente, o usuário poderá 
///tanto cadastrar um novo cliente e também filtrar.


class RegisterCliente extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title:
              Text('Clientes', style: Theme.of(context).textTheme.titleMedium),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: Theme.of(context).canvasColor,
        body: Center(
          child: Container(
            height: 680,
            width: 380,
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(23)),
            child: Center(
              child: Column(
                children: [],
              ),
            ),
          ),
        ));
  }
}
