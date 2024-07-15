import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../models/rent.dart';
import '../../models/vehicle.dart';
import '../../models/client.dart';
import '../../models/manager.dart';
import '../../provider/rent_provider.dart';
import '../../repositories/rent_repository.dart';
import '../../routes/appRoutes.dart';
import '../list/build_list_tile.dart';
import '../list/build_list_vehicle.dart';

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
  bool? isRent;

  QueryItems({
    required this.list,
    this.isClient = false,
    this.isManager = false,
    this.isRent = false,
    this.isVehicle = false,
  });

  @override
  Widget build(BuildContext context) {
    RentRepository rentRepository = RentRepository();

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

          if (isRent!) {
            final rent = list[index] as Rent;

            return FutureBuilder<Map<String, dynamic>>(
              future: Future.wait([
                rentRepository.getVehicle(rent.vehicleId),
                rentRepository.getClient(rent.clientId),
              ]).then((results) {
                return {
                  'vehicle': results[0] as Vehicle,
                  'client': results[1] as Client,
                };
              }),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text('Erro ao carregar dados'));
                }

                final data = snapshot.data;
                if (data == null || data['vehicle'] == null || data['client'] == null) {
                  return Center(child: Text('Dados não encontrados'));
                }

                final vehicle = data['vehicle'] as Vehicle;
                final client = data['client'] as Client;

                return buildListTile(
                  context: context,
                  title: vehicle.modelo,
                  subtitle: client.razaoSocial,
                  onTap: () {
                    Navigator.of(context).pushNamed(
                      AppRoute.queryRent,
                      arguments: rent,
                    );
                  },
                );
              },
            );
          }

          if (isManager!) {
            final manager = list[index] as Manager;
            return buildListTile(
              context: context,
              title: manager.nome,
              subtitle: manager.cpf,
              onTap: () => Navigator.of(context).pushNamed(
                AppRoute.queryManager,
                arguments: manager,
              ),
            );
          }

          if (isVehicle!) {
            final vehicle = list[index] as Vehicle;
            return BuildListVehicle(
              vehicle: vehicle,
              onTap: () => Navigator.of(context).pushNamed(
                AppRoute.queryVehicle,
                arguments: vehicle,
              ),
            );
          }

          return Container(); // Retornar um container vazio se nenhuma condição for atendida
        },
      ),
    );
  }
}
