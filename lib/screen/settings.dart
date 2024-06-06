import 'package:flutter/material.dart';

import '../components/itemMenu.dart';
import '../components/itemSettings.dart';

class Settings extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
     return Scaffold(
      appBar: AppBar(
        title: Text('Configurações', style: Theme.of(context).textTheme.titleMedium),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
       
        children: [
            Container(
              height: 130,
              width: double.infinity,
              color: Colors.grey,

            ),
           ItemSettings(title: 'Proprietário', subtitle: 'Nome:', label: 'Saulo Corrêa'),


           
         //  ItemSettings(title: 'Desenvolvido Por:', subtitle: 'Luan Pereira Dias'),
        ],
      )
     );
  }


}