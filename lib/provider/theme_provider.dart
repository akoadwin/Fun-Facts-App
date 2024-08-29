import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  bool isDarkModeChecked = false;
  String dataToUpdate = "Hello this is from Global State ";

  void updateStringData({required String data}) {
    dataToUpdate = data;
    notifyListeners();
  }

  void updateThemeMode({required bool setDarkMode}) async {
    isDarkModeChecked = setDarkMode;
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isDarkMode', setDarkMode);

    notifyListeners();
  }

  void loadMode() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    isDarkModeChecked = prefs.getBool('isDarkMode') ?? true;
    notifyListeners();
  }
}
