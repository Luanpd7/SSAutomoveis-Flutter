
import 'dart:io';

import 'package:flutter/material.dart';

import '../models/vehicle.dart';

class BuildListVehicle extends StatelessWidget {
final Vehicle vehicle;
final VoidCallback?  onTap;

BuildListVehicle({required this.vehicle, this.onTap});

 @override
  Widget build(BuildContext context) {
    return InkWell(
       onTap: onTap,
      child:  Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
        elevation: 4,
        margin: const EdgeInsets.all(10),
        child: Column(
          children: [
            Stack(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                  child: Image.file(
                  File(vehicle.imagePath),
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: Container(
                    width: 300,
                    color: Colors.black54,
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20
                    ),
                    child: Text(
                      vehicle.modelo,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white
                      ),
                      softWrap: true,
                      overflow: TextOverflow.fade,
                    ),
                  ),
                )
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                 mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                 
                  Row(
                    children: [
                      Icon(Icons.toys_sharp),
                      SizedBox(width: 6),
                      Text("${vehicle.modelo.split(' ')[0]}"),
                    
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.calendar_month_outlined),
                      SizedBox(width: 6),
                      Text("${vehicle.ano.split(' ')[0]}"),
                    
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.attach_money),
                      SizedBox(width: 6),
                      Text("${vehicle.diaria}"),
                    
                    ],
                  )
                ],
              ),
              )
          ],
        ),
        ),
    );
  }
}



 