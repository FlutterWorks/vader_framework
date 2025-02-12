
import 'package:example_design/design/buttons/my_button/my_button.style.dart';

import 'package:flutter/material.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'buttons.style.tailor.dart';

@TailorMixin()
class ButtonsStyle extends ThemeExtension<ButtonsStyle> with _$ButtonsStyleTailorMixin {
  const ButtonsStyle({
    required this.myButtonStyle,
  });


  @override
  @themeExtension
  final MyButtonStyle myButtonStyle;
}
