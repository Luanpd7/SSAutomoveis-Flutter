import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';
import 'package:ss_automveis/components/chart.dart';
import 'package:ss_automveis/provider/client_provider.dart';
import 'package:ss_automveis/provider/vehicle_provider.dart';

import '../components/dashboard_item.dart';
import '../provider/manager_provider.dart';

class DashboardScreen extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {

    final numberClients = Provider.of<ClientProvider>(context).returnLenght();
    final numberManagers =  Provider.of<ManagerProvider>(context).returnLenght();
    final numberVehicles =  Provider.of<VehicleProvider>(context).returnLenght();
   


    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Dashboard',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      body: Consumer<ClientProvider>(
        builder: (BuildContext context, ClientProvider value, Widget? child) {  
          
        return Column(
          children: [
            Chart(
              vehicleCount: numberVehicles.toDouble(),
              clientCount: numberClients.toDouble(),
              rentCount: 0,
              managerCount: numberManagers.toDouble(),
            ),
            SizedBox(height: 20,),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: GridView.count(
                  crossAxisCount: 2,
                  crossAxisSpacing: 15,
                  mainAxisSpacing: 15,
                  children: [
                   DashboardItem(label: 'Clientes',listLenght: numberClients),
                    DashboardItem(label: 'Gerentes',listLenght: numberManagers),
                     DashboardItem(label: 'Veículos',listLenght: numberVehicles),
                      DashboardItem(label: 'Aluguéis',listLenght: 0),
                  ],
                ),
              ),
            ),
          ],
        );
        }
      ),
    );
  }
}
