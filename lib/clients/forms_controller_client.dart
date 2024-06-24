import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/form_button.dart';
import '../components/form_text.dart';
import '../models/client.dart';
import '../provider/form_add_client_provider.dart';
import '../provider/form_update_client_provider.dart';

///[FormsControllerClient] controla o formulário de adicionar ou editar 
/// do cliente, essa classe estará esperando um valor  booleano no qual 
/// for verdadeiro sera usado o formulario de editar se não para adicionar,
/// e após inserir se as informações estiverem corretas, irão pro banco.

class FormsControllerClient extends StatelessWidget {
  final bool isEditing;
  final Client? client;

  FormsControllerClient({required this.isEditing, this.client});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => isEditing
          ? FormUpdateClientProvider(client!)
          : FormAddClientProvider(),
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
                        ? (formProvider as FormUpdateClientProvider)
                            .cnpjController
                        : (formProvider as FormAddClientProvider)
                            .cnpjController,
                  ),
                  FormText(
                    label: 'Razão Social',
                    controller: isEditing
                        ? (formProvider as FormUpdateClientProvider)
                            .razaoSocialController
                        : (formProvider as FormAddClientProvider)
                            .razaoSocialController,
                  ),
                  FormText(
                    label: 'Telefone',
                    controller: isEditing
                        ? (formProvider as FormUpdateClientProvider)
                            .telefoneController
                        : (formProvider as FormAddClientProvider)
                            .telefoneController,
                  ),
                  FormText(
                    label: 'Estado',
                    controller: isEditing
                        ? (formProvider as FormUpdateClientProvider)
                            .estadoController
                        : (formProvider as FormAddClientProvider)
                            .estadoController,
                  ),
                  FormText(
                    label: 'Cidade',
                    controller: isEditing
                        ? (formProvider as FormUpdateClientProvider)
                            .cidadeController
                        : (formProvider as FormAddClientProvider)
                            .cidadeController,
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
                            (formProvider as FormAddClientProvider).cleanText();
                          }
                        },
                      ),
                      FormButton(
                        labelButton: isEditing ? 'Salvar' : 'Salvar',
                        onPressed: () {
                          if (isEditing) {
                            (formProvider as FormUpdateClientProvider)
                                .updateForm(context);
                          } else {
                            (formProvider as FormAddClientProvider)
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
