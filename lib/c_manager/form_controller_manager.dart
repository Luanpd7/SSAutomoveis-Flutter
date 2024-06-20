import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/form_button.dart';
import '../components/form_text.dart';
import '../models/manager.dart';
import '../provider/form_add_manager_provider.dart';
import '../provider/form_update_client_provider.dart';
import '../provider/form_update_manager_provider.dart';

/// [FormsControllerManager] controla o formulário de adicionar ou editar o gerente,
/// e o banco da dados para inserir as informações no banco.

class FormsControllerManager extends StatelessWidget {
  final bool isEditing;
  final Manager? manager;

  FormsControllerManager({required this.isEditing, this.manager});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          isEditing ? FormUpdateManagerProvider() : FormAddManagerProvider(),
      child: Consumer<ChangeNotifier>(
        builder: (context, formProvider, _) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FormText(
                    label: 'CPF',
                    controller: isEditing
                        ? (formProvider as FormUpdateManagerProvider)
                            .cpfController
                        : (formProvider as FormAddManagerProvider)
                            .cpfController,
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
                    label: 'Telefone',
                    controller: isEditing
                        ? (formProvider as FormUpdateManagerProvider)
                            .telefoneController
                        : (formProvider as FormAddManagerProvider)
                            .telefoneController,
                  ),
                  FormText(
                    label: 'Estado',
                    controller: isEditing
                        ? (formProvider as FormUpdateManagerProvider)
                            .estadoController
                        : (formProvider as FormAddManagerProvider)
                            .estadoController,
                  ),
                  FormText(
                    label: 'Percentual',
                    controller: isEditing
                        ? (formProvider as FormUpdateManagerProvider)
                            .percentualController
                        : (formProvider as FormAddManagerProvider)
                            .percentualController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FormButton(
                        labelButton: 'Cancelar',
                        onPressed: () {
                          if (isEditing) {
                            (formProvider as FormUpdateClientProvider);
                          } else {
                            (formProvider as FormAddManagerProvider)
                                .cleanText();
                          }
                        },
                      ),
                      FormButton(
                        labelButton: isEditing ? 'Editar' : 'Salvar',
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
