import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../components/itemMenu.dart';
import '../components/triangleClipper.dart';
import '../routes/appRoutes.dart';

class Menu extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Widget050(),
          Expanded(
            child: GridView.count(
              shrinkWrap: true,
              crossAxisCount: 2,
              padding: EdgeInsets.all(65),
              crossAxisSpacing: 30,
              mainAxisSpacing: 15,
              children: [
                ItemMenu(
                  label: 'Clientes',
                  icon: const Icon(
                    Icons.people,
                    size: 48,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.RegisterCliente);
                  },
                ),
                ItemMenu(
                    label: 'Gerentes',
                    icon: const Icon(Icons.person_sharp, size: 48),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.RegisterCliente);
                    }),
                ItemMenu(
                    label: 'Gerentes',
                    icon: const Icon(Icons.people, size: 48),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.RegisterCliente);
                    }),
                ItemMenu(
                    label: 'Veiculos',
                    icon: const Icon(Icons.time_to_leave, size: 48),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.RegisterCliente);
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
