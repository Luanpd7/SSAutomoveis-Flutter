import 'package:flutter/material.dart';

import '../models/client.dart';
import '../routes/appRoutes.dart';

/// [QueryItems] gerencia uma lista de objetos;
/// e exibe cada objeto em um container.
/// Utiliza um [ListView.builder] para construir a lista de forma eficiente.
/// Cada item da lista é um [ListTile] que, ao ser clicado,
/// navega para uma nova tela com mais detalhes do objeto [QueryClientScreen].

class QueryItems extends StatelessWidget {
  List<Client> list;

  QueryItems({required this.list});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 30),
      child: ListView.builder(
        scrollDirection: Axis.vertical,
        itemCount: list.length,
        itemBuilder: (context, index) {
          final client = list[index];

          return Padding(
            padding: const EdgeInsetsDirectional.only(
                start: 10, end: 10, bottom: 15),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        spreadRadius: 1,
                        offset: Offset.fromDirection(0, 5))
                  ]),
              width: double.infinity,
              height: 100,
              child: Center(
                child: ListTile(
                  title: Text(client.razaoSocial),
                  subtitle: Text(client.cnpj),
                  trailing: const Icon(Icons.arrow_forward_ios_sharp),
                  onTap: () => Navigator.of(context).pushNamed(
                    AppRoute.queryClient,
                    arguments: client,
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
