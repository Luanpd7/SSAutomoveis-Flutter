import 'package:flutter/material.dart';

import '../components/itemMenu.dart';
import '../components/triangleClipper.dart';




class Menu extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
     body: Center(
       child: Column(
       
        children: [
             Widget050(),
             Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ItemMenu(),
                SizedBox(width: 10),
                ItemMenu(),
              ],
             )
        ],
       ),
     )
    
     
    );
  }

}