import 'dart:io';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../components/query_item.dart';
import '../components/query_item_icone.dart';
import '../models/vehicle.dart';
import '../provider/vehicle_provider.dart';
import '../routes/appRoutes.dart';

///[QueryManagerScreen] é a tela resposável pela consulta
///geral de um gerente, sendo passado o cliente pelo construtor

// ignore: must_be_immutable
class QueryVehicleScreen extends StatelessWidget {
  QueryVehicleScreen({required this.vehicle});

  Vehicle vehicle;

  @override
  Widget build(BuildContext context) {
    String _formatDateToBrasilia(DateTime date) {
      final DateTime dateTimeInBrasilia = date.toUtc().add(Duration(hours: -3));
      return DateFormat('dd/MM/yyyy HH:mm').format(dateTimeInBrasilia);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(vehicle.modelo,
            style: Theme.of(context).textTheme.titleMedium),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Consumer<VehicleProvider>(
        builder: (context, vehicleState, _) {
          vehicleState.select();
          return Column(
            children: [
              Container(
                height: 300,
                width: double.infinity,
                child: Image.file(
                  File(vehicle.imagePath),
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                   
                      height: 450,
                      width: 180,
                      child: Column(
                         mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          QueryItem(
                            title: 'Marca',
                            subtitle: vehicle.marca,
                          ),
                          QueryItem(title: 'Placa', subtitle: vehicle.placa),
                          QueryItem(
                              title: 'Data de Registro', subtitle: "teste"),
                          QueryItemIcone(
                            icon: Icons.delete,
                            onTap: () async {
                               await vehicleState.delete(
                                vehicle,
                              );
                              Navigator.pop(context);
                            },
                          ),
                        ],
                      ),
                    ),
                    Container(
                        height: 450,
                      width: 180,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          QueryItem(title: 'Modelo', subtitle: vehicle.modelo),
                          QueryItem(title: 'Ano', subtitle: vehicle.ano),
                          QueryItem(
                              title: 'Diária',
                              subtitle: '${vehicle.diaria}/dia'),
                          QueryItemIcone(
                              icon: Icons.edit, onTap: () {
                                Navigator.of(context).pushNamed(
                              AppRoute.updateVehicle,
                              arguments: vehicle,
                            );
                              }
                              
                              ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
