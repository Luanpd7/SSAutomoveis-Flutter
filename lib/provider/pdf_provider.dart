import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'dart:io';
import 'package:path_provider/path_provider.dart';
import '../../models/rent.dart';
import '../models/client.dart';
import '../models/manager.dart';
import '../models/vehicle.dart';
import '../repositories/rent_repository.dart';

class PDFProvider with ChangeNotifier {
  Future<File> generatePDF(Rent rent) async {
    final pdf = pw.Document();

     RentRepository rentRepository = RentRepository();
     Vehicle? vehicle = await rentRepository.getVehicle(rent.vehicleId);
     Client? client = await rentRepository.getClient(rent.clientId);
     Manager? manager = await rentRepository.getManager(client!.gerenteId ?? 0);
     
     final currencyFormat = NumberFormat.currency(locale: 'pt_BR', symbol: 'R\$');

    pdf.addPage(
      pw.Page(
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
                pw.Text('SS Automóveis', style: pw.TextStyle(fontSize: 24, fontWeight: pw.FontWeight.bold)),
              pw.SizedBox(height: 16),
              pw.Text('Comprovante de Aluguel', style: pw.TextStyle(fontSize: 20)),
              pw.SizedBox(height: 8),
              pw.Text('Data da Geração: ${DateFormat('dd/MM/yyyy').format(DateTime.now())}'),
              pw.SizedBox(height: 16),
              pw.Text('Dados do Cliente:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text('CNPJ: ${client.cnpj}'),
              pw.Text('Nome: ${client.razaoSocial}'),
              pw.Text('Cidade: ${client.cidade}'),
              pw.Text('Telefone: ${client.telefone}'), 
              pw.SizedBox(height: 16),
              pw.Text('Dados do Veículo:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text('Modelo: ${vehicle!.modelo}'),
              pw.Text('Marca: ${vehicle.marca}'),
              pw.Text('Ano: ${vehicle.ano}'),
              pw.Text('Ano: ${vehicle.placa}'),
          
              pw.SizedBox(height: 16),
              pw.Text('Dados do Gerente:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text('Nome: ${manager!.nome}'),
              pw.Text('CPF: ${manager.cpf}'),
              pw.Text('CPF: ${manager.telefone}'),
              pw.SizedBox(height: 16),
              pw.Text('Período do Aluguel:', style: pw.TextStyle(fontWeight: pw.FontWeight.bold)),
              pw.Text('Data de Início: ${DateFormat('dd/MM/yyyy').format(rent.dataInicio)}'),
              pw.Text('Data de Devolução: ${DateFormat('dd/MM/yyyy').format(rent.dataFim)}'),
              pw.SizedBox(height: 16),
              pw.Text('Total de Dias do Período: ${rent.dias}'),
             // pw.Text('Valor Pago na Diária: ${vehicle.dailyRate}'), // Supondo que vehicle.dailyRate existe
              pw.Text('Valor Total do Aluguel:  ${currencyFormat.format(rent.valorTotal)}'),
              pw.Text('Comissão:  ${currencyFormat.format(rent.comissao)}'),
            ],
          );
        },
      ),
    );
    
 

    final output = await getTemporaryDirectory();
    final file = File('${output.path}/comprovante_aluguel.pdf');
    await file.writeAsBytes(await pdf.save());
    return file;
  }


}