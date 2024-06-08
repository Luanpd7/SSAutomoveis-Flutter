import 'package:flutter/material.dart';

class FormDrop extends StatelessWidget {
  final String? labelDrop;

  FormDrop({required this.labelDrop});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: DropdownButtonFormField<Object>(
        items: [],
        onChanged: (_) {},
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
      ),
    );
  }
}
