import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/query_item.dart';
import '../components/query_item_icone.dart';
import '../models/client.dart';

///[QueryClientScreen] é a tela resposável pela consulta 
///completa de um cliente

class QueryClientScreen extends StatelessWidget {
  Client? client;

  QueryClientScreen ({this.client});

  @override
  Widget build(BuildContext context) {
    //
    //final client = ModalRoute.of(context)!.settings.arguments as Client;
    return Scaffold(
        appBar: AppBar(
          title: Text('teste' /*client.razaoSocial*/,
              style: Theme.of(context).textTheme.titleMedium),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: Theme.of(context).canvasColor,
        body: Center(
          child: Container(
            height: 650,
            width: 380,
            //  color: Colors.white,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
                  children: [
                    QueryItem(title: 'Razão Social', subtitle: 'Lince Tech Academy'),
                    QueryItem(title: 'Cidade', subtitle: 'Blumenau'),
                    QueryItem(title: 'Telefone', subtitle: '47 999999999'),
                    QueryItem(title: 'Data de Registro', subtitle: 'teste'),
                    QueryItemIcone(
                      icon: Icons.delete,
                    ),
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    QueryItem(title: 'CNPJ', subtitle: '111.1221.212.-323'),
                    QueryItem(title: 'Estado', subtitle: 'SC'),
                    QueryItem(title: 'Gerente', subtitle: 'Sandi'),
                     QueryItem(title: '', subtitle: ''),
                    QueryItemIcone(icon: Icons.edit),
                  ],
                ),
              ],
            ),
          ),
        ));
  }
}
