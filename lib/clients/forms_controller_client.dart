import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/client.dart';
import '../provider/form_add_provider.dart';
import '../provider/form_update_provider.dart';
import '../components/form_button.dart';
import '../components/form_text.dart';

/// [FormsAddClient] gerencia o formulário de adicionar e editar o cliente,
/// aqui estará incluido os controllers a API [ApiBrasil],
/// e o banco da dados para inserir as informações no banco.

class FormsControllerClient extends StatelessWidget {
  final bool isEditing;
  final Client? client;

  FormsControllerClient({required this.isEditing, this.client});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => isEditing ? FormUpdateProvider(client!) : FormAddProvider(),
      child: Consumer<ChangeNotifier>(
        builder: (context, formProvider, _) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FormText(
                    label: 'CNPJ',
                    controller: isEditing
                        ? (formProvider as FormUpdateProvider).cnpjController
                        : (formProvider as FormAddProvider).cnpjController,
                  ),
                  FormText(
                    label: 'Razão Social',
                    controller: isEditing
                        ? (formProvider as FormUpdateProvider).razaoSocialController
                        : (formProvider as FormAddProvider).razaoSocialController,
                  ),
                  FormText(
                    label: 'Telefone',
                    controller: isEditing
                        ? (formProvider as FormUpdateProvider).telefoneController
                        : (formProvider as FormAddProvider).telefoneController,
                  ),
                  FormText(
                    label: 'Estado',
                    controller: isEditing
                        ? (formProvider as FormUpdateProvider).estadoController
                        : (formProvider as FormAddProvider).estadoController,
                  ),
                  FormText(
                    label: 'Cidade',
                    controller: isEditing
                        ? (formProvider as FormUpdateProvider).cidadeController
                        : (formProvider as FormAddProvider).cidadeController,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FormButton(
                        labelButton: 'Cancelar',
                        onPressed: () {
                          if (isEditing) {
                            (formProvider as FormUpdateProvider);
                          } else {
                            (formProvider as FormAddProvider).cleanText();
                          }
                        },
                      ),
                      FormButton(
                        labelButton: isEditing ? 'Editar' : 'Salvar',
                        onPressed: () {
                          if (isEditing) {
                           (formProvider as FormUpdateProvider).updateForm(context);
                          } else {
                            (formProvider as FormAddProvider).saveForm(context);
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
