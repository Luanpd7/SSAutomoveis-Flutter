import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/form_add_client_provider.dart';

class FormDrop extends StatelessWidget {
  final String? labelDrop;
  final List<String> items;
  final String value;
  final ValueChanged<String?> onChanged;

  FormDrop({
    required this.labelDrop,
    required this.items,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<FormAddClientProvider>(
      builder: (context, formProvider, child) {
        final currentValue = items.contains(value) ? value : null;
        return DropdownButtonFormField<String>(
          value: currentValue,
          items: items.map((String item) {
            return DropdownMenuItem<String>(
              value: item,
              child: Container(
                width: MediaQuery.of(context).size.width * 0.7, // Ajuste a largura conforme necessário
                child: Text(
                  item,
                  overflow: TextOverflow.ellipsis,
                  
                ),
              ),
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
