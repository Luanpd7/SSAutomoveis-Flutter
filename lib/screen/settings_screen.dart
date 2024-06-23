import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/item_settings.dart';
import '../provider/settings_provider.dart';
import '../routes/appRoutes.dart';

///Essa classe é a tela de configurações
///ela tem como filho a classe item_settings
///que servirá para ser cada item apresentado.

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Configurações',
              style: Theme.of(context).textTheme.titleMedium),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: Theme.of(context).canvasColor,
        body:
            Consumer<SettingsProvider>(builder: (context, settingsProvider, _) {
          return Column(
            children: [
              Container(
                height: 130,
                width: double.infinity,
                decoration: const BoxDecoration(
                    border: Border(
                        bottom: BorderSide(
                  width: 1,
                  color: Color.fromRGBO(134, 128, 128, 1.0),
                ))),
                child: Container(
                  child: Image.asset('images/logo_ss_automoveis.png'),
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ItemSettings(
                      title: 'Proprietário',
                      subtitle: 'Nome:',
                      label: 'Saulo Corrêa',
                      subtitle2: 'E-mail:',
                      label2: 'saulo_ssautomóveis@gmail.com',
                      isText: true,
                    ),
                    ItemSettings(
                      title: 'Aparência',
                      subtitle: 'Idioma:',
                      label: 'Português',
                      subtitle2: 'Tema:',
                      isText: true,
                      label2: settingsProvider.currentTheme(),
                      onTap: () {
                        settingsProvider.showCustomDialog(context);
                      },
                    ),
                    ItemSettings(
                      title: 'Detalhe',
                      icon: Icon(Icons.feed_outlined),
                      subtitle: 'Política de privacidade',
                      isText: false,
                      onTap: () =>
                          Navigator.pushNamed(context, AppRoute.privacyPolicy),
                    ),
                    ItemSettings(
                      title: 'Desenvolvido Por:',
                      subtitle: 'Luan Pereira Dias',
                      //     printOntap: 'clicando linkedln luan',
                    ),
                  ],
                ),
              ),
            ],
          );
        }));
  }
}
