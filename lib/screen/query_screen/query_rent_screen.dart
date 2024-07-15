import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../components/form/form_button.dart';
import '../../components/query/query_item.dart';
import '../../components/query/query_item_icone.dart';
import '../../models/rent.dart';
import '../../provider/pdf_provider.dart';
import '../../provider/rent_provider.dart';
import '../pdf_screen.dart';

///[QueryManagerScreen] é a tela resposável pela consulta
///geral de um gerente, sendo passado o cliente pelo construtor

// ignore: must_be_immutable
class QueryRentScreen extends StatelessWidget {
  QueryRentScreen({required this.rent});

  Rent rent;

  @override
  Widget build(BuildContext context) {
    String _formatDateToBrasilia(DateTime date) {
      final DateTime dateTimeInBrasilia = date.toUtc().add(Duration(hours: -3));
      return DateFormat('dd/MM/yyyy HH:mm').format(dateTimeInBrasilia);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:
            Text('Aluguel'),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Consumer<PDFProvider>(
        builder: (BuildContext context, pdfProvider, Widget? child) {  
        return Consumer<RentProvider>(
          builder: (context, managerState, _) {
            managerState.select();
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        QueryItem(
                          title: 'Cliente',
                          subtitle: rent.clientId.toString(),
                        ),
                        QueryItem(title: 'Data Início', subtitle: DateFormat('dd/MM/yyyy').format(rent.dataInicio)),
                         QueryItem(
                            title: 'Data de Registro',
                            subtitle:
                                _formatDateToBrasilia(rent.dataRegistro)),
                        FormButton(
                          labelButton: 'Gerar Comprovante',
                          onPressed: () async {
              final pdfFile = await pdfProvider.generatePDF(rent);
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => PDFViewerPage(pdfFile: pdfFile),
                ),
              );
            },),
                        
                      ],
                    ),
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        QueryItem(title: 'veiculo', subtitle: rent.vehicleId.toString()),
                        QueryItem(title: 'Data Devolução', subtitle:  DateFormat('dd/MM/yyyy').format(rent.dataFim)),
                        QueryItem(
                            title: 'Comissão', subtitle: '${rent.comissao}'),
                        QueryItemIcone(
                          icon: Icons.edit,
                          onTap: () async {
                          /*  await Navigator.of(context).pushNamed(
                              AppRoute.updateManager,
                              arguments: manager,
                            );*/
        
                          }
                        ),
                      ],
                  
                    ),
                  ),
                 
                  
                ],
              ),
            );
          },
        );
        }
      ),
    );
  }
}
