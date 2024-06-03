import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import 'menu.dart';
import 'settings.dart';



class TabsScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() => _TabsScreeenState();

}

class _TabsScreeenState extends State<TabsScreen>{
  int paginaAtual = 0;

  late PageController pg;

  void initState(){
    super.initState();
    pg = PageController(initialPage: paginaAtual);
  }


  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      body: PageView(
        controller: pg,
        children: [
          Menu(),
          settings(),
        ],
      ),
       bottomNavigationBar: BottomNavigationBar(

                onTap: (pagina) {pg.animateToPage(pagina, duration: Duration(microseconds: 400), curve: Curves.ease,);
                },
                backgroundColor: Theme.of(context).primaryColor,
                selectedItemColor: Theme.of(context).hintColor,
                unselectedItemColor: Theme.of(context).canvasColor,
                currentIndex: paginaAtual,
        items: const [
             BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Menu',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
      ),
    );
    
  }

}