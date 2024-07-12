import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/form/form_button.dart';
import '../components/form/form_drop.dart';
import '../components/form/form_radio.dart';
import '../components/form/form_text.dart';
import '../provider/query_provider/form_query_manager_provider.dart';
import '../routes/appRoutes.dart';
import '../services/input_formatter.dart';

///[FormsQueryManager] Gerencia o formulário de consulta do usuário
///onde também ele poderá navegar para tela como filtrar ['QueryManagerScreen']
///e tambem adicionar novo Gerente['AddManagerScreen'].

class FormsQueryManager extends StatelessWidget {
  var maskFormatter = InputFormatter();

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
                  inputFormatters: [maskFormatter.cpfMaskFormatter],
                  label: 'CPF',
                  controller: formRegisterProvider.cpfController,
                  textInputType: TextInputType.number,
                ),
                FormText(
                  label: 'Nome',
                  controller: formRegisterProvider.nomeController,
                ),
                FormText(
                  inputFormatters: [maskFormatter.phoneMaskFormatter],
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
