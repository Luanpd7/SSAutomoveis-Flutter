class Vehicle {
  final int? id;
  final String modelo;
  final String marca;
  final String placa;
  final String ano;
  final String diaria;
  final String imagePath;

  Vehicle({
    this.id,
    required this.modelo,
    required this.marca,
    required this.placa,
    required this.ano,
    required this.diaria,
    required this.imagePath,
  });

  factory Vehicle.fromMap(Map<String, dynamic> map) {
    return Vehicle(
      id: map['id'],
      modelo: map['modelo'],
      marca: map['marca'],
      placa: map['placa'],
      ano: map['ano'],
      diaria: map['diaria'],
      imagePath: map['imagePath'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'modelo': modelo,
      'marca': marca,
      'placa': placa,
      'ano': ano,
      'diaria': diaria,
      'imagePath': imagePath,
    };
  }
}
