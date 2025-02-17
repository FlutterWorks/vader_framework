import 'package:example_design/example_design.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class Chip extends StatelessWidget {
  const Chip({
    super.key,
    required this.text,
    this.style,
  });

  final String text;
  final ChipStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;
    return ShadBadge(
      backgroundColor: DesignColors.blue200,
      padding: EdgeInsets.symmetric(vertical: 3, horizontal: 14),
      child: Text(text, style: currentStyle.textStyle),
    );
  }
}
