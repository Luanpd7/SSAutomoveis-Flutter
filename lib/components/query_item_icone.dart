import 'package:flutter/material.dart';

///[QueryItemIcone] gerencia os Icons do aplicativo,
///icon - tipo de icone

class QueryItemIcone extends StatelessWidget {
   IconData icon;

   QueryItemIcone({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
     child:  Icon(icon, color: Color.fromRGBO(255, 87, 87, 1.0), size: 30,),
     
     
     
      
    );
  }
}