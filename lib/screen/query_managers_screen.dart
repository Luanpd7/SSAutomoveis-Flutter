import 'package:flutter/material.dart';

class QueryManagersScreen extends StatelessWidget {
  const QueryManagersScreen({super.key});

   @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultar Gerentes',
            style: Theme.of(context).textTheme.titleMedium),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).canvasColor,
    /*  body: Consumer<ClientProvider>(
        builder: (context, clientProvider, _) {
          return QueryItems(
            list: clientProvider.list,
          );
        },
      ),*/
    );
  }
}