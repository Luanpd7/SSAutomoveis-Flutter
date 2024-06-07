import 'package:flutter/material.dart';

///Essa classe é o filho da classe settings que 
///contém os itens da tela de configuraçoes.

class ItemSettings extends StatelessWidget {
  final String title;
  final String? subtitle;
  final String? subtitle2;
  final String? label2;

  final String? label;

  ItemSettings({
    required this.title,
    this.subtitle,
    this.subtitle2,
    this.label,
    this.label2,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            Row(
              children: [
                Text(
                  subtitle!,
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
               const SizedBox(
                  width: 5,
                ),
                if (label != null)
                  Text(
                    label!,
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
              ],
            ),
            if (label2 != null)
              Row(
                children: [
                  Text(
                    subtitle2!,
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                 const SizedBox(
                    width: 5,
                  ),
                  Text(
                    label2!,
                    style: Theme.of(context).textTheme.bodySmall,
                  )
                ],
              )
          ],
        ),
      ),
    );
  }
}
