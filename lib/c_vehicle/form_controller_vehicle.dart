import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/form_button.dart';
import '../components/form_picture.dart';
import '../components/form_text.dart';
import '../models/Vehicle.dart';
import '../provider/form_add_client_provider.dart';
import '../provider/form_add_vehicle_provider.dart';
import '../provider/form_update_vehicle_provider.dart';

///[FormsControllerVehicle] controla o formulário de adicionar ou editar
/// do veiculo, essa classe estará esperando um valor  booleano no qual
/// for verdadeiro sera usado o formulario de editar se não para adicionar,
/// e após inserir se as informações estiverem corretas, irão pro banco.

class FormsControllerVehicle extends StatelessWidget {
  final bool isEditing;
  final Vehicle? vehicle;

  FormsControllerVehicle({required this.isEditing, this.vehicle});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) =>
          isEditing ? FormAddClientProvider() : FormAddVehicleProvider(),
      child: Consumer<ChangeNotifier>(
        builder: (context, formProvider, _) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FormText(
                    label: 'Marca',
                    controller: isEditing
                        ? (formProvider as FormUpdateVehicleProvider)
                            .marcaController
                        : (formProvider as FormAddVehicleProvider)
                            .marcaController,
                  ),
                  FormText(
                    label: 'Modelo',
                    controller: isEditing
                        ? (formProvider as FormUpdateVehicleProvider)
                            .modeloController
                        : (formProvider as FormAddVehicleProvider)
                            .modeloController,
                  ),
                  FormText(
                    label: 'Placa',
                    controller: isEditing
                        ? (formProvider as FormUpdateVehicleProvider)
                            .placaController
                        : (formProvider as FormAddVehicleProvider)
                            .placaController,
                  ),
                  FormText(
                    label: 'Diária',
                    controller: isEditing
                        ? (formProvider as FormUpdateVehicleProvider)
                            .diariaController
                        : (formProvider as FormAddVehicleProvider)
                            .diariaController,
                  ),
                  FormPicture(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FormButton(
                        labelButton: 'Cancelar',
                        onPressed: () {
                          if (isEditing) {
                            (formProvider as FormUpdateVehicleProvider);
                          } else {
                            (formProvider as FormAddVehicleProvider)
                                .cleanText();
                          }
                        },
                      ),
                      FormButton(
                        labelButton: isEditing ? 'Salvar' : 'Salvar',
                        onPressed: () {
                          /*     if (isEditing) {
                            (formProvider as FormUpdateVehicleProvider)
                                .updateForm(context);
                          } else {
                            (formProvider as FormAddVehicleProvider)
                                .saveForm(context);
                          }*/
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
