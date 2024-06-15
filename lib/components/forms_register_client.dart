import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/form_add_provider.dart';
import '../provider/form_register_provider.dart';
import '../routes/appRoutes.dart';
import 'form_button.dart';
import 'form_drop.dart';
import 'form_radio.dart';
import 'form_text.dart';

///[FormsRegisterClient] Gerencia o formulário de consulta do usuário
///onde também ele poderá navegar para tela como filtrar [QueryClientsScreen]
///e tambem adicionar novo cliente [AddClientScreen].

class FormsRegisterClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FormsRegisterProvider>(
        builder: (context, formRegisterProvider, _) {
      return Center(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FormText(
                label: 'CNPJ', controller: formRegisterProvider.cnpjController),
            FormText(
              label: 'Razão Social',
              controller: formRegisterProvider.razaoSocialController,
            ),
            FormText(
              label: 'Telefone',
              controller: formRegisterProvider.telefoneController,
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
