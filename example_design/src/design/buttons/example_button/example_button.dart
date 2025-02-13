import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
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
    final currentStyle = style!;
    return ShadButton(
      onPressed: onTap,
      width: 350,
      height: 50,
      decoration: ShadDecoration(
        border: ShadBorder(
          radius: BorderRadius.circular(12),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}
