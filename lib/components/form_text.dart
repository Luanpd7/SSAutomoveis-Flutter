import 'package:flutter/material.dart';

///[FormText] gerencia o text FormField do campos de texto do aplicativo
///- label para o rótulo do campo
///- O controlador que gerencia o texto inserido no campo de texto.

class FormText extends StatelessWidget {
  final String? label;
  final TextEditingController controller;

  FormText({required this.label, required this.controller});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextFormField(
        controller: controller,
        decoration: InputDecoration(
          label: Text(
            label!,
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(
                color: Color.fromRGBO(224, 224, 224, 1.0),
                width: 2,
              ),
              borderRadius: BorderRadius.circular(8)),
        ),
      ),
    );
  }
}
