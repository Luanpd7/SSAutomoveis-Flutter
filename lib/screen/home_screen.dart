import 'package:flutter/material.dart';
import '../components/item_menu.dart';
import '../components/triangle_clipper.dart';
import '../routes/appRoutes.dart';

/// Essa classe será a tela da homePage

class HomeScreen extends StatelessWidget {
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
              padding: const EdgeInsets.all(65),
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
