import 'dart:ffi';

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

    final buttonSize = switch (size) {
      ButtonSize.small => ShadButtonSize.sm,
      ButtonSize.medium => ShadButtonSize.regular,
      ButtonSize.large => ShadButtonSize.lg,
    };

    final textStyle = switch (size) {
      ButtonSize.small => ButtonTextStyles.smallButtonTextStyle,
      ButtonSize.medium => ButtonTextStyles.mediumButtonTextStyle,
      ButtonSize.large => ButtonTextStyles.largeButtonTextStyle,
    };

    final borderRadius = switch (size) {
      ButtonSize.small => BorderRadius.circular(6),
      ButtonSize.medium => BorderRadius.circular(6),
      ButtonSize.large => BorderRadius.circular(12),
    };

    final shadDecoration = ShadTheme.of(context).primaryButtonTheme.decoration;

    return ShadButton(
      size: buttonSize,
      onPressed: onTap,
      orderPolicy: leadingIcon ? OrderPolicy.linear() : OrderPolicy.reverse(),
      icon: icon == null ? null : Icon(icon),
      decoration: ShadDecoration(
        border: shadDecoration?.border?.copyWith(radius: borderRadius),
      ),
      child: Text(text, style: textStyle),
    );
  }
}

class ButtonTextStyles {
  static const TextStyle largeButtonTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 16,
    fontWeight: FontWeight.w600,
  );

  static const TextStyle mediumButtonTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontSize: 12,
    fontWeight: FontWeight.w700,
  );

  static const TextStyle smallButtonTextStyle = TextStyle(
    fontFamily: 'Inter',
    fontWeight: FontWeight.w500,
    fontSize: 12,
  );
}
