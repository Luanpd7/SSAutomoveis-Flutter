import 'package:flutter/material.dart';

import 'form_button.dart';
import 'form_drop.dart';
import 'form_radio.dart';
import 'form_text.dart';

class FormsRegisterClient extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          FormText(label: 'CNPJ'),
          FormText(label: 'Razão Social'),
          FormText(label: 'Telfone'),
          FormDrop(labelDrop: 'Estado'),
          FormDrop(labelDrop: 'Cidade'),
          FormRadio(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              FormButton(labelButton: 'Filtrar'),
              FormButton(labelButton: 'Novo Cliente')
            ],
          )
        ],
      ),
    ));
  }
}
