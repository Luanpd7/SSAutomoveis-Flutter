import 'package:flutter/material.dart';

///[FormButton] gerencia os botões do aplicativo,
///- labelButton é o que vai ficar visível no centro do botão
///- onPresses é a função do botão.

class FormButton extends StatelessWidget {
  final String? labelButton;
  final onPressed;

  FormButton({required this.labelButton, this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ElevatedButton.styleFrom(
          backgroundColor: Theme.of(context).primaryColor,
          foregroundColor: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 12),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(80),
                topRight: Radius.zero,
                bottomLeft: Radius.zero,
                bottomRight: Radius.circular(80)), // Raio das bordas
          ),
        ),
        child: Text(
          labelButton!,
          style: const TextStyle(
              fontFamily: 'inter.ttf', fontWeight: FontWeight.w600),
        ),
      ),
    );
  }
}
