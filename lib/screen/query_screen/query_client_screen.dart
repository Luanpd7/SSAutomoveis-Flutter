import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import '../../components/query/query_item.dart';
import '../../components/query/query_item_icone.dart';
import '../../models/client.dart';
import '../../models/manager.dart';
import '../../provider/client_provider.dart';
import '../../routes/appRoutes.dart';

///[QueryClientScreen] é a tela resposável pela consulta
///geral de um cliente, sendo passado o cliente pelo construtor

// ignore: must_be_immutable
class QueryClientScreen extends StatelessWidget {
  QueryClientScreen({required this.client});

  Client client;

  @override
  Widget build(BuildContext context) {
    String _formatDateToBrasilia(DateTime date) {
      final DateTime dateTimeInBrasilia = date.toUtc().add(Duration(hours: -3));
      return DateFormat('dd/MM/yyyy HH:mm').format(dateTimeInBrasilia);
    }

    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(client.razaoSocial,
            style: Theme.of(context).textTheme.titleMedium),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Consumer<ClientProvider>(
        builder: (context, clientState, _) {
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
                        title: 'Razão Social',
                        subtitle: client.razaoSocial,
                      ),
                      QueryItem(title: 'Cidade', subtitle: client.cidade),
                      QueryItem(title: 'Telefone', subtitle: client.telefone),
                      QueryItem(
                          title: 'Data de Registro',
                          subtitle:
                              _formatDateToBrasilia(client.dataRegistro!)),
                      QueryItemIcone(
                        icon: Icons.delete,
                        onTap: () async {
                          await clientState.delete(
                            client,
                          );
                          Navigator.pop(context);
                        },
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      QueryItem(title: 'CNPJ', subtitle: client.cnpj),
                      QueryItem(title: 'Estado', subtitle: client.estado),
                      FutureBuilder<Manager?>(
                    future: Provider.of<ClientProvider>(context, listen: false)
                        .getManagerByState(client.estado),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return QueryItem(title: 'Gerente', subtitle: 'Carregando...');
                      } else if (snapshot.hasError) {
                        return QueryItem(title: 'Gerente', subtitle: 'Erro ao carregar');
                      } else if (!snapshot.hasData || snapshot.data == null) {
                        return QueryItem(title: 'Gerente', subtitle: 'Não encontrado');
                      } else {
                        return QueryItem(title: 'Gerente', subtitle: snapshot.data!.nome);
                      }
                    },
                  ),
                      QueryItem(title: '', subtitle: ''),
                      QueryItemIcone(
                        icon: Icons.edit,
                        onTap: () => Navigator.of(context).pushNamed(
                          AppRoute.updateClient,
                          arguments: client,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
