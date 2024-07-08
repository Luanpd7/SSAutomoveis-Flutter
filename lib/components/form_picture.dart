import 'dart:io';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../provider/image_picker_provider.dart';

class FormPicture extends StatelessWidget {
  final Future<void> Function()? onTap;

  FormPicture({required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GestureDetector(
        onTap: onTap,
        child: Consumer<ImagePickerProvider>(
          builder: (context, provider, child) {
            return Container(
              height: 150,
              width: 345,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  width: 2,
                  color: const Color.fromRGBO(224, 224, 224, 1.0),
                ),
              ),
              child: provider.photo == null
                  ? const Center(
                      child: Icon(
                        Icons.add_photo_alternate_rounded,
                        size: 40,
                        color: Color.fromRGBO(134, 128, 128, 1.0),
                      ),
                    )
                  : ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.file(
                        File(provider.photo!.path),
                        fit: BoxFit.cover,
                      ),
                    ),
            );
          },
        ),
      ),
    );
  }
}
