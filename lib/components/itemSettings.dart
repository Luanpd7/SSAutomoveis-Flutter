import 'package:flutter/material.dart';

class ItemSettings extends StatelessWidget {
  final String title;
  final String subtitle;
  final String? label;

   ItemSettings({required this.title, required this.subtitle, this.label});

  @override
  Widget build(BuildContext context) {
    return Padding(padding: EdgeInsets.all(15),
     child: Container(
      child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title, style: Theme.of(context).textTheme.titleLarge,),
          Row(
            children: [
               Text(subtitle, style: Theme.of(context).textTheme.bodyMedium,),
               SizedBox(width: 5,),
               Text(label!, style: Theme.of(context).textTheme.bodySmall,)
            ],
          ),
          

        ],
      ),
     ),
    );
  }
}