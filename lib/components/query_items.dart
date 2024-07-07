import 'package:flutter/material.dart';
import '../models/vehicle.dart';
import '../models/client.dart';
import '../models/manager.dart';
import '../routes/appRoutes.dart';
import 'build_list_tile.dart';
import 'build_list_vehicle.dart';

/// [QueryItems] gerencia uma lista de objetos de forma boleana;
/// que se for recebido como true sera fornecido uma lista de cliente
/// se não de gerentes
/// e exibe cada objeto em um container.
/// Utiliza um [ListView.builder] para construir a lista de forma eficiente.
/// Cada item da lista é um [ListTile] que, ao ser clicado,
/// navega para uma nova tela com mais detalhes do objeto ['QueryClientScreen']
/// ou ['QueryManagerScreen'].

// ignore: must_be_immutable
class QueryItems extends StatelessWidget {
  List<Object> list;
  bool? isClient;
  bool? isManager;
  bool? isVehicle;

  QueryItems(
      {required this.list,
      this.isClient = false,
      this.isManager = false,
      this.isVehicle = false});

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
          if (isClient!) {
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
          }
          if (isManager!) {
            final manager = list[index] as Manager;
            return buildListTile(
                context: context,
                title: manager.nome,
                subtitle: manager.cpf,
                onTap: () {
                  Navigator.of(context)
                      .pushNamed(AppRoute.queryManager, arguments: manager);
                });
          }
          if (isVehicle!) {
            final vehicle = list[index] as Vehicle;

            return BuildListVehicle(
              vehicle: vehicle,
               onTap: () {
                 Navigator.of(context)
                      .pushNamed(AppRoute.queryVehicle, arguments: vehicle);

                     
                      
                });
          }
          return null;
        },
      ),
    );
  }
}
