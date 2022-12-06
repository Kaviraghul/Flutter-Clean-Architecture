import 'package:flutter/animation.dart';

import 'package:flutter/material.dart';

class ColorManager {
  static Color primary          = HexColor.fromHex('#ffffff');
  static Color darkGrey         = HexColor.fromHex('#525252');
  static Color grey             = HexColor.fromHex('#737477');
  static Color lightGrey        = HexColor.fromHex('#9E9E9E');
  static Color blue             = HexColor.fromHex('#4c63ae');
  static Color primaryOpacity70 = HexColor.fromHex('#B3ED9728');

  // new colors
  static Color darkPrimary      = HexColor.fromHex('#d17d11');
  static Color grey1            = HexColor.fromHex('#707070');
  static Color grey2            = HexColor.fromHex('#797979');
  static Color white            = HexColor.fromHex('#FFFFFF');
  static Color error            = HexColor.fromHex('#E61F34');
}

extension HexColor on Color {
  static Color fromHex(String hexColorString) {
    hexColorString = hexColorString.replaceAll('#', '');
    if (hexColorString.length == 6) {
      hexColorString = "0xFF$hexColorString";
    }else if (hexColorString.length == 8) {
      hexColorString = "0x$hexColorString";
    }
    return Color(int.parse(hexColorString));
  }
}
