import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';

import 'models/client.dart';
import 'models/manager.dart';
import 'provider/client_provider.dart';
import 'provider/form_add_client_provider.dart';
import 'provider/form_add_manager_provider.dart';
import 'provider/form_add_vehicle_provider.dart';
import 'provider/form_query_client_provider.dart';
import 'provider/form_query_manager_provider.dart';
import 'provider/form_query_vehicle_provider.dart';
import 'provider/image_picker_provider.dart';
import 'provider/language_provider.dart';
import 'provider/manager_provider.dart';
import 'provider/settings_provider.dart';
import 'provider/vehicle_provider.dart';
import 'routes/appRoutes.dart';
import 'screen/add_client_screen.dart';
import 'screen/add_manager_screen.dart';
import 'screen/add_vehicle_screen.dart';
import 'screen/privacy_policy_screen.dart';
import 'screen/query_client_screen.dart';
import 'screen/query_clients_screen.dart';
import 'screen/query_manager_screen.dart';
import 'screen/query_managers_screen.dart';
import 'screen/query_vehicles_screen.dart';
import 'screen/register_client_screen.dart';
import 'screen/register_manager_screen.dart';
import 'screen/register_vehicle_screen.dart';
import 'screen/tabs_screen.dart';
import 'screen/update_client_screen.dart';
import 'screen/update_manager_screen.dart';
import 'services/api_brasil.dart';

/// Essa classe principal onde vai ser o começo de toda a aplicação onde será
/// tambem armazenado as configuraçoes das cores e fonte das telas.

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => FormAddClientProvider()),
        ChangeNotifierProvider(create: (_) => FormAddManagerProvider()),
        ChangeNotifierProvider(create: (_) => FormAddVehicleProvider()),
        ChangeNotifierProvider(create: (_) => FormsQueryVehicleProvider()),
        ChangeNotifierProvider(create: (_) => FormsQueryClientProvider()),
        ChangeNotifierProvider(create: (_) => FormsQueryManagerProvider()),
        ChangeNotifierProvider(create: (_) => ApiBrasil()),
        ChangeNotifierProvider(create: (_) => ClientProvider()),
        ChangeNotifierProvider(create: (_) => ManagerProvider()),
        ChangeNotifierProvider(create: (_) => VehicleProvider()),
        ChangeNotifierProvider(create: (_) => SettingsProvider()),
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => ImagePickerProvider()),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
     return Consumer<SettingsProvider>(
      builder: (context, settingsProvider, _) {
        return Consumer<LanguageProvider>(
          builder: (context, languageProvider, _) {
            var locale = Locale(languageProvider.idiomaSelecionado);
        return MaterialApp(
         localizationsDelegates: AppLocalizations.localizationsDelegates,
         supportedLocales: AppLocalizations.supportedLocales,
          
        
        
          debugShowCheckedModeBanner: false,
          theme: settingsProvider.isLight ? themeLight() : themeDark(),
          locale: locale,
          routes: {
            AppRoute.HOME: (ctx) {
              return Builder(builder: (context) {
                return TabsScreen(); //local  trocar tela para desenvolvimento
              });
            },
            AppRoute.registerCliente: (context) => RegisterClienteScreen(),
            AppRoute.queryManagers: (context) => QueryManagersScreen(),
            AppRoute.addManager: (context) => AddManagerScreen(),
            AppRoute.privacyPolicy: (context) => PrivacyPolicy(),
            AppRoute.addClient: (context) => AddClientScreen(),
            AppRoute.queryClients: (context) => QueryClientsScreen(),
            AppRoute.updateClient: (context) => UpdateClientScreen(),
            AppRoute.updateManager: (context) => UpdateManagerScreen(),
            AppRoute.registerManager: (context) => RegisterManagerScreen(),
            AppRoute.registerVehicle: (context) => RegisterVehicleScreen(),
            AppRoute.addVehicle: (context) => AddVehicleScreen(),
            AppRoute.queryVehicles: (context) => QueryVehiclesScreen(),
            AppRoute.queryClient: (context) {
              final client = ModalRoute.of(context)!.settings.arguments as Client;
              return QueryClientScreen(
                client: client,
              );
            },
            AppRoute.queryManager: (context) {
              final manager =
                  ModalRoute.of(context)!.settings.arguments as Manager;
              return QueryManagerScreen(manager: manager);
            }
          },
        );
        }
      );
   
    }
    );
  }

  ThemeData themeLight() {
    return ThemeData(
      primaryColor: const Color.fromRGBO(255, 87, 87, 1.0), //cor do appBar
      hintColor: Colors.white,
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
      /*   iconTheme: const IconThemeData(
          color: Color.fromRGBO(134, 128, 128, 1.0), // Define a cor padrão dos ícones
        ),*/
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        //Tema do bottomNavigationBarTheme
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        unselectedItemColor: Color.fromRGBO(134, 128, 128, 1.0),
      ),
    );
  }

  ThemeData themeDark() {
    return ThemeData(
      brightness: Brightness.dark, // Define que este é um tema escuro
      primaryColor: const Color.fromRGBO(255, 87, 87, 1.0), // Cor do AppBar
      canvasColor:
          const Color.fromRGBO(48, 48, 48, 1.0), // Cor da tela de fundo
      hintColor: Color.fromRGBO(36, 36, 36, 0.988),
      // Ajuste das cores de texto para garantir boa legibilidade no tema escuro
      /*   iconTheme: const IconThemeData(color:Color.fromRGBO(134, 128, 128, 1.0)) ,*/
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontSize: 20,
          color: Colors.white, // Branco para contraste no AppBar escuro
          fontFamily: 'inter.ttf',
        ),
        titleSmall: TextStyle(
          fontSize: 20,
          color: Colors.white70, // Cor clara para textos menores
          fontFamily: 'inter.ttf',
        ),
        titleLarge: TextStyle(
          fontSize: 17,
          color: Color.fromRGBO(255, 87, 87, 1.0), // Mantendo a cor primária
          fontFamily: 'inter.ttf',
        ),
        bodyMedium: TextStyle(
          fontSize: 17,
          color: Colors.white, // Branco para contraste em fundo escuro
          fontFamily: 'inter.ttf',
        ),
        bodySmall: TextStyle(
          fontSize: 17,
          color: Colors.white70, // Cor clara para textos menores
          fontFamily: 'inter.ttf',
        ),
        bodyLarge: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 17,
          color: Colors.white70, // Cor clara para textos maiores
          fontFamily: 'inter.ttf',
        ),
        headlineSmall: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 19,
          color: Color.fromRGBO(255, 87, 87, 1.0), // Mantendo a cor primária
          fontFamily: 'inter.ttf',
        ),
        headlineMedium: TextStyle(
          fontSize: 19,
          color: Colors.white, // Branco para contraste em fundo escuro
          fontFamily: 'inter.ttf',
        ),
      ),

      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: Color.fromRGBO(36, 36, 36, 0.988), // Fundo escuro
        selectedItemColor: Colors.white, // Branco para itens selecionados
        unselectedItemColor:
            Colors.white70, // Cor clara para itens não selecionados
      ),

      // Outras customizações podem ser adicionadas aqui
    );
  }
}
