import 'package:flutter/material.dart';
import 'package:shadcn_ui/shadcn_ui.dart';
import 'package:theme_tailor_annotation/theme_tailor_annotation.dart';

@tailorMixinComponent
class ImageButtonStyle {
  const ImageButtonStyle({
    required this.backgroundColor,
    required this.border,
  });

  @override
  final Color backgroundColor;

  @override
  final ShadBorder border;
}
