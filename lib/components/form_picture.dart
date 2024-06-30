import 'package:cross_file/src/types/interface.dart';
import 'package:flutter/material.dart';

class FormPicture extends StatelessWidget {
  final Future<void> Function()? onTap;

  FormPicture(/*XFile? photo,*/ {required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
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
