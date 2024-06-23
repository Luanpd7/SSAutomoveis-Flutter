import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/query_item.dart';
import '../components/query_item_icone.dart';
import '../models/manager.dart';
import '../provider/manager_provider.dart';
import '../routes/appRoutes.dart';

///[QueryManagerScreen] é a tela resposável pela consulta
///geral de um gerente, sendo passado o cliente pelo construtor

// ignore: must_be_immutable
class QueryManagerScreen extends StatelessWidget {
  QueryManagerScreen({required this.manager});

  Manager manager;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title:
            Text(manager.nome, style: Theme.of(context).textTheme.titleMedium),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: Consumer<ManagerProvider>(
        builder: (context, managerState, _) {
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
                        title: 'Nome',
                        subtitle: manager.nome,
                      ),
                      QueryItem(title: 'Telefone', subtitle: manager.telefone),
                      QueryItem(
                          title: 'Comissão', subtitle: manager.percentual),
                      QueryItemIcone(
                        icon: Icons.delete,
                        onTap: () async {
                          await managerState.delete(
                            manager,
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
                      QueryItem(title: 'CPF', subtitle: manager.cpf),
                      QueryItem(title: 'Estado', subtitle: manager.estado),
                      QueryItem(title: 'Data de Registro', subtitle: 'teste'),
                      QueryItemIcone(
                        icon: Icons.edit,
                        onTap: () => Navigator.of(context).pushNamed(
                          AppRoute.updateManager,
                          arguments: manager,
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
