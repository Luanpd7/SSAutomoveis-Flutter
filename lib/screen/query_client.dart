

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/client_provider.dart';


class QueryClient extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
          title: Text('Consultar Clientes',
              style: Theme.of(context).textTheme.titleMedium),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: Theme.of(context).canvasColor,
      body: Consumer<ClientProvider>(
        builder: (context, clientProvider, _) {
          return ListView.builder(
            itemCount: clientProvider.list.length,
            itemBuilder: (context, index) {
              final client = clientProvider.list[index];
              return ListTile(
                title: Text(client.razaoSocial),
                subtitle: Text(client.id.toString()),
                
              );
            },
          );
        },
      ),
    );
  }
}
