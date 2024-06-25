import 'package:flutter/material.dart';

class FormPicture extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: () {print('acessando galeria');} ,
        child: Container(
          height: 150,
          width: 345,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(
              width: 2,
              color: const Color.fromRGBO(224, 224, 224, 1.0),
            ),
          ),
          child: const Center(
            child: Icon(
              Icons.add_photo_alternate_rounded,
              size: 40,
              color: Color.fromRGBO(134, 128, 128, 1.0),
            ),
          ),
        ),
      ),
    );
  }
}
