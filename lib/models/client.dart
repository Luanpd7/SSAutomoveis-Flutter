import '../services/database.dart';
///classe modelo client
///
class Client {
  final int? id;
  final String cnpj;
  final String razaoSocial;
  final String telefone;
  final String estado;
  final String cidade;
  

  Client({
    this.id,
    required this.cnpj,
    required this.razaoSocial,
    required this.telefone,
    required this.estado,
    required this.cidade
  });


  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map[TableClient.id],
      cnpj: map[TableClient.cnpj],
      razaoSocial: map[TableClient.razaoSocial],
      telefone: map[TableClient.telefone],
      estado: map[TableClient.estado],
      cidade: map[TableClient.cidade],
    );
  }
}
