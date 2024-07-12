import 'package:flutter/material.dart';

///[QueryItemIcone] gerencia os Icons do aplicativo,
///icon - tipo de icone

class QueryItemIcone extends StatelessWidget {
  final IconData icon;
  final Function() onTap;

  const QueryItemIcone({super.key, required this.icon, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Center(
        child: Icon(
          icon,
          color: const Color.fromRGBO(255, 87, 87, 1.0),
          size: 30,
        ),
      ),
    );
  }
}
