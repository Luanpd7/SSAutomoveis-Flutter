import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

import '../components/query_item.dart';
import '../components/query_item_icone.dart';
import '../models/client.dart';
import '../provider/client_provider.dart';
import '../routes/appRoutes.dart';

///[QueryClientScreen] é a tela resposável pela consulta
///completa de um cliente

class QueryClientScreen extends StatelessWidget {
  QueryClientScreen({required this.client});

  Client client;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('teste' /*client.razaoSocial*/,
            style: Theme.of(context).textTheme.titleMedium),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Consumer<ClientProvider>(
        builder: (context, clientState, _) {
          var list = clientState.list;
          return Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QueryItem(
                        title: 'Razão Social',
                        subtitle: client.razaoSocial ?? '',
                      ),
                      QueryItem(title: 'Cidade', subtitle: client.cidade),
                      QueryItem(title: 'Telefone', subtitle: client.telefone),
                      QueryItem(title: 'Data de Registro', subtitle: 'teste'),
                      QueryItemIcone(
                        icon: Icons.delete,
                        onTap: () async {
                          await clientState.delete(
                          client,
                        );
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      QueryItem(title: 'CNPJ', subtitle: client.cnpj),
                      QueryItem(title: 'Estado', subtitle: client.estado),
                      QueryItem(title: 'Gerente', subtitle: client.id.toString()
                      ),
                      QueryItem(title: '', subtitle: ''),
                      QueryItemIcone(
                        icon: Icons.edit,
                        onTap: () async {
                          await clientState.update(client);
                          Navigator.pushNamed(context, AppRoute.updateClient);
                        }


                      ),

                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
