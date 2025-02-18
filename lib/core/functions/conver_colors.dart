
  import 'package:flutter/material.dart';

Color stringToColor(String colorString) {
    colorString = colorString.replaceAll("#", ""); // Remove "#" if present
    return Color(int.parse(colorString, radix: 16));
  }

  String colorToString(Color color) {
    return '#${color.value.toRadixString(16).padLeft(8, '0').toUpperCase()}';
  }