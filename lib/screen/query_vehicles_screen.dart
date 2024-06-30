import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/query_items.dart';
import '../provider/vehicle_provider.dart';

///[QueryVehiclesScreen] é a tela resposável pela consulta
///de todos os gerentes

class QueryVehiclesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Consultar Veículos',
            style: Theme.of(context).textTheme.titleMedium),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Consumer<VehicleProvider>(
        builder: (context, vehiclesProvider, _) {
          if (vehiclesProvider.listBrand.isNotEmpty) {
            return QueryItems(
              list: vehiclesProvider.listBrand,
              isVehicle: true,
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
