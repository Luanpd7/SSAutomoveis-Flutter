import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/form_add_provider.dart';

///   [FormDrop] é utilizado para exibir uma lista de itens em um menu dropdown
///   e permite que o usuário selecione um dos itens.
/// - labelDrop é  rótulo que será exibido acima do campo de seleção.
/// - items uma lista de strings representando os itens disponíveis para seleção
/// - value é valor atualmente selecionado no campo de seleção.
/// - onChanged é a função

class FormDrop extends StatelessWidget {
  final String? labelDrop;
  final List<String> items;
  final String value;
  final ValueChanged<String?>? onChanged;

  FormDrop(
      {required this.labelDrop,
      required this.items,
      required this.value,
      required this.onChanged});

  @override
  Widget build(BuildContext context) {
    return Consumer<FormAddProvider>(
      builder: (context, formProvider, child) {
        final currentVallue = items.contains(value) ? value : null;
        return DropdownButtonFormField<String>(
          value: currentVallue,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Text(item),
            );
          }).toList(),
          onChanged: onChanged,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(224, 224, 224, 1.0),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8),
            ),
            labelStyle: Theme.of(context).textTheme.bodyLarge,
            labelText: labelDrop,
          ),
          style: Theme.of(context).textTheme.bodyLarge,
          dropdownColor: Colors.white,
        );
      },
    );
  }
}
