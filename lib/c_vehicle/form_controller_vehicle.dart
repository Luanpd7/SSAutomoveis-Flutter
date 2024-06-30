import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/form_button.dart';
import '../components/form_drop.dart';
import '../components/form_picture.dart';
import '../components/form_text.dart';
import '../models/Vehicle.dart';
import '../provider/form_add_vehicle_provider.dart';
import '../provider/image_picker_provider.dart';

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
            return Center(child: CircularProgressIndicator());
          } else {
            return buildForm(context, formProvider);
          }
        },
      ),
    );
  }

  Widget buildForm(BuildContext context, FormAddVehicleProvider formProvider) {
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
                    items: formProvider.marcas.map((brand) => brand.nome).toList(),
                    value: formProvider.selectedMarca ?? '',
                    onChanged: (newValue) {
                      formProvider.setMarca(context, newValue);
                    },
                  ),
            FormDrop(
              labelDrop: 'Modelo',
              items: formProvider.modelos,
              value: formProvider.selectedModelo ?? '',
              onChanged: (newValue) {
                formProvider.setModelo(newValue);
              },
            ),
            FormText(
              label: 'Placa',
              controller: formProvider.placaController,
            ),
            FormDrop(
              labelDrop: 'Ano de Fabricação',
              items: formProvider.anos,
              value: formProvider.selectedAno ?? '',
              onChanged: (newValue) {
                formProvider.setAno(newValue);
              },
            ),
            FormText(
              label: 'Diária',
              controller: formProvider.diariaController,
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
                    print('marca selecionada  ${formProvider.selectedMarca}');
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
