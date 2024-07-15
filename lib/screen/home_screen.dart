import 'package:flutter/material.dart';
import '../components/item/item_menu.dart';
import '../components/triangle_clipper.dart';
import '../routes/appRoutes.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

/// Essa classe será a tela da homePage

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  label: AppLocalizations.of(context)!.costumers,
                  icon: const Icon(
                    Icons.people,
                    size: 48,
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, AppRoute.registerCliente);
                  },
                ),
                ItemMenu(
                    label: AppLocalizations.of(context)!.managers,
                    icon: const Icon(Icons.person_sharp, size: 48),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.registerManager);
                    }),
                ItemMenu(
                    label: AppLocalizations.of(context)!.rent,
                    icon: const Icon(Icons.car_rental_sharp , size: 54),
                    onTap: () {
                       Navigator.pushNamed(context, AppRoute.registerRent);
                    }),
                ItemMenu(
                    label: AppLocalizations.of(context)!.vehicles,
                    icon: const Icon(Icons.time_to_leave, size: 48),
                    onTap: () {
                      Navigator.pushNamed(context, AppRoute.registerVehicle);
                    })
              ],
            ),
          ),
        ],
      ),
    );
  }
}
