import 'package:flutter/material.dart';

class FormUpdateManagerProvider with ChangeNotifier {
  final TextEditingController cpfController = TextEditingController();
  final TextEditingController nomeController = TextEditingController();
  final TextEditingController telefoneController = TextEditingController();
  final TextEditingController estadoController = TextEditingController();
  final TextEditingController percentualController = TextEditingController();

  Future<void> updateForm(BuildContext context) async {
    print('editando');
  }
}
