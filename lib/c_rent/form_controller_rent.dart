import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/form/form_button.dart';
import '../components/form/form_drop.dart';
import 'package:ss_automveis/components/form/form_drop_rent.dart';
import '../components/form/form_text.dart';
import '../models/client.dart';
import '../models/manager.dart';
import '../models/vehicle.dart';
import '../provider/add_provider/form_add_manager_provider.dart';
import '../provider/add_provider/form_add_rent_provider.dart';
import '../provider/client_provider.dart';
import '../provider/update_provider/form_update_manager_provider.dart';
import '../provider/vehicle_provider.dart';
import '../services/input_formatter.dart';

///[FormsControllerRent] controla o formulário de adicionar ou editar
/// do manager, essa classe estará esperando um valor  booleano no qual
/// for verdadeiro sera usado o formulario de editar se não para adicionar,
/// e após inserir se as informações estiverem corretas, irão pro banco.

class FormsControllerRent extends StatelessWidget {
  var maskFormatter = InputFormatter();

  final bool isEditing;
  final Manager? manager;

  FormsControllerRent({required this.isEditing, this.manager});

  @override
  Widget build(BuildContext context) {
    final clientState = Provider.of<ClientProvider>(context, listen: false);
    final state = Provider.of<VehicleProvider>(context, listen: false);

    clientState.select();

    var listClients = clientState.list;
    var listVehicles = state.listVehicle;

    return ChangeNotifierProvider<FormAddRentProvider>(
      create: (context) => FormAddRentProvider(),
      child: Consumer<FormAddRentProvider>(
        builder: (context, formProvider, _) {
          return Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  FormDropRent<Client>(
                    labelDrop: 'Cliente',
                    items: listClients,
                    value: formProvider.selectedClient,
                    onChanged: (value) {
                      if (value != null) {
                        formProvider.setClient(value);
                      }
                    },
                    itemAsString: (client) => client.razaoSocial,
                  ),
                  FormDropRent<Vehicle>(
                    labelDrop: 'Veículo',
                    items: listVehicles,
                    value: formProvider.selectedVehicle,
                    onChanged: (value) {
                      if (value != null) {
                        formProvider.setVehicle(value);
                      }
                    },
                    itemAsString: (vehicle) => vehicle.modelo,
                  ),
                  FormText(
                      inputFormatters: [maskFormatter.phoneMaskFormatter],
                      label: 'Data de início',
                      controller: formProvider.initController,
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (date != null) {
                          formProvider.dateInit = date;
                          formProvider.setDataInit();
                        }
                      }),
                  FormText(
                      inputFormatters: [maskFormatter.phoneMaskFormatter],
                      label: 'Data de devolução',
                      controller: formProvider.findController,
                      onTap: () async {
                        final date = await showDatePicker(
                          context: context,
                          initialDate: DateTime.now(),
                          firstDate: DateTime(2000),
                          lastDate: DateTime(2101),
                        );
                        if (date != null) {
                          formProvider.dateFind = date;
                          formProvider.setDataFind();
                        }
                      }),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FormButton(
                        labelButton: 'Cancelar',
                        onPressed: () {
                          if (isEditing) {
                            formProvider;
                          } else {
                            (formProvider as FormAddManagerProvider)
                                .cleanText();
                          }
                        },
                      ),
                      FormButton(
                        labelButton: isEditing ? 'Salvar' : 'Salvar',
                        onPressed: () {
                          formProvider.saveForm();
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
