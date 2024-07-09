import 'package:flutter/material.dart';

class DashboardItem extends StatelessWidget {
  int listLenght;
  String label;

  DashboardItem({required this.listLenght, required this.label});

  @override
  Widget build(BuildContext context) {
    return Container(
     
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [
                Colors.red.withOpacity(0.5),
                Colors.red
              ],
              begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            ),
        borderRadius: BorderRadius.all(Radius.circular(10)
        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text(listLenght.toString(), style: TextStyle(color: Colors.white, fontSize: 40.0),),
          ),
          Center(
            child: Text(label, style: Theme.of(context).textTheme.titleMedium, ),
          ),
        ],
      ),
    );
  }
}
