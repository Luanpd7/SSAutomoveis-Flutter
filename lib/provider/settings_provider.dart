import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  late SharedPreferences _sharedPreferences;
  static const String appThemeModeKey = 'isLightTheme';

  bool _isLight = true;
  bool get isLight => _isLight;

  String currentTheme() {
    if (isLight == true) {
      return 'Claro';
    } else {
      return 'Escuro';
    }
  }

  SettingsProvider() {
    _loadPreferences();
  }

  Future<void> _loadPreferences() async {
    _sharedPreferences = await SharedPreferences.getInstance();
    _isLight = _sharedPreferences.getBool(appThemeModeKey) ?? true;
    notifyListeners();
  }

  void toggleTheme() {
    _isLight = !_isLight;
    _sharedPreferences.setBool(appThemeModeKey, _isLight);
    notifyListeners();
  }

  Icon currentIcon() {
    if (isLight == true) {
      return const Icon(Icons.sunny, size: 32);
    } else {
      return const Icon(
        Icons.dark_mode,
        size: 32,
      );
    }
  }

  Widget content() {
    return Switch(
      value: _isLight,
      onChanged: (value) {
        toggleTheme();
      },
    );
  }

  void showCustomDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Center(child: currentIcon()),
          content: content(),
          actions: [
            TextButton(
              child: Text('Fechar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }
}
