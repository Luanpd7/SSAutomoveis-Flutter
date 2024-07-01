import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiFipe {
  static const String baseUrl = 'https://fipe.parallelum.com.br/api/v2';
  Future<List<dynamic>> getCarrosByMarca(String brandId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/cars/brands/$brandId/models'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
    
        print('A resposta não contém a chave "models".');
        print('deu 200 mas oque retornou foi isso $data');
        return data;
      
    } else {
      print('Erro ao buscar modelos: ${response.statusCode}');
      print('Response body: ${response.body}');
      return [];
    }
  }



   Future<List<dynamic>> getMarcas() async {
    final response = await http.get(Uri.parse('$baseUrl/cars/brands'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);
     print('Marcas retornadas: $data');
      return data;
    } else {
      print('Erro ao buscar marcas: ${response.statusCode}');
      print('Response body: ${response.body}');
      return [];
    }
  }
}
