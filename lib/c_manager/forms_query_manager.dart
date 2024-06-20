import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/form_radio.dart';
import '../provider/form_query_manager_provider.dart';
import '../routes/appRoutes.dart';
import '../components/form_button.dart';
import '../components/form_drop.dart';
import '../components/form_text.dart';

///[FormsRegisterManager] Gerencia o formulário de consulta do usuário
///onde também ele poderá navegar para tela como filtrar [QueryManagerScreen]
///e tambem adicionar novo cliente [AddManagerScreen].

class FormsQueryManager extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FormsQueryManagerProvider>(
      builder: (context, formRegisterProvider, _) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FormText(
                    label: 'CPF',
                    controller: formRegisterProvider.cpfController),
                FormText(
                  label: 'Nome',
                  controller: formRegisterProvider.nomeController,
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
                  labelDrop: 'Percentual de Comissão',
                  items: formRegisterProvider.percentual,
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
                        Navigator.pushNamed(context, AppRoute.queryManagers);
                      },
                    ),
                    FormButton(
                        labelButton: 'Novo Gerente',
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoute.addManager);
                        })
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
