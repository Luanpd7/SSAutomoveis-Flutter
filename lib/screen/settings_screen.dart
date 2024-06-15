import 'package:flutter/material.dart';
import '../components/item_settings.dart';

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
        body: Column(
          children: [
            Container(
              height: 130,
              width: double.infinity,
              color: Colors.grey,
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
                  ),
                  ItemSettings(
                    title: 'Aparência',
                    subtitle: 'Idioma:',
                    label: 'Português',
                    subtitle2: 'Tema:',
                    label2: 'Dark',
                  ),
                  ItemSettings(
                    title: 'Detalhe',
                    subtitle: 'Icon:',
                    label: 'Política de privacidade',
                  ),
                  ItemSettings(
                      title: 'Desenvolvido Por:',
                      subtitle: 'Luan Pereira Dias'),
                ],
              ),
            ),
          ],
        ));
  }
}
