import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../components/query/query_items.dart';
import '../../provider/rent_provider.dart';



///[QueryRentsScreen] é a tela resposável pela consulta
///de todos os gerentes

class QueryRentsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultar Aluguel',
            style: Theme.of(context).textTheme.titleMedium),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Consumer<RentProvider>(
        builder: (context, rentProvider, _) {
           if (rentProvider.isLoading == true) {
            return const Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CircularProgressIndicator(),
                SizedBox(
                  height: 5,
                ),
                Text('Carregando...'),
              ],
            ));
          }
         else if (rentProvider.listRent.isNotEmpty) {
            return QueryItems(
              list: rentProvider.listRent,
              isRent: true,
            );
          } else {
            return const Center(
              child: Text('Nenhum Veículo Cadastrado!'),
            );
          }
        },
      ),
    );
  }
}