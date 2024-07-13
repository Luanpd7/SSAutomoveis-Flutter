import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiFipe {
  static const String baseUrl = 'https://fipe.parallelum.com.br/api/v2';
  Future<List<dynamic>> getCarrosByMarca(String brandId) async {
    final response =
        await http.get(Uri.parse('$baseUrl/cars/brands/$brandId/models'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      if (brandId == '23') {
        List<dynamic> selectModels = [
          data[5],
          data[11],
          data[77],
          data[86],
          data[111],
          data[192],
          data[197],
          data[234],
          data[250],
          data[265],
          data[270],
          data[294],
          data[296],
          data[314],
          data[319],
          data[326],
          data[426],
          data[438],
          data[456],
          data[478],
          data[494],
          data[498],
          data[526]
        ];
        return selectModels;
      } else if (brandId == '22') {
        List<dynamic> selectModels = [
          data[2],
          data[9],
          data[11],
          data[21],
          data[27],
          data[62],
          data[69],
          data[93],
          data[165],
          data[226],
          data[245],
          data[256],
          data[258],
          data[278],
          data[305],
          data[318],
          data[321],
          data[333],
          data[335],
          data[338],
          data[442],
          data[450],
          data[477],
        ];
        return selectModels;
      } else if (brandId == '21') {
        List<dynamic> selectModels = [];
        return selectModels;
      } else if (brandId == '7') {
        List<dynamic> selectModels = [];
        return selectModels;
      }

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
      List<dynamic> selectBrand = [
        data[6],
        data[8],
        data[31],
        data[33],
        data[37],
      ];
      return selectBrand;
    } else {
      print('Erro ao buscar marcas: ${response.statusCode}');
      print('Response body: ${response.body}');
      return [];
    }
  }

  Future<List<dynamic>> getYearsByModels(String brandId) async {
    var s = '59';

    final response = await http.get(Uri.parse(
        'https://fipe.parallelum.com.br/api/v2/cars/brands/$s/years'));

    if (response.statusCode == 200) {
      final data = json.decode(response.body);

      return data; // Retorna os dados decodificados
    } else {
      print('não retornou nada');
      print('Erro ao buscar anos: ${response.statusCode}');
      print('Response body: ${response.body}');
      return [];
    }
  }
}
