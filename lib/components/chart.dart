import 'package:flutter/material.dart';


import 'chart_bar.dart';

class Chart extends StatelessWidget {
  final double vehicleCount;
  final double clientCount;
  final double rentCount;
  final double managerCount;

  Chart({
    required this.vehicleCount,
    required this.clientCount,
    required this.rentCount,
    required this.managerCount,
  });

  List<Map<String, dynamic>> get groupedTransaction {
    return [
      {'label': 'Veículo', 'value': vehicleCount},
      {'label': 'Cliente', 'value': clientCount},
      {'label': 'Aluguéis', 'value': rentCount},
      {'label': 'Gerentes', 'value': managerCount},
    ];
  }

  double get totalCount {
    return groupedTransaction.fold(0.0, (sum, item) {
      return sum + (item['value'] as double);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      
      margin: EdgeInsets.all(20),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: groupedTransaction.map((tr) {
            return Flexible(
              fit: FlexFit.tight,
              child: ChartBar(
                label: tr['label'].toString(),
                value: tr['value'],
                percentage: totalCount == 0
                    ? 0
                    : (tr['value'] as double) / totalCount,
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}