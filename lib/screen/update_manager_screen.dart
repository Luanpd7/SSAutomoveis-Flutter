import 'package:flutter/material.dart';

import '../c_manager/form_controller_manager.dart';
import '../models/manager.dart';

class UpdateManagerScreen extends StatelessWidget {
  UpdateManagerScreen();
  @override
  Widget build(BuildContext context) {
    var manager = ModalRoute.of(context)!.settings.arguments as Manager;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Editar Manager',
          style: Theme.of(context).textTheme.titleMedium,
        ),
        backgroundColor: Theme.of(context).primaryColor,
      ),
      backgroundColor: Theme.of(context).canvasColor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15),
          child: Container(
            height: 680,
            width: 380,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(23),
            ),
            child: FormsControllerManager(
              isEditing: true,
              manager: manager,
            ),
          ),
        ),
      ),
    );
  }
}
