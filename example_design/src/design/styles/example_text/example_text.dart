import 'package:flutter/material.dart';
import 'example_text.style.dart';

enum TextType {
  title1,
  title2,
  title3,
  body1,
  body2,
  caption1,
  caption2,
}

class ExampleText extends StatelessWidget {
  const ExampleText({
    super.key,
    required this.text,
    required this.type,
    this.style,
  });

  final String text;
  final TextType type;
  final ExampleTextStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;

    TextStyle textStyle = switch (type) {
      TextType.title1 => currentStyle.title1,
      TextType.title2 => currentStyle.title2,
      TextType.title3 => currentStyle.title3,
      TextType.body1 => currentStyle.body1,
      TextType.body2 => currentStyle.body2,
      TextType.caption1 => currentStyle.caption1,
      TextType.caption2 => currentStyle.caption2,
      null => throw UnimplementedError(),
    };
    return Text(text, style: textStyle);
  }
}