import 'package:flutter/material.dart';

class HexColor extends Color {
  HexColor(String hexColor) : super(getColorFromHex(hexColor));

  static int getColorFromHex(String hexColor) {
    var color = hexColor.toUpperCase().replaceAll('#', '');

    if (hexColor.length == 6) {
      color = 'FF$hexColor';
    }

    return int.parse(color, radix: 16);
  }
}
