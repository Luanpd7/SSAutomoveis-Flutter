import 'package:flutter/material.dart';
import 'routes/appRoutes.dart';
import 'screen/register_client.dart';
import 'screen/tabs_screen.dart';

/// Essa classe principal onde vai ser o começo de toda a aplicação onde será
/// tambem armazenado as configuraçoes das cores e fonte das telas.


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
        canvasColor:
            const Color.fromRGBO(241, 242, 233, 1.0), //Cor da tela de fundo
        textTheme: const TextTheme(
          titleMedium: TextStyle(
              fontSize: 20, color: Colors.white, fontFamily: 'inter.ttf'),
          titleSmall: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(134, 128, 128, 1.0),
              fontFamily: 'inter.ttf'),
          titleLarge: TextStyle(
              fontSize: 17,
              color: Color.fromRGBO(255, 87, 87, 1.0),
              fontFamily: 'inter.ttf'), //Fonte config
          bodyMedium: TextStyle(
              fontSize: 17,
              color: Colors.black,
              fontFamily: 'inter.ttf'), //Font config
          bodySmall: TextStyle(
              fontSize: 17,
              color: Color.fromRGBO(134, 128, 128, 1.0),
              fontFamily: 'inter.ttf'), //Font config
        ),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
            //Tema do bottomNavigationBarTheme
            backgroundColor: Colors.white,
            selectedItemColor: Colors.black,
            unselectedItemColor: Color.fromRGBO(134, 128, 128, 1.0)),
      ),
      routes: {
        AppRoute.HOME: (ctx) {
          return Builder(builder: (context) {
            return TabsScreen(); //local  trocar tela para desenvolvimento
          });
        },
        AppRoute.RegisterCliente: (context) => RegisterCliente(),
      },
    );
  }
}
