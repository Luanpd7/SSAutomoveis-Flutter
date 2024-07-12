import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/form/form_button.dart';
import '../components/form/form_drop.dart';
import '../components/form/form_radio.dart';
import '../components/form/form_text.dart';
import '../provider/query_provider/form_query_manager_provider.dart';
import '../provider/query_provider/form_query_rent.dart';
import '../routes/appRoutes.dart';
import '../services/input_formatter.dart';

///[FormsQueryRent] Gerencia o formulário de consulta do usuário
///onde também ele poderá navegar para tela como filtrar ['QueryRentScreen']
///e tambem adicionar novo Gerente['AddRentScreen'].

class FormsQueryRent extends StatelessWidget {
  var maskFormatter = InputFormatter();

  @override
  Widget build(BuildContext context) {
    return Consumer<FormsQueryRentProvider>(
      builder: (context, formRegisterProvider, _) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FormDrop(
                  labelDrop: 'Cliente',
                  items: formRegisterProvider.clients!.map((marca) => marca.razaoSocial).toList(),
                  value: formRegisterProvider.selectedEstado ?? '',
                  onChanged: (newValue) {
                    //formRegisterProvider.setEstado(newValue);
                  },
                ),
                FormDrop(
                  labelDrop: 'Veículo',
                  items: formRegisterProvider.vehicles,
                  value: formRegisterProvider.selectedEstado ?? '',
                  onChanged: (newValue) {
                    //formRegisterProvider.setEstado(newValue);
                  },
                ),
                FormText(
                  inputFormatters: [maskFormatter.phoneMaskFormatter],
                  label: 'Data de início',
                  controller: formRegisterProvider.initController,
                  
                   onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                   }
                ),
               FormText(
                  inputFormatters: [maskFormatter.phoneMaskFormatter],
                  label: 'Data de termino',
                  controller: formRegisterProvider.findController,
                  
                   onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                   }
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
                        labelButton: 'Novo Registro',
                        onPressed: () {
                          Navigator.pushNamed(context, AppRoute.addRent);
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
