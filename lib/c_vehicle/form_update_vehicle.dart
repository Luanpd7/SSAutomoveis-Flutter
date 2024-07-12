import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/form/form_button.dart';
import '../components/form/form_picture.dart';
import '../components/form/form_text.dart';
import '../models/vehicle.dart';
import '../provider/update_provider/form_update_vehicle_provider.dart';
import '../provider/image_picker_provider.dart';
import '../services/input_formatter.dart';

/// A classe [FormsUpdateControllerVehicle] é responsável pelo formulário de
/// atualização de veículos. Decidi criar essa classe separada da
/// [FormsControllerVehicle] pois a implementação estava se tornando muito
/// extensa e confusa. Essa separação melhora a manutenibilidade e a clareza
/// do código.

class FormsUpdateControllerVehicle extends StatelessWidget {
  var maskFormatter = InputFormatter();

  final Vehicle? vehicle;

  FormsUpdateControllerVehicle({required this.vehicle});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ChangeNotifier>(
      create: (context) => FormUpdateVehicleProvider(vehicle!),
      child: Consumer<ChangeNotifier>(builder: (context, formProvider, _) {
        return Center(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FormText(
                  label: 'Marca',
                  controller: (formProvider as FormUpdateVehicleProvider)
                      .marcaController,
                ),
                FormText(
                  label: 'Modelo',
                  controller: (formProvider as FormUpdateVehicleProvider)
                      .modeloController,
                ),
                FormText(
                    inputFormatters: [maskFormatter.plateMaskFormatter],
                    label: 'Placa',
                    controller: (formProvider as FormUpdateVehicleProvider)
                        .placaController),
                FormText(
                
                  label: 'Ano',
                  controller:
                      (formProvider as FormUpdateVehicleProvider).anoController,
                ),
                FormText(
                     inputFormatters: [maskFormatter.realMaskFormatter],
                  label: 'Diária',
                  controller: (formProvider as FormUpdateVehicleProvider)
                      .diariaController,
                  textInputType: TextInputType.number,
                ),
                FormPicture(
                  onTap: () async {
                    await Provider.of<ImagePickerProvider>(context,
                            listen: false)
                        .getPhoto();
                  },
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FormButton(
                      labelButton: 'Cancelar',
                      onPressed: () {
                        (formProvider as FormUpdateVehicleProvider).cleanText();
                      },
                    ),
                    FormButton(
                      labelButton: 'Salvar',
                      onPressed: () {
                        (formProvider as FormUpdateVehicleProvider)
                            .updateForm(context, vehicle!);
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
