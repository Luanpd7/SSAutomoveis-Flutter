import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class ImagePickerProvider with ChangeNotifier {
  XFile? _photo;

  XFile? get photo => _photo;

  Future<void> getPhoto() async {
    final ImagePicker picker = ImagePicker();

    try {
      XFile? file = await picker.pickImage(source: ImageSource.gallery);
      if (file != null) {

        final directory = await getApplicationSupportDirectory();

        final String filePath = path.join(directory.path, path.basename(file.path));
                await file.saveTo(filePath);

        _photo = XFile(filePath);
        notifyListeners();
        print('Imagem salva em: $filePath');
      }
    } catch (e) {
      print('Erro ao selecionar imagem: $e');
    }
  }
  String? getImagePath() {
    return _photo?.path;
  }
}