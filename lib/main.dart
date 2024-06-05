import 'package:flutter/material.dart';

import 'screen/menu.dart';
import 'screen/settings.dart';
import 'screen/tabs_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
         theme: ThemeData(
        primaryColor: const Color.fromRGBO(255, 87, 87, 1.0), //cor do appBar
         canvasColor: const Color.fromRGBO(241, 242, 233, 1.0), //Cor da tela de fundo
         textTheme: const TextTheme(titleMedium:  TextStyle(fontSize: 20, color: Colors.white, fontFamily: 'inter.ttf')),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData( //Tema do bottomNavigationBarTheme
          backgroundColor: Colors.white,
          selectedItemColor: Colors.black,
          unselectedItemColor: Color.fromRGBO(134, 128, 128, 1.0)
        ),
         ),
        home: TabsScreen(),
        
    );
    
  }
}



