import '../services/database.dart';

class Brand {
  final int? id;
  final String nome;

  Brand({
    this.id,
    required this.nome
  });

    factory Brand.fromMap(Map<String, dynamic> map) {
    return Brand(
      id: map[TableBrand.id],
      nome: map[TableBrand.nome],
  
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'marca': nome,
    };
  }


}