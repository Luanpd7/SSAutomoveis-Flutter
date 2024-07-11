import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/form_button.dart';
import '../components/form_drop.dart';
import '../components/form_text.dart';
import '../models/manager.dart';
import '../provider/form_add_manager_provider.dart';
import '../provider/form_update_manager_provider.dart';
import '../services/input_formatter.dart';

///[FormsControllerManager] controla o formulário de adicionar ou editar
/// do manager, essa classe estará esperando um valor  booleano no qual
/// for verdadeiro sera usado o formulario de editar se não para adicionar,
/// e após inserir se as informações estiverem corretas, irão pro banco.

class FormsControllerManager extends StatelessWidget {
  var maskFormatter = InputFormatter();

  final bool isEditing;
  final Manager? manager;

  FormsControllerManager({required this.isEditing, this.manager});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => isEditing
          ? FormUpdateManagerProvider(manager!)
          : FormAddManagerProvider(),
      child: Consumer<ChangeNotifier>(
        builder: (context, formProvider, _) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FormText(
                    inputFormatters: [maskFormatter.cpfMaskFormatter],
                    label: 'CPF',
                    controller: isEditing
                        ? (formProvider as FormUpdateManagerProvider)
                            .cpfController
                        : (formProvider as FormAddManagerProvider)
                            .cpfController,
                    textInputType: TextInputType.number,
                  ),
                  FormText(
                    label: 'Nome',
                    controller: isEditing
                        ? (formProvider as FormUpdateManagerProvider)
                            .nomeController
                        : (formProvider as FormAddManagerProvider)
                            .nomeController,
                  ),
                  FormText(
                    inputFormatters: [maskFormatter.phoneMaskFormatter],
                    label: 'Telefone',
                    controller: isEditing
                        ? (formProvider as FormUpdateManagerProvider)
                            .telefoneController
                        : (formProvider as FormAddManagerProvider)
                            .telefoneController,
                    textInputType: TextInputType.number,
                  ),
                      FormDrop(
              labelDrop: 'Estado',
              items: isEditing? (formProvider as FormUpdateManagerProvider).estados:
              (formProvider as FormAddManagerProvider).estados,
              value: isEditing? (formProvider as FormUpdateManagerProvider).selectedEstado ?? ''
              : (formProvider as FormAddManagerProvider).selectedEstado ?? '',
              onChanged: (newValue) {
                isEditing? (formProvider as FormUpdateManagerProvider).setEstado(newValue):
                (formProvider as FormAddManagerProvider).setEstado(newValue) ;
              },
            ), 
                FormDrop(
              labelDrop: 'Percentual',
              items: isEditing? (formProvider as FormUpdateManagerProvider).percentuais:
              (formProvider as FormAddManagerProvider).percentuais,
              value: isEditing? (formProvider as FormUpdateManagerProvider).selectedPercentual ?? ''
              : (formProvider as FormAddManagerProvider).selectedPercentual ?? '',
              onChanged: (newValue) {
                isEditing? (formProvider as FormUpdateManagerProvider).setPercentual(newValue):
                (formProvider as FormAddManagerProvider).setPercentual(newValue) ;
              },
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
                          if (isEditing) {
                            (formProvider as FormUpdateManagerProvider)
                                .updateForm(context);
                          } else {
                            (formProvider as FormAddManagerProvider)
                                .saveForm(context);
                          }
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
