import 'package:flutter/material.dart';

class ItemMenu extends StatelessWidget {
  const ItemMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      width: 100,
      color: Colors.grey,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(Icons.people),
          Text('Clientes')
        ],
      ),
    );
  }
}