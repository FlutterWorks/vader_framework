import 'package:flutter/material.dart';
import 'package:example_design/design/design.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

part 'example_button.tailor.dart';

class ExampleButton extends StatelessWidget {
  const ExampleButton({
    super.key,
    required this.text,
    this.onTap,
    this.style,
  });

  final String text;
  final GestureTapCallback? onTap;
  final ExampleButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style ?? context.designTheme.buttonsStyle.exampleButtonStyle;
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 42,
        decoration: BoxDecoration(
          borderRadius: currentStyle.borderRadius,
          color: currentStyle.color,
        ),
        child: Center(
          child: Text(text, style: currentStyle.textStyle),
        ),
      ),
    );
  }
}

@tailorMixinComponent
class ExampleButtonStyle extends ThemeExtension<ExampleButtonStyle> with _$ExampleButtonStyleTailorMixin {
  const ExampleButtonStyle({
    required this.color,
    required this.textStyle,
    required this.borderRadius,
  });

  @override
  final Color color;

  @override
  final TextStyle textStyle;

  @override
  final BorderRadius borderRadius;
}