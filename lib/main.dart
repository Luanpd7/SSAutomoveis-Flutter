import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
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
import 'services/api_brasil.dart';
import 'services/database.dart';
import 'theme/app_theme.dart';

/// Essa classe principal onde vai ser o começo de toda a aplicação onde será
/// tambem armazenado as configuraçoes das cores e fonte das telas.

void main() async {
  //  WidgetsFlutterBinding.ensureInitialized();

  // await resetDatabase();  // Recriar o banco de dados

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
        ChangeNotifierProvider(create: (_) => VehicleProvider()..selectMarca()),
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
    return Consumer<SettingsProvider>(builder: (context, settingsProvider, _) {
      return Consumer<LanguageProvider>(
          builder: (context, languageProvider, _) {
        var locale = Locale(languageProvider.idiomaSelecionado);
        AppTheme appTheme = AppTheme();
        return MaterialApp(
          localizationsDelegates: AppLocalizations.localizationsDelegates,
          supportedLocales: AppLocalizations.supportedLocales,
          debugShowCheckedModeBanner: false,
          theme: settingsProvider.isLight
              ? appTheme.themeLight()
              : appTheme.themeDark(),
          locale: locale,
          routes: AppRoute().routes(),
        );
      });
    });
  }
}
