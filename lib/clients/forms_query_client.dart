import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/form_button.dart';
import '../components/form_drop.dart';
import '../components/form_radio.dart';
import '../components/form_text.dart';
import '../provider/form_query_client_provider.dart';
import '../routes/appRoutes.dart';
import '../services/input_formatter.dart';

///[FormsQueryClient] Gerencia o formulário de consulta do usuário
///onde também ele poderá navegar para tela como filtrar ['QueryClientsScreen']
///e tambem adicionar novo cliente ['AddClientScreen'].

class FormsQueryClient extends StatelessWidget {
  var maskFormatter = InputFormatter();

  @override
  Widget build(BuildContext context) {
    return Consumer<FormsQueryClientProvider>(
        builder: (context, formRegisterProvider, _) {
      return Center(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FormText(
              inputFormatters: [maskFormatter.cnpjMaskFormatter],
              label: 'CNPJ',
              controller: formRegisterProvider.cnpjController,
              textInputType: TextInputType.number,
            ),
            FormText(
              label: 'Razão Social',
              controller: formRegisterProvider.razaoSocialController,
            ),
            FormText(
              inputFormatters: [maskFormatter.phoneMaskFormatter],
              label: 'Telefone',
              controller: formRegisterProvider.telefoneController,
              textInputType: TextInputType.number,
            ),
            FormDrop(
              labelDrop: 'Estado',
              items: formRegisterProvider.estados,
              value: formRegisterProvider.selectedEstado ?? '',
              onChanged: (newValue) {
                formRegisterProvider.setEstado(newValue);
              },
            ),
            FormDrop(
              labelDrop: 'Cidade',
              items: formRegisterProvider.cidades,
              value: formRegisterProvider.selectedEstado ?? '',
              onChanged: (newValue) {
                formRegisterProvider.setEstado(newValue);
              },
            ),
            FormRadio(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FormButton(
                  labelButton: 'Filtrar',
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.queryClients);
                  },
                ),
                FormButton(
                    labelButton: 'Novo Cliente',
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoute.addClient);
                    })
              ],
            )
          ],
        ),
      ));
    });
  }
}
