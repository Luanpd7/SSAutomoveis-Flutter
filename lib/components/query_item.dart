import 'package:flutter/material.dart';

///[QueryItem] gerencia o titulo e o subtitulo da tela
///['QueryClientScreen'] que por lá será passado o titulo
///e a informção do objeto.

class QueryItem extends StatelessWidget {
  String title;
  String subtitle;

  QueryItem({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          title,
          style: Theme.of(context).textTheme.headlineSmall,
        ),
        Text(
          subtitle,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ],
    );
  }
}
