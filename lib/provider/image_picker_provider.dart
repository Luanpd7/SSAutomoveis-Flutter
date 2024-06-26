import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagePickerProvider with ChangeNotifier{
   XFile? photo;

  
  getPhoto() async{
    final ImagePicker picker = ImagePicker();

    try{
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if(file != null){
        photo = file;
      }
    } catch(e){
      print('erro');
    }
    notifyListeners();
  }
  
}