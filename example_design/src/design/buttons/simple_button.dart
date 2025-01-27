import 'package:example_design/example_design.dart';
import 'package:flutter/material.dart';

class SimpleButton extends StatelessWidget {
  const SimpleButton({
    super.key,
    required this.text,
    this.onTap,
    this.style,
  });

  final String text;
  final GestureTapCallback? onTap;
  final SimpleButtonStyle? style;

  @override
  Widget build(BuildContext context) {
    final currentStyle = style!;
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          width: 300,
          height: 50,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: currentStyle.defaultColor,
          ),
          child: Center(
            child: Text(text, style: currentStyle.textStyle),
          ),
        ),
      ),
    );
  }
}

class SimpleButtonStyle {
  const SimpleButtonStyle({
    required this.defaultColor,
    required this.textStyle,
  });

  @override
  final Color defaultColor;

  @override
  final TextStyle textStyle;
}

class SimpleButtonTheme {
  static final light = SimpleButtonStyle(
    defaultColor: DesignColors.purple.shade300,
    textStyle: TextStyles.mediumNormalText.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: DesignColors.black,
    ),
  );

  static final dark = SimpleButtonStyle(
    defaultColor: DesignColors.purple.shade300,
    textStyle: TextStyles.mediumNormalText.copyWith(
      fontSize: 18,
      fontWeight: FontWeight.w600,
      color: DesignColors.black,
    ),
  );
}
