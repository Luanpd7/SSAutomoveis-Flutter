import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'components/forms_add_client.dart';
import 'provider/client_provider.dart';
import 'provider/form_add_provider.dart';
import 'provider/form_register_provider.dart';
import 'routes/appRoutes.dart';
import 'screen/add_client_screen.dart';
import 'screen/home_screen.dart';
import 'screen/query_client.dart';
import 'screen/register_client_screen.dart';
import 'screen/tabs_screen.dart';
import 'services/api_brasil.dart';

/// Essa classe principal onde vai ser o começo de toda a aplicação onde será
/// tambem armazenado as configuraçoes das cores e fonte das telas.

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FormAddProvider()),
        ChangeNotifierProvider(create: (_) => FormsRegisterProvider()),
        ChangeNotifierProvider(create: (_) => ApiBrasil()),
        ChangeNotifierProvider(create: (_) => ClientProvider())

      ],
      child: MyApp(),
    ),
  );
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
              //App bar
              fontSize: 20,
              color: Colors.white,
              fontFamily: 'inter.ttf'),
          titleSmall: TextStyle(
              //home page
              fontSize: 20,
              color: Color.fromRGBO(134, 128, 128, 1.0),
              fontFamily: 'inter.ttf'),
          titleLarge: TextStyle(
              //configuraçoes e label
              fontSize: 17,
              color: Color.fromRGBO(255, 87, 87, 1.0),
              fontFamily: 'inter.ttf'),
          bodyMedium: TextStyle(
              //configuraçoes e label
              fontSize: 17,
              color: Colors.black,
              fontFamily: 'inter.ttf'),
          bodySmall: TextStyle(
              //configuraçoes e label
              fontSize: 17,
              color: Color.fromRGBO(134, 128, 128, 1.0),
              fontFamily: 'inter.ttf'),
          bodyLarge: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 17,
              color: Color.fromRGBO(134, 128, 128, 1.0),
              fontFamily: 'inter.ttf'),
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
            return HomeScreen(); //local  trocar tela para desenvolvimento
          });
        },
        AppRoute.registerCliente: (context) => RegisterClienteScreen(),
        AppRoute.addClient: (context) => AddClientScreen(),
        AppRoute.queryClient: (context) => QueryClient(),
      },
    );
  }
}
