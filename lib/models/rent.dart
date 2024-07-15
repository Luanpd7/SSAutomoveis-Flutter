import '../services/database.dart';


class Rent {
  final int? id;
  final int clientId;
  final int vehicleId;
  final DateTime dataRegistro;
  final DateTime dataInicio;
  final DateTime dataFim;
  final int dias;
  final double valorTotal;
  final double comissao;

  Rent({
    this.id,
    required this.clientId,
    required this.vehicleId,
    required this.dataRegistro,
    required this.dataInicio,
    required this.dataFim,
    required this.dias,
    required this.valorTotal,
    required this.comissao
  });

  factory Rent.fromMap(Map<String, dynamic> map) {
    return Rent(
      id: map[TableRent.id],
      clientId: map[TableRent.clientId],
      vehicleId: map[TableRent.veiculoId],
     dataRegistro: DateTime.parse(map[TableRent.dataRegistro]),
    dataInicio: DateTime.parse(map[TableRent.dataInicio]),
    dataFim: DateTime.parse(map[TableRent.dataFim]),
      dias: int.parse(map[TableRent.dias]), 
      valorTotal: double.parse(map[TableRent.valorTotal]),
       comissao: double.parse(map[TableRent.comissao]),

    
    );
    
  }

  Map<String, dynamic> toMap() {
    return {
      TableRent.id: id,
      TableRent.clientId: clientId,
      TableRent.veiculoId: vehicleId,
      TableRent.dataRegistro: dataRegistro.toIso8601String(),
      TableRent.dataInicio: dataInicio.toIso8601String(),
     TableRent.dataFim: dataFim.toIso8601String(),
     TableRent.dias: dias,
     TableRent.valorTotal: valorTotal,
     TableRent.comissao: comissao
    };
  }
}
