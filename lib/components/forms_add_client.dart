import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/form_add_provider.dart';
import 'form_button.dart';
import 'form_drop.dart';
import 'form_text.dart';

///[FormsAddClient] gerencia o formulário de adicionar cliente,
///aqui estará incluido os controllers a API [ApiBrasil],
///e o banco da dados para inserir as informações no banco.

class FormsAddClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FormAddProvider>(builder: (ctx, formProvider, _) {
      return Center(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FormText(label: 'CNPJ', controller: formProvider.cnpjController),
            FormText(
                label: 'Razão Social',
                controller: formProvider.razaoSocialController),
            FormText(
                label: 'Telefone', controller: formProvider.telefoneController),
            FormText(
                label: 'Estado', controller: formProvider.estadoController),
            FormText(
                label: 'Cidade', controller: formProvider.cidadeController),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FormButton(labelButton: 'Cancelar', onPressed: () {}),
                FormButton(
                    labelButton: 'Salvar',
                    onPressed: () {
                      formProvider.saveForm(context);
                    })
              ],
            )
          ],
        ),
      ));
    });
  }
}
