import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/form_add_provider.dart';

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
