import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiFipe {
  static const String baseUrl = 'https://fipe.parallelum.com.br/api/v2';

  Future<List<dynamic>> getCarrosByMarca(String brandId) async {
    final response = await http.get(Uri.parse('$baseUrl/cars/brands/$brandId/models'));
    
    if (response.statusCode == 200) {
      final data = json.decode(response.body);
      print('Modelos retornados: ${data['models']}');
      return data['models'];
    } else {
      print('Erro ao buscar modelos: ${response.statusCode}');
      print('Response body: ${response.body}');
      return [];
    }
  }
}
