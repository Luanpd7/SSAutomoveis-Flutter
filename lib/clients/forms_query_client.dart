import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/form/form_button.dart';
import '../components/form/form_drop.dart';
import '../components/form/form_radio.dart';
import '../components/form/form_text.dart';
import '../provider/query_provider/form_query_client_provider.dart';
import '../routes/appRoutes.dart';
import '../services/input_formatter.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

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
              label: AppLocalizations.of(context)!.socialReason,
              controller: formRegisterProvider.razaoSocialController,
            ),
            FormText(
              inputFormatters: [maskFormatter.phoneMaskFormatter],
              label: AppLocalizations.of(context)!.phone,
              controller: formRegisterProvider.telefoneController,
              textInputType: TextInputType.number,
            ),
            FormDrop(
              labelDrop: AppLocalizations.of(context)!.state,
              items: formRegisterProvider.estados,
              value: formRegisterProvider.selectedEstado ?? '',
              onChanged: (newValue) {
                formRegisterProvider.setEstado(newValue);
              },
            ),
            FormDrop(
              labelDrop: AppLocalizations.of(context)!.city,
              items: formRegisterProvider.cidades,
              value: formRegisterProvider.selectedEstado ?? '',
              onChanged: (newValue) {
                formRegisterProvider.setEstado(newValue);
              },
            ),
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FormButton(
                  labelButton: AppLocalizations.of(context)!.filter,
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.queryClients);
                  },
                ),
                FormButton(
                    labelButton: AppLocalizations.of(context)!.newCustomer,
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
