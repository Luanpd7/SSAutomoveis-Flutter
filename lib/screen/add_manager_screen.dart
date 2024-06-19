import 'package:flutter/material.dart';

class AddManagerScreen extends StatelessWidget {
  const AddManagerScreen({super.key});

  
    @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text(
          'Cadastrar Gerente',
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
           // child: FormsControllerClient(
            //  isEditing: false,
           // ),
          ),
        ),
      ),
    );
  }
  }
