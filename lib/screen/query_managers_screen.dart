import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/query_items.dart';
import '../provider/manager.provider.dart';

///[QueryManagersScreen] é a tela resposável pela consulta
///de todos os gerentes

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
      body: Consumer<ManagerProvider>(
        builder: (context, managerProvider, _) {
          return QueryItems(
            list: managerProvider.list,
            isClient: false,
          );
        },
      ),
    );
  }
}
