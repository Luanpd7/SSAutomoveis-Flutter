import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/form_button.dart';
import '../components/form_drop.dart';
import '../components/form_picture.dart';
import '../components/form_text.dart';
import '../models/Vehicle.dart';
import '../provider/form_add_vehicle_provider.dart';
import '../provider/image_picker_provider.dart';
import '../services/input_formatter.dart';

class FormsControllerVehicle extends StatelessWidget {
  final bool isEditing;
  final Vehicle? vehicle;

  FormsControllerVehicle({required this.isEditing, this.vehicle});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FormAddVehicleProvider>(
      create: (context) => FormAddVehicleProvider()..initialize(context),
      child: Consumer<FormAddVehicleProvider>(
        builder: (context, formProvider, _) {
          if (formProvider.marcas.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          } else {
            return buildForm(context, formProvider);
          }
        },
      ),
    );
  }

  Widget buildForm(BuildContext context, FormAddVehicleProvider formProvider) {
    var maskFormatter = InputFormatter();
    return Center(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            isEditing
                ? FormText(
                    label: 'Marca',
                    controller: formProvider.marcaController,
                  )
                : FormDrop(
                    labelDrop: 'Marca',
                    items: formProvider.marcas.map((marca) => marca.nome).toList(),
                    value: formProvider.selectedMarca ?? '',
                    onChanged: (newValue) {
                      formProvider.setMarca(newValue, context);
                    },
                  ),
            FormDrop(
              labelDrop: 'Modelo',
              items: formProvider.modelos.map((model) => model['name']!).toList(),
              value: formProvider.selectedModelo ?? '',
              onChanged: (newValue) {
                formProvider.setModelo(newValue, context);
              },
            ),
            FormText(
              inputFormatters: [maskFormatter.plateMaskFormatter],
              label: 'Placa',
              controller: formProvider.placaController,
            ),
            FormDrop(
              labelDrop: 'Ano de Fabricao',
              items: formProvider.anos,
              value: formProvider.selectedAno ?? '',
              onChanged: (newValue) {
                formProvider.setAno(newValue, context);
              },
            ),
            FormText(
              label: 'Diária',
              controller: formProvider.diariaController,
              textInputType: TextInputType.number,
            ),
            FormPicture(
              onTap: () async {
                await Provider.of<ImagePickerProvider>(context, listen: false).getPhoto();
              },
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FormButton(
                  labelButton: 'Cancelar',
                  onPressed: () {
                    formProvider.cleanText();
                  },
                ),
                FormButton(
                  labelButton: 'Salvar',
                  onPressed: () {
                    print('${formProvider.selectedModelo }');
                    print('${formProvider.selectedModelo }');
                    print('${formProvider.placaController.text }');
                    print('${formProvider.selectedAno}');
                    print('${formProvider.diariaController.text }');
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
