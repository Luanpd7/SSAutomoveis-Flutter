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
        primaryColor: Color.fromRGBO(255, 87, 87, 1.0),
        canvasColor: Color.fromRGBO(241, 242, 233, 1.0),),
        home: TabsScreen(),
    );
    
  }
}



