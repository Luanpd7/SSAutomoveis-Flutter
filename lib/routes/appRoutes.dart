import 'package:flutter/material.dart';
import 'package:ss_automveis/screen/register_rent_screen.dart';
import '../models/client.dart';
import '../models/manager.dart';
import '../models/vehicle.dart';
import '../screen/add_client_screen.dart';
import '../screen/add_manager_screen.dart';
import '../screen/add_rent_screen.dart';
import '../screen/add_vehicle_screen.dart';
import '../screen/privacy_policy_screen.dart';
import '../screen/query_client_screen.dart';
import '../screen/query_clients_screen.dart';
import '../screen/query_manager_screen.dart';
import '../screen/query_managers_screen.dart';
import '../screen/query_vehicle_screen.dart';
import '../screen/query_vehicles_screen.dart';
import '../screen/register_client_screen.dart';
import '../screen/register_manager_screen.dart';
import '../screen/register_vehicle_screen.dart';
import '../screen/tabs_screen.dart';
import '../screen/update_client_screen.dart';
import '../screen/update_manager_screen.dart';

///Classe que contém os nomes das rotas
///que servirá para deixar as rotas de navegações
///mais seguras e organizadas

class AppRoute {
  static const HOME = '/';
  static const registerCliente = '/RegisterCliente';
  static const addClient = '/AddClientScreen';
  static const queryClients = '/QueryClientsScreen';
  static const queryClient = '/QueryClientScreen';
  static const updateClient = '/UpdateClientScreen';
  static const registerManager = '/RegisterManagerScreen';
  static const queryManagers = '/QueryManagersScreen';
  static const queryManager = '/QueryManagerScreen';
  static const addManager = '/AddManagerScreen';
  static const updateManager = '/UpdateManagerScreen';
  static const registerVehicle = '/RegisterVehicleScreen';
  static const queryVehicle = '/QueryVehicleScreen';
  static const registerRent = '/RegisterRentScreen';
  static const addRent = '/AddRentScreen';
  static const addVehicle = '/AddVehicleScreen';
  static const queryVehicles = '/QueryVehiclesScreen';
  static const privacyPolicy = '/PrivacyPolicy';

  Map<String, Widget Function(BuildContext)> routes() {
    return {
      AppRoute.HOME: (ctx) {
        return Builder(builder: (context) {
          return TabsScreen(); //local  trocar tela para desenvolvimento
        });
      },
      AppRoute.registerCliente: (context) => RegisterClienteScreen(),
      AppRoute.registerRent: (context) => RegisterRentScreen(),
      AppRoute.queryManagers: (context) => QueryManagersScreen(),
      AppRoute.addManager: (context) => AddManagerScreen(),
      AppRoute.addRent: (context) => AddRentScreen(),

      AppRoute.privacyPolicy: (context) => PrivacyPolicy(),
      AppRoute.addClient: (context) => AddClientScreen(),
      AppRoute.queryClients: (context) => QueryClientsScreen(),
      AppRoute.updateClient: (context) => UpdateClientScreen(),
      AppRoute.updateManager: (context) => UpdateManagerScreen(),
      AppRoute.registerManager: (context) => RegisterManagerScreen(),
      AppRoute.registerVehicle: (context) => RegisterVehicleScreen(),
      AppRoute.addVehicle: (context) => AddVehicleScreen(),
      AppRoute.queryVehicles: (context) => QueryVehiclesScreen(),
      AppRoute.queryClient: (context) {
        final client = ModalRoute.of(context)!.settings.arguments as Client;
        return QueryClientScreen(
          client: client,
        );
      },
      AppRoute.queryManager: (context) {
        final manager = ModalRoute.of(context)!.settings.arguments as Manager;
        return QueryManagerScreen(manager: manager);
      },

       AppRoute.queryVehicle: (context) {
        final vehicle = ModalRoute.of(context)!.settings.arguments as Vehicle;
        return QueryVehicleScreen(vehicle: vehicle,);
      }
    };
  }
}
