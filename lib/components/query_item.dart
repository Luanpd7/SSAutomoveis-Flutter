import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class QueryItem extends StatelessWidget {
   String title;
   String subtitle;

   QueryItem({required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return Column(
      //mainAxisAlignment: MainAxisAlignment.center,
      //crossAxisAlignment: CrossAxisAlignment.center,
      children: [
     
        Text(title, style: Theme.of(context).textTheme.headlineSmall,),
        Text(subtitle, style: Theme.of(context).textTheme.headlineMedium,),
      ],
    );
  }
}