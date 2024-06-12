import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../models/client.dart';

class ApiBrasil with ChangeNotifier {
  Map<String, dynamic>? infoClients;

  Future<Client?> validateCNPJ(String cnpj) async {
    Map<String, dynamic>? infoClients;

    final url = 'https://brasilapi.com.br/api/cnpj/v1/$cnpj';

    final response = await http.get(Uri.parse(url));

    if (response.statusCode == 200) {
      infoClients = json.decode(response.body);
      print('voltou 200');
     

      return Client(
          
          cnpj: infoClients!['cnpj'],
          razaoSocial: infoClients['razao_social'],
          telefone: infoClients['ddd_telefone_1'],
          estado: infoClients['uf'],
          cidade: infoClients['municipio']
          );
          
    } else {
      infoClients = null;
      print('nao voltou');
      return null;
    }
  }
}
