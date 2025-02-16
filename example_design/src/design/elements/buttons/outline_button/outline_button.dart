import 'package:example_design/example_design.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class OutlineButton extends StatelessWidget {
  const OutlineButton({
    super.key,
    required this.text,
    required this.size,
    this.icon,
    this.leadingIcon = true,
    this.onTap,
    this.style,
  });

  final String text;
  final ButtonSize size;
  final IconData? icon;
  final bool leadingIcon;
  final GestureTapCallback? onTap;
  final OutlineButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;

    final (:buttonSize, :textStyle, :borderRadius) = ButtonUtils.resolveBySize(size);

    final buttonIcon = icon == null
        ? null
        : switch (size) {
            ButtonSize.small => Icon(icon, size: 18, color: currentStyle.iconColor),
            ButtonSize.medium => Icon(icon, size: 22, color: currentStyle.iconColor),
            ButtonSize.large => Icon(icon, size: 22, color: currentStyle.iconColor),
          };

    return ShadButton.outline(
      size: buttonSize,
      onPressed: onTap,
      orderPolicy: leadingIcon ? OrderPolicy.linear() : OrderPolicy.reverse(),
      icon: buttonIcon,
      hoverBackgroundColor: currentStyle.secondaryColor,
      backgroundColor: currentStyle.secondaryColor,
      decoration: ShadDecoration(
        border: ShadBorder.all(
          width: size == ButtonSize.small ? 2.5 : 3,
          color: currentStyle.primaryColor,
          radius: borderRadius,
        ),
      ),
      child: Text(text, style: textStyle.copyWith(color: currentStyle.textColor)),
    );
  }
}
