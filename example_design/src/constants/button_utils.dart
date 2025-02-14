import 'package:example_design/example_design.dart';
import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';

class ButtonUtils {
  static ({
    ShadButtonSize buttonSize,
    TextStyle textStyle,
    BorderRadius borderRadius,
  }) resolveBySize(ButtonSize size) {
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

    return (
      buttonSize: buttonSize,
      textStyle: textStyle,
      borderRadius: borderRadius,
    );
  }
}
