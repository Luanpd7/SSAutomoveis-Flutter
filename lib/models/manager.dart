import '../services/database.dart';

class Manager {
  final int? id;
  final String cpf;
  final String nome;
  final String telefone;
  final String estado;
  final String percentual;

  Manager(
      {this.id,
      required this.cpf,
      required this.nome,
      required this.telefone,
      required this.estado,
      required this.percentual});

  factory Manager.fromMap(Map<String, dynamic> map) {
    return Manager(
      id: map[TableManager.id],
      cpf: map[TableManager.cpf],
      nome: map[TableManager.nome],
      telefone: map[TableManager.telefone],
      estado: map[TableManager.estado],
      percentual: map[TableManager.percentual],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'cpf': cpf,
      'nome': nome,
      'telefone': telefone,
      'estado': estado,
      'percentual': percentual
    };
  }
}
