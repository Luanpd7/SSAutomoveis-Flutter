import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'dashboard_screen.dart';
import 'home_screen.dart';
import 'settings_screen.dart';

///Essa classe servirá para ser meu bottomNavigationBar
///utilizo a classe tabs_screen e home para ser
///minha classe para navegar entre elas.

class TabsScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _TabsScreeenState();
}

class _TabsScreeenState extends State<TabsScreen> {
  int currentPage = 0; //variavel para indicar o indice da página atual

  late PageController pg;

  void initState() {
    super.initState();
    pg = PageController(initialPage: 1);
  }

  setCurrentPage(int page) {
    setState(() {
      currentPage = page;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: PageView(
        controller: pg,
        onPageChanged: setCurrentPage,
        children: [
          DashboardScreen(),
          HomeScreen(),
          SettingsScreen(),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (pagina) {
          pg.animateToPage(
            pagina,
            duration: const Duration(microseconds: 400),
            curve: Curves.ease,
          );
        },
        backgroundColor:
            Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        selectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.selectedItemColor,
        unselectedItemColor:
            Theme.of(context).bottomNavigationBarTheme.unselectedItemColor,
        currentIndex: currentPage,
        items: [
            BottomNavigationBarItem(
            icon: const Icon(Icons.dashboard),
            label: 'Dashboard',
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.home_filled),
            label: AppLocalizations.of(context)!.menu,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.settings_sharp),
            label: AppLocalizations.of(context)!.settings,
          ),
        ],
      ),
    );
  }
}
