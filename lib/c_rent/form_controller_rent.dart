import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/form_button.dart';
import '../components/form_drop.dart';
import '../components/form_text.dart';
import '../models/manager.dart';
import '../provider/form_add_manager_provider.dart';
import '../provider/form_add_rent_provider.dart';
import '../provider/form_update_manager_provider.dart';
import '../services/input_formatter.dart';

///[FormsControllerManager] controla o formulário de adicionar ou editar
/// do manager, essa classe estará esperando um valor  booleano no qual
/// for verdadeiro sera usado o formulario de editar se não para adicionar,
/// e após inserir se as informações estiverem corretas, irão pro banco.

class FormsControllerRent extends StatelessWidget {
  var maskFormatter = InputFormatter();

  final bool isEditing;
  final Manager? manager;

  FormsControllerRent({required this.isEditing, this.manager});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => isEditing
          ? FormUpdateManagerProvider(manager!)
          : FormAddRentProvider(),
      child: Consumer<ChangeNotifier>(
        builder: (context, formProvider, _) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                FormDrop(
                  labelDrop: 'Cliente',
                  items:  (formProvider as FormAddRentProvider).clients,
                  value: '',
                  onChanged: (newValue) {
                    //formRegisterProvider.setEstado(newValue);
                  },
                ),
                FormDrop(
                  labelDrop: 'Veículo',
                  items: (formProvider as FormAddRentProvider).vehicles,
                  value: '',
                  onChanged: (newValue) {
                    //formRegisterProvider.setEstado(newValue);
                  },
                ),
                FormText(
                  inputFormatters: [maskFormatter.phoneMaskFormatter],
                  label: 'Data de início',
                  controller: (formProvider as FormAddRentProvider).initController,
                  
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
                  controller: (formProvider as FormAddRentProvider).findController,
                  
                   onTap: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2101),
                  );
                   }
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FormButton(
                        labelButton: 'Cancelar',
                        onPressed: () {
                          if (isEditing) {
                            (formProvider as FormUpdateManagerProvider);
                          } else {
                            (formProvider as FormAddManagerProvider)
                                .cleanText();
                          }
                        },
                      ),
                      FormButton(
                        labelButton: isEditing ? 'Salvar' : 'Salvar',
                        onPressed: () {
                          
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
