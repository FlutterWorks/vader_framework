import 'dart:ui';

import 'package:color_palette_plus/color_palette_plus.dart';

final Map<String, Map<int, Color>> _colorMemory = {};

class DesignColor {
  const DesignColor(this.color);

  final Color color;

  Color getShade(int shade) {
    final colorIndex = "${color.a}${color.r}${color.g}${color.b}";
    if (!_colorMemory.containsKey(colorIndex)) {
      _colorMemory[colorIndex] = {};
    }
    if (!_colorMemory[colorIndex]!.containsKey(shade)) {
      _colorMemory[colorIndex]![shade] = ColorPalette.getShade(color, shade);
    }

    return _colorMemory[colorIndex]![shade]!;
  }

  Color get shade50 => getShade(50);

  Color get shade100 => getShade(100);

  Color get shade200 => getShade(200);

  Color get shade300 => getShade(300);

  Color get shade400 => getShade(400);

  Color get shade500 => getShade(500);

  Color get shade600 => getShade(600);

  Color get shade700 => getShade(700);

  Color get shade800 => getShade(800);

  Color get shade900 => getShade(900);
}
