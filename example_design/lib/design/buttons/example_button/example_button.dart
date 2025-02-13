import 'package:example_design/design/design.theme.dart';
import 'package:flutter/material.dart';
import 'example_button.style.dart';

class ExampleButton extends StatelessWidget {
  const ExampleButton({
    super.key,
    required this.text,
    this.icon,
    this.onTap,
    this.style,
  });

  final String text;
  final IconData? icon;
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
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          spacing: 4,
          children: [
            if (icon != null) Icon(icon!, color: currentStyle.iconColor,),
            Text(text, style: currentStyle.textStyle),
          ],
        ),
      ),
    );
  }
}
