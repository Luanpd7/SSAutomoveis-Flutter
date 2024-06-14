import 'package:flutter/material.dart';

class QueryItemIcone extends StatelessWidget {
   IconData icon;

   QueryItemIcone({required this.icon});

  @override
  Widget build(BuildContext context) {
    return Center(
     child:  Icon(icon),
     
     
      
    );
  }
}