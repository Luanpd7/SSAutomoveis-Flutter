import 'package:flutter/material.dart';

import '../models/client.dart';
import '../models/manager.dart';
import '../routes/appRoutes.dart';
import 'build_list_tile.dart';

/// [QueryItems] gerencia uma lista de objetos de forma boleana;
/// que se for recebido como true sera fornecido uma lista de cliente
/// se não de gerentes
/// e exibe cada objeto em um container.
/// Utiliza um [ListView.builder] para construir a lista de forma eficiente.
/// Cada item da lista é um [ListTile] que, ao ser clicado,
/// navega para uma nova tela com mais detalhes do objeto [QueryClientScreen]
/// ou [QueryManagerScreen].

class QueryItems extends StatelessWidget {
  List<Object> list;
  
  bool isClient;

  QueryItems({required this.list, required this.isClient});

  //oque pode ser passado por parametro?
  //ao inves de passsar a lista, passar razão social e cnpj
  //ou nome e cpf

@override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        itemBuilder: (context, index) {
          if (isClient) {
            final client = list[index] as Client;
            return buildListTile(
              context: context,
              title: client.razaoSocial,
              subtitle: client.cnpj,
              onTap: () => Navigator.of(context).pushNamed(
                AppRoute.queryClient,
                arguments: client,
              ),
            );
          } else {
            final manager = list[index] as Manager;
            return buildListTile(
              context: context,
              title: manager.nome,
              subtitle: manager.cpf,
              onTap: () {}
        //      Navigator.of(context).pushNamed( AppRoute.queryManager, arguments: manager,),
            );
          }
        },
      ),
    );
  }  
  }