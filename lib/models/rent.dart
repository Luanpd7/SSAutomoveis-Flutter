class Aluguel {
  final int id;
  final int clienteId;
  final DateTime dataInicio;
  final DateTime dataTermino;
  final int numeroDias;
  final double valorTotal;
  final int veiculoId;
  final int gerenteId;
  final double comissaoGerente;

  Aluguel({
    required this.id,
    required this.clienteId,
    required this.dataInicio,
    required this.dataTermino,
    required this.numeroDias,
    required this.valorTotal,
    required this.veiculoId,
    required this.gerenteId,
    required this.comissaoGerente,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'clienteId': clienteId,
      'dataInicio': dataInicio.toIso8601String(),
      'dataTermino': dataTermino.toIso8601String(),
      'numeroDias': numeroDias,
      'valorTotal': valorTotal,
      'veiculoId': veiculoId,
      'gerenteId': gerenteId,
      'comissaoGerente': comissaoGerente,
    };
  }

  factory Aluguel.fromMap(Map<String, dynamic> map) {
    return Aluguel(
      id: map['id'],
      clienteId: map['clienteId'],
      dataInicio: DateTime.parse(map['dataInicio']),
      dataTermino: DateTime.parse(map['dataTermino']),
      numeroDias: map['numeroDias'],
      valorTotal: map['valorTotal'],
      veiculoId: map['veiculoId'],
      gerenteId: map['gerenteId'],
      comissaoGerente: map['comissaoGerente'],
    );
  }
}