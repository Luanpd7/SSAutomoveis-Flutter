import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../components/query_item.dart';
import '../models/client.dart';

class QueryItemScreen extends StatelessWidget {
  Client? client;

  QueryItemScreen({this.client});

  @override
  Widget build(BuildContext context) {
  //
    //final client = ModalRoute.of(context)!.settings.arguments as Client;
    return Scaffold(
      appBar: AppBar(
        title: Text( 'teste' /*client.razaoSocial*/,
            style: Theme.of(context).textTheme.titleMedium),
        backgroundColor: Theme.of(context).primaryColor,
      ),
       backgroundColor: Theme.of(context).canvasColor,
       body: Center(
         child: Container(
          height: 650,
          width: 380,
          color: Colors.white,
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QueryItem(title: 'Razão Social', subtitle: 'teste'),
                QueryItem(title: 'CNPJ', subtitle: 'teste'),
                
              ],
             ),
             Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QueryItem(title: 'Cidade', subtitle: 'teste'),
                QueryItem(title: 'Estado', subtitle: 'teste'),
                
              ],
             ),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QueryItem(title: 'Telefone', subtitle: 'teste'),
                QueryItem(title: 'Gerente', subtitle: 'teste'),
                
              ],
             ),
              Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                QueryItem(title: 'Data de Registro', subtitle: 'teste'),
               
                
              ],
             )
          ],
          ),
         ),
       )
        
    
       
    );
  }
}