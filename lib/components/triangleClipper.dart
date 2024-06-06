import 'dart:io';

import 'package:flutter/material.dart';

class Widget050 extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
     return ClipPath(
      clipper: MyClipper(),
      child: Container(
        width: double.infinity,
        height: 300,
            color:  Colors.grey,
          
        
      ),
     );
  }
}



  class MyClipper extends CustomClipper<Path>{
     @override
  Path getClip(Size size) {
     var path = Path();
    path.lineTo(0, size.height - 50);


    path.quadraticBezierTo(
      size.width * 0.25, size.height - 100,
      size.width * 0.5, size.height - 50,
    );

    path.quadraticBezierTo(
      size.width * 0.75, size.height,
      size.width, size.height - 50,
    );

    path.lineTo(size.width, 0);
    path.close();
    path.close();
         return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
   return false;
  }
  
  }


 


  
