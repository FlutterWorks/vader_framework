import 'package:flutter/material.dart';
import 'example_text.style.dart';

class ExampleText extends StatelessWidget {
  const ExampleText({
    super.key,
    required this.text,
    this.style,
  });

  final String text;
  final ExampleTextStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 40),
      children: [
        _Item(child: Text(text, style: currentStyle.title1)),
        _Item(child: Text(text, style: currentStyle.title2)),
        _Item(child: Text(text, style: currentStyle.body1)),
        _Item(child: Text(text, style: currentStyle.body2)),
      ],
    );
  }
}

class _Item extends StatelessWidget {
  const _Item({super.key, required this.child});

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: child,
    );
  }
}
