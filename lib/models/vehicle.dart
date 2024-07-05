class Vehicle {
  final int? id;
  final String modelo;
  final String marca; // Adiciona esta linha

  Vehicle({
    this.id,
    required this.modelo,
    required this.marca, // Adiciona esta linha no construtor
  });

  factory Vehicle.fromMap(Map<String, dynamic> map, String marca) { // Adiciona marca como parâmetro
    return Vehicle(
      id: map['code'] != null ? int.tryParse(map['code'].toString()) : null,
      modelo: map['name'],
      marca: marca, // Usa o parâmetro marca
    );
  }

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'modelo': modelo,
      'marca': marca, // Adiciona esta linha
    };
  }
}
