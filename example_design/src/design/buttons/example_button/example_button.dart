import 'package:example_design/design/design.theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:vader_design/vader_design.dart';
import '../../../constants/colors.dart';
import 'example_button.style.dart';

enum ButtonSize { small, medium, large }

enum ButtonIndicator { normal, warning, error, success }

enum ButtonVariant { primary, outlined, link }

class ExampleButton extends StatelessWidget {
  const ExampleButton({
    super.key,
    required this.text,
    this.size = ButtonSize.large,
    this.variant = ButtonVariant.primary,
    this.indicator = ButtonIndicator.normal,
    this.leadingIcon,
    this.trailingIcon,
    this.onTap,
    this.style,
  });

  final String text;
  final ButtonSize size;
  final ButtonVariant variant;
  final ButtonIndicator indicator;

  final IconData? leadingIcon;
  final IconData? trailingIcon;
  final GestureTapCallback? onTap;
  final ExampleButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;

    final buttonVariant = switch (variant) {
      ButtonVariant.primary => ShadButtonVariant.primary,
      ButtonVariant.outlined => ShadButtonVariant.outline,
      ButtonVariant.link => ShadButtonVariant.link,
    };

    final buttonSize = switch (size) {
      ButtonSize.small => ShadButtonSize.sm,
      ButtonSize.medium => ShadButtonSize.regular,
      ButtonSize.large => ShadButtonSize.lg,
    };

    final textStyle = switch (size) {
      ButtonSize.small => TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.w500,
          color: indicator == ButtonIndicator.error ? DesignColors.red500 : null,
        ),
      ButtonSize.medium => TextStyle(
          fontFamily: 'Inter',
          fontSize: 12,
          fontWeight: FontWeight.w700,
          color: indicator == ButtonIndicator.error ? DesignColors.red500 : null,
        ),
      ButtonSize.large => TextStyle(
          fontFamily: 'Inter',
          fontSize: 16,
          fontWeight: FontWeight.w500,
          color: indicator == ButtonIndicator.error ? DesignColors.red500 : null,
        ),
    };

    ShadButtonTheme buttonTheme = variant == ButtonVariant.outlined
        ? ShadTheme.of(context).outlineButtonTheme
        : ShadTheme.of(context).primaryButtonTheme;

    if (indicator == ButtonIndicator.error && variant == ButtonVariant.outlined) {
      buttonTheme = buttonTheme.copyWith(
        backgroundColor: context.buttonsStyle.exampleButtonStyle.outlineErrorButton.backgroundColor,
        hoverBackgroundColor: context.buttonsStyle.exampleButtonStyle.outlineErrorButton.backgroundColor,
        decoration: context.buttonsStyle.exampleButtonStyle.outlineErrorButton.decoration!,
      );
    }

    buttonTheme = buttonTheme.copyWith(
      decoration: buttonTheme.decoration!.copyWith(
        border: buttonTheme.decoration!.border!.copyWith(
          radius: BorderRadius.circular(size == ButtonSize.large ? 12 : 6),
        ),
      ),
    );

    return ShadButton.raw(
      variant: buttonVariant,
      size: buttonSize,
      backgroundColor: buttonTheme.backgroundColor,
      hoverBackgroundColor: buttonTheme.hoverBackgroundColor,
      onPressed: onTap,
      icon: leadingIcon != null
          ? Icon(
              leadingIcon,
              color: indicator == ButtonIndicator.error ? DesignColors.red500 : null,
              size: size == ButtonSize.large ? 24 : 18,
            )
          : null,
      decoration: buttonTheme.decoration,
      child: Text(text, style: textStyle),
    );
  }
}
