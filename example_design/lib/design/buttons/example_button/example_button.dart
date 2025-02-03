import 'package:example_design/design/design.theme.dart';
import 'package:flutter/material.dart';
import 'example_button.style.dart';

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
    final currentStyle = (style ?? context.designTheme.buttonsStyle.exampleButtonStyle);
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
