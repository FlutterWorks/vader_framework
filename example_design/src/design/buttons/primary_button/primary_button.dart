import 'package:example_design/example_design.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton({
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
  final PrimaryButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;

    final (:buttonSize, :textStyle, :borderRadius) = ButtonUtils.resolveBySize(size);

    final buttonIcon = icon == null ? null : switch (size) {
      ButtonSize.small => Icon(icon, size: 18),
      ButtonSize.medium => Icon(icon, size: 22),
      ButtonSize.large => Icon(icon, size: 22),
    };

    final shadDecoration = ShadTheme.of(context).primaryButtonTheme.decoration;

    return ShadButton(
      size: buttonSize,
      onPressed: onTap,
      orderPolicy: leadingIcon ? OrderPolicy.linear() : OrderPolicy.reverse(),
      icon: buttonIcon,
      decoration: ShadDecoration(
        border: shadDecoration?.border?.copyWith(radius: borderRadius),
      ),
      child: Text(text, style: textStyle),
    );
  }
}