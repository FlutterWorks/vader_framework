import 'package:flutter/material.dart';
import '{{name.snakeCase()}}.style.dart';

class {{name.pascalCase()}} extends StatelessWidget {
  const {{name.pascalCase()}}({
    super.key,
    required this.text,
    this.icon,
    this.onTap,
    this.style,
  });

  final String text;
  final IconData? icon;
  final GestureTapCallback? onTap;
  final {{name.pascalCase()}}Style? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;
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
