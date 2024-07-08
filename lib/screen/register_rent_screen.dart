import 'package:flutter/material.dart';
import '../c_rent/forms_query_rent.dart';

///Essa classe será responsavel para ser a tela
///de registro do gerente, o usuário poderá
///tanto cadastrar um novo gerente e também filtrar.

class RegisterRentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Aluguéis',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Container(
              height: 680,
              width: 380,
              decoration: BoxDecoration(
                  color: Theme.of(context).hintColor,
                  borderRadius: BorderRadius.circular(23)),
              child: FormsQueryRent(),
            ),
          ),
        ),
      ),
    );
  }
}
