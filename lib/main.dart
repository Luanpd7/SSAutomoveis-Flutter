import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'models/client.dart';
import 'provider/client_provider.dart';
import 'provider/form_add_client_provider.dart';
import 'provider/form_add_manager_provider.dart';
import 'provider/form_query_client_provider.dart';
import 'provider/form_query_manager_provider.dart';
import 'routes/appRoutes.dart';
import 'screen/add_client_screen.dart';
import 'screen/add_manager_screen.dart';
import 'screen/query_client_screen.dart';
import 'screen/query_clients_screen.dart';
import 'screen/query_managers_screen.dart';
import 'screen/register_client_screen.dart';
import 'screen/register_manager_screen.dart';
import 'screen/tabs_screen.dart';
import 'screen/update_client_screen.dart';
import 'services/api_brasil.dart';

/// Essa classe principal onde vai ser o começo de toda a aplicação onde será
/// tambem armazenado as configuraçoes das cores e fonte das telas.

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FormAddClientProvider()),
        ChangeNotifierProvider(create: (_) => FormAddManagerProvider()),
        // ChangeNotifierProvider(create: (_) => FormUpdateProvider()),
        ChangeNotifierProvider(create: (_) => FormsQueryClientProvider()),
        ChangeNotifierProvider(create: (_) => FormsQueryManagerProvider()),
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
      debugShowCheckedModeBanner: false,
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
          headlineSmall: TextStyle(
              fontWeight: FontWeight.w600,
              fontSize: 19,
              color: Color.fromRGBO(255, 87, 87, 1.0),
              fontFamily: 'inter.ttf'),
          headlineMedium: TextStyle(
              fontSize: 19, color: Colors.black, fontFamily: 'inter.ttf'),
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
        AppRoute.registerCliente: (context) => RegisterClienteScreen(),
        AppRoute.queryManagers: (context) => QueryManagersScreen(),
        AppRoute.addManager: (context) => AddManagerScreen(),
        AppRoute.addClient: (context) => AddClientScreen(),
        AppRoute.queryClients: (context) => QueryClientsScreen(),
        AppRoute.updateClient: (context) => UpdateClientScreen(),
        AppRoute.registerManager: (context) => RegisterManagerScreen(),
        AppRoute.queryClient: (context) {
          final client = ModalRoute.of(context)!.settings.arguments as Client;
          return QueryClientScreen(
            client: client,
          );
        }
      },
    );
  }
}
