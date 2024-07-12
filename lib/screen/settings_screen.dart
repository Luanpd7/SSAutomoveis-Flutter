import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../components/item/item_settings.dart';
import '../provider/language_provider.dart';
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
          title: Text(AppLocalizations.of(context)!.settings,
              style: Theme.of(context).textTheme.titleMedium),
          backgroundColor: Theme.of(context).primaryColor,
        ),
        backgroundColor: Theme.of(context).canvasColor,
        body:
            Consumer<SettingsProvider>(builder: (context, settingsProvider, _) {
          return Consumer<LanguageProvider>(
              builder: (context, languageProvider, _) {
            var idiomaSelecionado = languageProvider.idiomaSelecionado;
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
                        title: AppLocalizations.of(context)!.owner,
                        subtitle: AppLocalizations.of(context)!.name,
                        label: 'Saulo Corrêa',
                        subtitle2: 'E-mail:',
                        label2: 'saulo_ssautomóveis@gmail.com',
                        isText: true,
                      ),
                      ItemSettings(
                        title: AppLocalizations.of(context)!.appearance,
                        subtitle: AppLocalizations.of(context)!.language,
                        label: idiomaSelecionado,
                        onTap: () {
                          showDialog(
                            context: context,
                            builder: (context) {
                              return AlertDialog(
                                title: Center(
                                    child: Text(AppLocalizations.of(context)!
                                        .settings)),
                                content: Consumer<LanguageProvider>(
                                  builder: (context, idiomaProvider, _) =>
                                      DropdownButtonFormField<String>(
                                    value: idiomaProvider.idiomaSelecionado,
                                    onChanged: (String? novoIdioma) {
                                      if (novoIdioma != null) {
                                        idiomaProvider
                                            .selecionarIdioma(novoIdioma);
                                      }
                                    },
                                    items: <String>['pt', 'en']
                                        .map<DropdownMenuItem<String>>((value) {
                                      return DropdownMenuItem<String>(
                                        value: value,
                                        child: Text(
                                          value,
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      );
                                    }).toList(),
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    child: const Text('Fechar'),
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  ),
                                ],
                              );
                            },
                          );
                        },
                        subtitle2: AppLocalizations.of(context)!.theme,
                        isText: true,
                        label2: settingsProvider.currentTheme(),
                        onTap2: () {
                          settingsProvider.showCustomDialog(context);
                        },
                      ),
                      ItemSettings(
                        title: AppLocalizations.of(context)!.detail,
                        icon: Icon(Icons.feed_outlined),
                        subtitle: AppLocalizations.of(context)!.privacyPolicy,
                        isText: false,
                        onTap: () => Navigator.pushNamed(
                            context, AppRoute.privacyPolicy),
                      ),
                      ItemSettings(
                        title: AppLocalizations.of(context)!.developedBy,
                        subtitle: 'Luan Pereira Dias',
                        //     printOntap: 'clicando linkedln luan',
                      ),
                    ],
                  ),
                ),
              ],
            );
          });
        }));
  }
}
