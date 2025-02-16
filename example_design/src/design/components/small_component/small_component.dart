import 'package:flutter/material.dart';
import 'small_component.style.dart';

class SmallComponent extends StatelessWidget {
  const SmallComponent({
    super.key,
    required this.text,
    this.onTap,
    this.style,
  });

  final String text;
  final GestureTapCallback? onTap;
  final SmallComponentStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;
    return GestureDetector(
      onTap: onTap,
      child: SizedBox(
        width: 200,
        height: 42,
        child: Text(text),
      ),
    );
  }
}
