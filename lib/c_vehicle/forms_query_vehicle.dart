import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../components/form_button.dart';
import '../components/form_drop.dart';
import '../components/form_radio.dart';
import '../components/form_text.dart';
import '../provider/form_query_vehicle_provider.dart';
import '../routes/appRoutes.dart';

class FormsQueryVehicle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<FormsQueryVehicleProvider>(
        builder: (context, formRegisterProvider, _) {
      return Center(
          child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            FormText(
                label: 'Marca',
                controller: formRegisterProvider.marcaController),
            FormText(
              label: 'Modelo',
              controller: formRegisterProvider.modeloController,
            ),
            FormText(
              label: 'Placa',
              controller: formRegisterProvider.placaController,
            ),
            FormDrop(
              labelDrop: 'Ano de Fabricação',
              items: formRegisterProvider.anos,
              value: formRegisterProvider.selectedYear ?? '',
              onChanged: (newValue) {
                formRegisterProvider.setAno(newValue);
              },
            ),
            FormDrop(
              labelDrop: 'Diária',
              items: formRegisterProvider.diarias,
              value: formRegisterProvider.selectedDiary ?? '',
              onChanged: (newValue) {
                formRegisterProvider.setDiaria(newValue);
              },
            ),
            FormRadio(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FormButton(
                  labelButton: 'Filtrar',
                  onPressed: () {
                    Navigator.pushNamed(context, AppRoute.queryVehicles);
                  },
                ),
                FormButton(
                    labelButton: 'Novo Veículo',
                    onPressed: () {
                      Navigator.pushNamed(context, AppRoute.addVehicle);
                      
                    })
              ],
            )
          ],
        ),
      ));
    });
  }
}
