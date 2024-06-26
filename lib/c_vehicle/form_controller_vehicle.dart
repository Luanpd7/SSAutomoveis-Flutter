import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/form_button.dart';
import '../components/form_drop.dart';
import '../components/form_picture.dart';
import '../components/form_text.dart';
import '../models/Vehicle.dart';
import '../provider/form_add_client_provider.dart';
import '../provider/form_add_vehicle_provider.dart';
import '../provider/form_update_vehicle_provider.dart';
import '../provider/image_picker_provider.dart';

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
                  isEditing
                      ? FormText(
                          label: 'Marca',
                          controller: isEditing
                              ? (formProvider as FormUpdateVehicleProvider)
                                  .marcaController
                              : (formProvider as FormAddVehicleProvider)
                                  .marcaController,
                        )
                      : FormDrop(
                          labelDrop: 'Marca',
                          items:
                              (formProvider as FormAddVehicleProvider).marcas,
                          value: (formProvider as FormAddVehicleProvider)
                                  .selectedMarca ??
                              '',
                          onChanged: (newValue) {
                            (formProvider as FormAddVehicleProvider)
                                .setMarca(newValue);
                          },
                        ),
                  isEditing
                      ? FormText(
                          label: 'Modelo',
                          controller: isEditing
                              ? (formProvider as FormUpdateVehicleProvider)
                                  .modeloController
                              : (formProvider as FormAddVehicleProvider)
                                  .modeloController,
                        )
                      : FormDrop(
                          labelDrop: 'Modelo',
                          items:
                              (formProvider as FormAddVehicleProvider).modelos,
                          value: (formProvider as FormAddVehicleProvider)
                                  .selectedModelo ??
                              '',
                          onChanged: (newValue) {
                            (formProvider as FormAddVehicleProvider)
                                .setModelo(newValue);
                          },
                        ),
                  FormText(
                    label: 'Placa',
                    controller: isEditing
                        ? (formProvider as FormUpdateVehicleProvider)
                            .placaController
                        : (formProvider as FormAddVehicleProvider)
                            .placaController,
                  ),
                  isEditing?
                                    FormText(
                    label: 'Ano de Fabricação',
                    controller: isEditing
                        ? (formProvider as FormUpdateVehicleProvider)
                            .placaController
                        : (formProvider as FormAddVehicleProvider)
                            .placaController,
                  ):  FormDrop(
                          labelDrop: 'Ano de Fabricação',
                          items:
                              (formProvider as FormAddVehicleProvider).anos,
                          value: (formProvider as FormAddVehicleProvider)
                                  .selectedAno ??
                              '',
                          onChanged: (newValue) {
                            (formProvider as FormAddVehicleProvider)
                                .setAno(newValue);
                          },
                        ),
                     
 

                  FormText(
                    label: 'Diária',
                    controller: isEditing
                        ? (formProvider as FormUpdateVehicleProvider)
                            .diariaController
                        : (formProvider as FormAddVehicleProvider)
                            .diariaController,
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
