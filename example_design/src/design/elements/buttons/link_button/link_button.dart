import 'package:example_design/example_design.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class LinkButton extends StatelessWidget {
  const LinkButton({
    super.key,
    required this.text,
    this.icon,
    this.width = double.infinity,
    this.gap = 4,
    this.leadingIcon = true,
    this.onTap,
    this.style,
  });

  final String text;

  final double width;
  final double gap;
  final IconData? icon;
  final bool leadingIcon;
  final GestureTapCallback? onTap;
  final LinkButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;

    return ShadButton.ghost(
      onPressed: onTap,
      width: width,
      orderPolicy: leadingIcon ? OrderPolicy.linear() : OrderPolicy.reverse(),
      icon: icon == null ? null : Icon(icon, size: currentStyle.iconSize, color: currentStyle.iconColor),
      gap: gap,
      padding: EdgeInsets.zero,
      child: Text(
        text,
        style: TextStyle(
          fontFamily: 'Inter',
          fontWeight: currentStyle.fontWeight,
          fontSize: currentStyle.textSize,
          color: currentStyle.textColor,
          height: 0.3,
          decoration: TextDecoration.underline,
          decorationColor: currentStyle.textColor,
          letterSpacing: 0.3,
        ),
      ),
    );
  }
}
