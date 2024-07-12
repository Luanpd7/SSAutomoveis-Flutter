import 'package:flutter/material.dart';

///Essa classe é um componente utilizado pela home
///para ser os itens das opcões.

class ItemMenu extends StatelessWidget {
  final String label;
  final Icon icon;
  final VoidCallback onTap;

  ItemMenu({required this.label, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          icon,
          Text(
            label,
            style: Theme.of(context).textTheme.titleSmall,
          ),
        ],
      ),
    );
  }
}
