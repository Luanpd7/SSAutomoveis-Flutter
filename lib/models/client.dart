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
  final DateTime? dataRegistro;
  final int? gerenteId;

  Client({
    this.id,
    this.dataRegistro,
    required this.cnpj,
    required this.razaoSocial,
    required this.telefone,
    required this.estado,
    required this.cidade,
    this.gerenteId,
  });


  factory Client.fromMap(Map<String, dynamic> map) {
    return Client(
      id: map[TableClient.id],
      dataRegistro: DateTime.parse(map[TableClient.dataRegistro]),
      cnpj: map[TableClient.cnpj],
      razaoSocial: map[TableClient.razaoSocial],
      telefone: map[TableClient.telefone],
      estado: map[TableClient.estado],
      cidade: map[TableClient.cidade],
      gerenteId: map[TableClient.gerenteId],
    );
  }

  Map<String, Object?> toMap() {
    return {
      TableClient.id: id,
      TableClient.dataRegistro: dataRegistro?.toIso8601String(),
      TableClient.cnpj: cnpj,
      TableClient.razaoSocial: razaoSocial,
      TableClient.telefone: telefone,
      TableClient.estado: estado,
      TableClient.cidade: cidade,
      TableClient.gerenteId: gerenteId,
    };
  }
}
