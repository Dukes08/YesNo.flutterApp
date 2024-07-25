import 'package:flutter/material.dart';

//* the underscore makes the variable available only in this file
const Color _customColor = Colors.blueAccent;
//* this array allows the apps to have multiple scheme colors
const List<Color> _colorThemes = [
  _customColor,
  Colors.black,
  Colors.yellow,
  Colors.green,
  Colors.lime,
  Colors.blueGrey,
];

class AppTheme {
  //*with this parameters we allow the user to change the theme-color
  final int selectedColor;
//* using the assertion we ensure or validate the users input
  AppTheme({this.selectedColor = 0})
      : assert(selectedColor >= 0 && selectedColor <= _colorThemes.length - 1,
            'colors must be between 0 and ${_colorThemes.length}');

  ThemeData theme() {
    return ThemeData(colorSchemeSeed: _colorThemes[selectedColor]);
  }
}
