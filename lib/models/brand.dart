class Brand {
  final int? id;
  final String nome;

  Brand({
    required this.id,
    required this.nome,
  });

  factory Brand.fromMap(Map<String, dynamic> map) {
    return Brand(
      id: int.tryParse(map['code']),
      nome: map['name'],
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'nome': nome,
    };
  }
}